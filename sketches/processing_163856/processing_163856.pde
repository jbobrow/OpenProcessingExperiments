


void setup(){
  size(640, 360);
  background(51);
  noStroke();
}

void draw(){
  //pandas(float xloc, float yloc, int size, int num)
  pandas(width*0.25,height*0.4,200,4); // example A below
  pandas(width*0.5, height*0.5, 300,10);
  pandas(width*0.75, height*0.3, 120,6);
}

void pandas(float xloc, float yloc, int size, int num){
  // A:  x = 63.75
  float x = 255/num;
  // A: steps = 50
  float steps = size/num;
  // A: i = 0,1,2,3
  for (int i = 0; i < num; i++) {
    // A: fill = 0 * 63.75 (0), 1 * 63.75 (63.75), 2 * 63.75 (127.5), 3 * 63.75 (191.25)
    fill(i*x);
    //A: ellipse(160, 144, 200 - (0,1,2,3 * 50), 200 - (0,1,2,3 * 50)  
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}


