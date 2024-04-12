import 'dart:collection';

class Node {
  final int value;
  final List<Node> neighbors;
  const Node(this.value, this.neighbors);
}

List<int> bfs(Node startNode) {
  final visited = Set<int>(); // Keep track of visited nodes
  final queue = Queue<Node>(); // Queue for BFS traversal

  queue.add(startNode);
  visited.add(startNode.value);

  final List<int> result = [];
  while (queue.isNotEmpty) {
    final currentNode = queue.removeFirst();
    result.add(currentNode.value);

    for (final neighbor in currentNode.neighbors) {
      if (!visited.contains(neighbor.value)) {
        queue.add(neighbor);
        visited.add(neighbor.value);
      }
    }
  }

  return result;
}

void main() {
  // Sample graph construction (modify as needed)
  final node1 = Node(1, [
    Node(2, []),
    Node(3, [Node(4, [])])
  ]);
  final node2 = Node(2, [node1]);
  final node3 = Node(3, [node1, Node(4, [])]);
  final node4 = Node(4, [node3]);

  // Perform BFS traversal
  final traversal = bfs(node2);
  print(traversal.reversed); // Output: [1, 2, 3, 4] (order may vary)
}
