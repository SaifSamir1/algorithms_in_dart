/// The head is considered a node, so we start the Linked List with it, and its
/// index is 0, the next nodes are 1, and so on.

class Node {
  final String data;
  Node? next;

  Node(this.data, [this.next]);
}

void addAtBeginning(Node head, String value) {
  Node newNode = Node(value);
  if (head.next != null) {
    newNode.next = head.next;
    head.next = newNode;
  }
  head.next = newNode;
}

void addAtEnd(Node head, String value) {
  Node pointer = head;
  while (pointer.next != null) {
    pointer = pointer.next!;
  }
  pointer.next = Node(value);
}

void addAtAnyPosition(Node head, int position, String value) {
  Node pointer1 = head;
  Node pointer2 = head;
  Node newNode = Node(value);
  if (head.next == null) {
    addAtBeginning(head, value);
  }
  for (int i = 1; i < position - 1; i++) {
    if (pointer1.next == null && pointer2.next == null) {
      print('inValide position : $position ');
      break;
    }
    pointer1 = pointer1.next!;
    pointer2 = pointer2.next!;
  }
  if (pointer2.next != null) {
    pointer2 = pointer2.next!;
    newNode.next = pointer2;
    pointer1.next = newNode;
  }
}

void deleteAtBeginning(Node head) {
  if (head.next == null) {
    print('List is empty');
    return;
  }

  Node pointer = head;
  pointer = pointer.next!.next!;
  head.next = pointer;
}

void deleteAtEnd(Node? head) {
  if (head == null) {
    print('List is empty');
    return;
  }

  if (head.next == null) {
    head = null;
    return;
  }

  Node pointer = head;
  while (pointer.next!.next != null) {
    pointer = pointer.next!;
  }
  pointer.next = null;
}

void deleteAtPosition(Node head, int position) {
  if (head.next == null) {
    print('List is empty');
    return;
  }

  if (position == 1) {
    deleteAtBeginning(head);
    return;
  }

  Node pointer = head;
  int count = 1;
  while (pointer.next != null && count < position - 1) {
    pointer = pointer.next!;
    count++;
  }

  if (pointer.next == null || pointer.next == null) {
    print('Invalid position: $position');
    return;
  }

  final temp = pointer.next!;
  pointer.next = temp.next;
  temp.next = null; // Avoid memory leaks
}

void desplayLinkedList(Node head) {
  Node pointer = head;
  while (pointer.next != null) {
    print(pointer.data);
    pointer = pointer.next!;
  }
  print(pointer.data);
}

void main() {
  Node head = Node('the head node');
  addAtBeginning(head, "Amir");
  addAtEnd(head, "bob");
  addAtEnd(head, "Jon");
  addAtEnd(head, "saif");
  addAtEnd(head, "samir");
  addAtAnyPosition(head, 3, 'Saleh');
  deleteAtPosition(head, 3);
  desplayLinkedList(head);
}
