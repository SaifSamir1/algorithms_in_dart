List<int> quickSort(List<int> data) {
  if (data.length <= 1) {
    return data; // Base case: list with 0 or 1 element is already sorted
  }

  final pivot = data[0];
  final left = data.where((element) => element < pivot).toList();
  final right = data.where((element) => element > pivot).toList();
  
  final leftSorted = quickSort(left);
  final rightSorted = quickSort(right);

  return [...leftSorted, pivot, ...rightSorted];
}

void main() {
  final unsortedList = [7, 2, 1, 8, 6, 3, 5, 4];
  final sortedList = quickSort(unsortedList);
  print(sortedList); 
}
