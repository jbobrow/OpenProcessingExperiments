
//Adrianne Born
//Arrays/Loops
//11 March 2013


int num_of_ellipse = 200;
float[] elX = new float[num_of_ellipse];
float[] elY = new float[num_of_ellipse];
float[] elSpeed = new float[num_of_ellipse];
float gravity = .3;
 
int currentClick = 0;
void setup() {
  size(350, 550);
}
 
void draw() {
  background(211, 245, 27);
  fill(12,37,247);
  ellipse(width/2, 400, 300, 300);
  fill(255);
  ellipse(width/3,height/2,100,100);
  ellipse(230,height/2, 100,100);
  fill(0);
  ellipse(100,height/2,50,50);
  ellipse(240,300,50,50);
  fill(245,175,177);
  ellipse(width/2,400,150,80);
  fill(0);
  ellipse(width/2, 500,250,70);
  
  for (int i = 0; i < num_of_ellipse; i++) {
    drawMyStuff(elX[i], elY[i]);
    elY[i] += elSpeed[i];
    elSpeed[i] += gravity;
  }
}
 
void drawMyStuff(float x, float y) {
  
    if (mouseY<535) {
 
  fill(234, 203,97);
  ellipse(x, y, 50, 50);
  fill(0);
  ellipse(x+10, y-10,10,10);
  ellipse(x-5, y+2,8,8);
  ellipse(x-15,y-3,11,11);
  ellipse(x+15, y+15,8,8);
  ellipse(x+2,y-2,5,5);
  stroke(134,107,18);
    }
}
 
void mouseDragged() {
  elX[currentClick] = mouseX;
  elY[currentClick] = mouseY;
  elSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipse) {// == 20
    currentClick =0;
  }

}

