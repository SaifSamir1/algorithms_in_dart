import 'dart:collection';

class Node {
  final int value;
  double distance = double.infinity;
  Node? previous;

  Node(this.value);
}

List<int> dijkstra(
    Map<int, List<Edge>> graph, int startNode, int destinationNode) {
  final visited = Set<int>();
  final queue = Queue<Node>();

  // Create Node objects for each graph node
  final nodes = Map<int, Node>.from(graph.keys); // Use keys from the graph map
  for (final key in nodes.keys) {
    nodes[key] = Node(key);
  }

  nodes[startNode]!.distance = 0; // Set starting node distance to 0
  queue.add(nodes[startNode]!);

  while (queue.isNotEmpty) {
    final currentNode = queue.removeFirst();
    visited.add(currentNode.value);

    if (currentNode.value == destinationNode) {
      // Reached the destination, reconstruct the path
      return reconstructPath(nodes, startNode, destinationNode);
    }

    for (final edge in graph[currentNode.value]!) {
      final neighbor = nodes[edge.to]!;
      final newDistance = currentNode.distance + edge.weight;
      if (!visited.contains(neighbor.value) &&
          newDistance < neighbor.distance) {
        neighbor.distance = newDistance;
        neighbor.previous = currentNode;
        queue.add(neighbor);
      }
    }
  }

  // No path found
  return [];
}

List<int> reconstructPath(
    Map<int, Node> nodes, int startNode, int destinationNode) {
  final path = <int>[];
  var currentNode = nodes[destinationNode]!;
  while (currentNode.value != startNode) {
    path.add(currentNode.value);
    currentNode = currentNode.previous!;
  }
  path.add(startNode);
  path.reversed; // Reverse the path to get the order from start to destination
  return path;
}

class Edge {
  final int to;
  final int weight;

  const Edge(this.to, this.weight);
}

void main(List<String> args) {
  Map<int, List<Edge>> graph = {
    1: [Edge(2, 1), Edge(3, 4)],
    2: [Edge(4, 2), Edge(5, 5)],
    3: [Edge(4, 3)],
    4: [],
    5: [],
  };

  final startNode = 1;
  final destinationNode = 5;

  final cheapestPath = dijkstra(graph, startNode, destinationNode);
  print(cheapestPath);
}
