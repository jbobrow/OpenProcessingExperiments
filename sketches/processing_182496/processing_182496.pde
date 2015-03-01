
int num = 125;
int[] maxSize = new int[num];
float[] offSet = new float[num];
float theta, sz, x; 

void setup() {
  size(500, 500);
  noStroke();
  fill(255);

  for (int i=0; i<num; i++) {
    maxSize[i]=(int) random(100, 1200);
    offSet[i]= random(TWO_PI);
  }
}


void draw() {
  background(20);
  for (int i=0; i<maxSize.length; i++) {
    sz = map(sin(theta+offSet[i]*i), -1, 1, maxSize[i]/10.0, maxSize[i]);
    x = map(sin(theta+offSet[i]), -1, 1, 150, 350-maxSize[i]);
    rectMode(CENTER);
    rect(width/2, (height/num)*i, sz, 2);
    rectMode(CORNER);
    rect(x, (height/num)*i, maxSize[i], 1);
  }
  theta += 0.0523;
  
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
   
}

