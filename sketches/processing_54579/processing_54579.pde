
PImage b;
float[] xCoords = new float[500];
float[] yCoords = new float[500];

float[] xMove = new float[500];
float[] yMove = new float[500];

void setup() {
 size(400,400);
  b = loadImage("pattern.jpg");
  for(int i = 0; i <500; i++) {
    xCoords[i]= random(width);
     yCoords[i]= random(height);
      xMove[i]= random(-1,1);
       yMove[i]= random(-3,1);
      
}
}
void draw() {
  image(b, 0, 0);
 for(int i = 0; i<500; i++) {
  fill(random(0,50),random(0,50),random(0,250),100);
  stroke(0,0,random(150,250));
   ellipse(xCoords[i], yCoords[i],10,10);
    xCoords[i]+= xMove [i];
    yCoords[i]+= yMove [i];
    if (xCoords[i]>width && xCoords[i]<0){
      xMove [i] = xMove [i] * -1;
      
    }
}
}

