
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}


void draw() {  //draw function loops 
  int[] buckets = new int[100];
  long max = 0;
  int numSums = (int)map(mouseX, 0, width, 1, 100);
  
  for(int i = 0; i < 100000; i++) {
      float num = 0;
      for(int z = 0; z < numSums; z++) num += random(1);
      
      int bucket = (int)map(num, 0, numSums, 0, buckets.length);
      buckets[bucket]++;
      max++;
  }
  background(255);
  for(int i = 0; i < buckets.length; i++) {
      float x = map(i, 0, buckets.length, 0, width);
      rect(x, 0, (width / buckets.length), buckets[i] / max * height * buckets.length / 10);
  }
}
