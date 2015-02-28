
class Queue {
  int maxLength;
  int current=0;
  int[] data; 

  Queue(int l) {
    maxLength=l;
    current = 0;
    data = new int[l];
  }
  
  void add(int value) {
    if(current==maxLength-1) {
      for(int i=0;i<maxLength-1;i++) {
        data[i]=data[i+1];
      }
    } else {
      current++;
    }
    data[current-1] = value;
    
  }
  
  int average() {
    int avg = 0;
    for(int i=0;i<current-1;i++) {
        avg+=data[i];
    }
    return avg/current;
  }
}

