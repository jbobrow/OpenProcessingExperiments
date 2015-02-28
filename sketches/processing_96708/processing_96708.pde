
int[] bucket;
float max = 10000;
float mean = 450;
float min = 0;
float div = 4;
float dev = 200;

void setup() {  //setup function called initially, only once
  size(400, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  bucket = new int[100];
}

void draw() {  //draw function loops 
  
  stroke(255,0,0);
  int meanInt = int(mean/div);
  line(meanInt, 0, meanInt, 250);
  
  float val = rnd(); // -1 -> 1;
  val = val * dev + mean;
  if(val < min || val > max) {
      return;
  }
  
  int valInt = int(val);
  if(!bucket[valInt]) bucket[valInt] = 0;
  
  bucket[valInt] = bucket[valInt] + 1;
  stroke(0);
  
  int xVal = int(val/div);
  
  line(xVal, 0, xVal, bucket[valInt] * 2);
  //line(0,0,200,200);
  //point(valInt + 10, bucket[valInt] + 10);
  
}

float rnd() {
    float val = (random(-1,1) + random(-1,1) + random(-1,1)) / 3;
    return val;
}
