import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphview/graphview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

/*const jsonData = {
  "nodes": [
    {"id": 2, "name": 'ellipse'},
    {"id": 3, "name": 'Clade'},
    {"id": 4, "name": 'box'},
    {"id": 5, "name": 'Clade'},
    {"id": 7, "name": 'Clade'},
    {"id": 8, "name": 'triangle'},
    {"id": 9, "name": 'triangle'},
    {"id": 10, "name": 'triangle'},
    {"id": 11, "name": 'triangle'},
    {"id": 12, "name": 'triangle'},
    {"id": 13, "name": 'triangle'},
  ],
  "edges": [
    {"from": 2, "to": 3},
    {"from": 2, "to": 4},
    {"from": 2, "to": 5},
    {"from": 5, "to": 7},
    {"from": 5, "to": 8},
    {"from": 3, "to": 9},
    {"from": 3, "to": 10},
    {"from": 7, "to": 11},
    {"from": 7, "to": 12},
    {"from": 7, "to": 13},
  ]
};*/

class TreeViewPage extends StatefulWidget {
  const TreeViewPage({Key? key}) : super(key: key);

  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  Map<String, dynamic> jsonData = {};
  loadJson() async {
    String jsonContent = await rootBundle.loadString('assets/data/B_8.json');
    jsonData = jsonDecode(jsonContent);
  }

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });

    for (var element in jsonData['edges']!) {
      var fromNodeId = element['from'];
      var toNodeId = element['to'];
      graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId));
    }

    builder
      ..siblingSeparation = (20)
      ..levelSeparation = (20)
      ..subtreeSeparation = (20)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_LEFT_RIGHT);

    setState(() {});
  }

  Widget rectangleWidget(a) {
    return InkWell(
      onTap: () {
          if (kDebugMode) {
            print('clicked');
          }
      },
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(color: Colors.lightGreen, spreadRadius: 1),
            ],
          ),
          child: Text('$a')
      ),
    );
  }

  Widget emptyWidget() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: 500,
          height: 500,
          child: InteractiveViewer(
              constrained: false,
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.01,
              maxScale: 10,
              child: jsonData.keys.isEmpty?Container():GraphView(
                graph: graph,
                algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.black
                  ..strokeWidth = 2
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key!.value as int;
                  var nodes = jsonData['nodes'];
                  var nodeValue = nodes!.firstWhere((element) => element['id'] == a);
                  if (nodeValue['name'] != 'Clade') {
                    return rectangleWidget(nodeValue['name'] as String);
                  } else {
                    return emptyWidget();
                  }
                  },
              )
          ),
        )
    );
  }
}