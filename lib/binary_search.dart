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



class PhoneBook {
  // List to store (name, phone number) pairs
  final List<Map<String, String>> _entries;

  PhoneBook(this._entries);

  // Binary search function to find the phone number for a given name
  String findPhoneNumber(String name) {
    int low = 0;
    int high = _entries.length - 1;

    while (low <= high) {
      // Calculate the middle index
      final int mid = (low + high) ~/ 2;

      // Compare the target name with the middle entry
      final int comparison =
      name.compareTo(_entries[mid]['name']!); // Handle potential null name

      if (comparison == 0) {
        // Name found, return the phone number
        return _entries[mid]['phone number']!;
      } else if (comparison < 0) {
        print(40);
        // Search in the left half
        high = mid - 1;
      } else if (comparison > 0) {
        // Search in the right half
        print(44);
        low = mid + 1;
      }
    }

    return "Name not found";
  }
}

void main() {

  final phoneBookEntries = [
    {"name": "Amir", "phone number": "2161165"},
    {"name": "Bob", "phone number": "6115899"},
    {"name": "Mina", "phone number": "984165"},
    {"name": "Noveer", "phone number": "4916165"},
    {"name": "Siaf", "phone number": "894894"},
    {"name": "vero", "phone number": "4916165"},
    {"name": "Yassa", "phone number": "4916165"},
    {"name": "Zizo", "phone number": "4916165"},
  ];

  final phoneBook = PhoneBook(phoneBookEntries);
  final nameToFind = "Bob";
  final phoneNumber = phoneBook.findPhoneNumber(nameToFind);

  print(phoneNumber);
}