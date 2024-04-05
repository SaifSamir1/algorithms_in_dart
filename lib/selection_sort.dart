



void selectionSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j;
      }
    }

    // Swap elements at i and minIndex
    if (minIndex != i) {
      int temp = list[i];
      list[i] = list[minIndex];
      list[minIndex] = temp;
    }
  }
}
void main() {
  var numbers = [64, 34, 25, 12, 22, 11, 90];
  print("Original list: $numbers");

  selectionSort(numbers);

  print("Sorted list: $numbers");

}