
//Monica Crozier Moire_1

int Hueval = 0;     //Hueval from Processing for Visual Artists
int Satval = 50;   //Hueval from Processing for Visual Artists
int Brival = 250;   //Hueval from Processing for Visual Artists
color MyColor;      //Hueval from Processing for Visual Artists

float ax = 350;  float ay = 200;
float bx = 320;  float by = 270;
float cx = 335;  float cy = 255;
float dx = 350;  float dy = 280;
float ex = 365;  float ey = 255;
float fx = 380;  float fy = 270;

float i=-100;

float s=10;


void setup() {
  size(700, 400);
  background(0);
  
  colorMode(HSB);                          //Hueval from Processing for Visual Artists
  MyColor = color(Hueval, Satval, Brival); //Hueval from Processing for Visual Artists
  colorMode(RGB);   //Hueval from Processing for Visual Artists
  }





void draw() {
   
   drawColorFade();
   drawCrownHorizontal();
   drawManyCrowns();
   drawCircleVertical();
 }



void drawMoveCrown(){ //positions crown in upper right
  pushMatrix();
  translate(-316,-200);
  drawCrown();
  stroke(MyColor);
  popMatrix();
}




void drawCrown() { //draws crown shape
  beginShape();
  vertex(ax,ay);
  vertex(bx,by);
  vertex(cx,cy);
  vertex(dx,dy);
  vertex(ex,ey);
  vertex(fx,fy);
  endShape(CLOSE);
  noFill();
  stroke(MyColor);
  strokeWeight(1);
  
}

void drawColorFade() { //fades colors
   frameRate(20);
   Hueval = (Hueval+1) % 256;                //Hueval from Processing for Visual Artists
   colorMode(HSB);                           //Hueval from Processing for Visual Artists
   MyColor = color(Hueval, Satval, Brival);  //Hueval from Processing for Visual Artists
   colorMode(RGB);   //Hueval from Processing for Visual Artists
   
}

void drawCrownHorizontal() {
  frameRate(50);
  i = (i += .95);
  pushMatrix();
  translate(i,0);
  stroke(MyColor);
  drawMoveCrown();
  popMatrix();
}

void drawManyCrowns(){
  {pushMatrix();
  translate (0, 80);
  drawCrownHorizontal();
  popMatrix();}
  
  {pushMatrix();
  translate (0, 160);
  drawCrownHorizontal();
  popMatrix();}
  
  {pushMatrix();
  translate (0, 240);
  drawCrownHorizontal();
  popMatrix();}

  {pushMatrix();
  translate (0, 320);
  drawCrownHorizontal();
  popMatrix();}
} 

void drawCircleVertical(){
  frameRate(20);
  s = (s += 10);
  pushMatrix();
  translate(width/2, s);
  ellipse(0,0,200,200);
  stroke(344, 63,63);
  popMatrix();
}
  
  



