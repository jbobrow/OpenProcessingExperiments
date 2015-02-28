
int num = 125;
int[] maxSize = new int[num];
float[] offSet = new float[num];
float theta, sz, x; 
color[] palette = {
  #F58F12, #0B9EE7, #4EA731, #F4D910, #F334E3
};

void setup() {
  size(500, 500);
  noStroke();
  fill(255,50);

  for (int i=0; i<num; i++) {
    maxSize[i]=(int) random(50, 120);
    offSet[i]= random(TWO_PI);
  }
}


void draw() {
  background(20);
  for (int i=0; i<maxSize.length; i++) {
    fill(palette[i%5],100);
    x = map(sin(theta+offSet[i]), -1, 1, 150, 350-maxSize[i]);
    rectMode(CORNER);
    rect(x, (height/num)*i, maxSize[i], 50,20);
  }
  theta += 0.0523/2;
  
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
   
}

