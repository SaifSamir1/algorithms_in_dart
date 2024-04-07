int binarySearch(List list, target) {
  int low = 0;
  int high = (list.length) - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    if (list[mid] == target) {
      return mid;
    } else if (list[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}

void main() {}
