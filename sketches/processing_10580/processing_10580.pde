

class WeightedMovingAverager {
  private int n;
  private LinkedList items = new LinkedList();
  
  WeightedMovingAverager(int n) {
    this.n = n;
  }
  
  public float add(float x) {
    items.add(x);
    if (items.size() > n) { items.remove(); }
    
    int size = min(items.size(), n);
    
    float sum = 0;
    for (int i = 0; i < size; i++) {
      sum += ((Float)items.get(i) * i);
    }
    
    return sum / (size * (size+1) / 2);
  }
}

