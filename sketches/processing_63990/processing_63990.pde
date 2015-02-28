
ArrayList<TheInt> list;

void setup() {
  size(600, 400);
  
  list = new ArrayList<TheInt>();
  
  fill(0);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  
  list.add(new TheInt((int) random(0, 100)));
  
  int[] count = new int[100];
  
  for(int i = 0; i < list.size(); i ++) {
    count[list.get(i).value] ++;
  }
  
  for(int i = 0; i < count.length; i ++) {
    rect(i * 6, height, 6, -count[i] * 6);
  }
}

class TheInt{
  int value;
  
  TheInt(int v){
    value= v;
  }
}
