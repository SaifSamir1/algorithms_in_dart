import 'dart:collection';

List<int> bfs(Map<int, List<int>> graph, int startNode, int destinationNode) {
  final visited = Set<int>(); // Keep track of visited nodes
  final queue = Queue<int>(); // Queue for BFS traversal

  queue.add(startNode);
  visited.add(startNode);

  final previousNode = Map<int, int>(); // Track the path for each visited node

  while (queue.isNotEmpty) {
    final currentNode = queue.removeFirst();

    if (currentNode == destinationNode) {
      // Reached the destination, reconstruct the path
      return reconstructPath(previousNode, startNode, destinationNode);
    }

    for (final neighbor in graph[currentNode]!) {
      if (!visited.contains(neighbor)) {
        queue.add(neighbor);
        visited.add(neighbor);
        previousNode[neighbor] =
            currentNode; // Store the previous node for path reconstruction
      }
    }
  }

  // No path found
  return [];
}

List<int> reconstructPath(
    Map<int, int> previousNode, int startNode, int destinationNode) {
  final path = <int>[];
  var currentNode = destinationNode;
  while (currentNode != startNode) {
    path.add(currentNode);
    currentNode = previousNode[currentNode]!;
  }
  path.add(startNode);
  path.reversed;
  return path;
}

void main() {
  // the graph
  final Map<int, List<int>> graph = {
    1: [2, 3],
    2: [4, 5],
    3: [4],
    4: [],
    5: [],
  };

  final startNode = 2;
  final destinationNode = 5;

  final shortestPath = bfs(graph, startNode, destinationNode);

  if (shortestPath.isEmpty) {
    print('No path found from $startNode to $destinationNode');
  } else {
    print(
        'Shortest path from $startNode to $destinationNode: ${shortestPath.reversed}');
  }
}
