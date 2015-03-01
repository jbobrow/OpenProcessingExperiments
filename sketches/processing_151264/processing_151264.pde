
void setup() {
  size (800,600);
  background (200);
  rectMode(CORNER);
  noStroke();
  frameRate(1);
}

int num=5; //random number of square
int gap=10; //random number of gap between square
int sizeW=750;
int sizeH=550;
float csizeH = (sizeH - (num+1) * gap) / (float)num;
float csizeW = (sizeW - (num+1) * gap) / (float)num;

void draw() {

background (0);


for (int i=0; i<num; i++) {
  
  for (int j=0; j<num; j++) {
    int col=(int) random(10,50);
    int alpha=(int) random(1,100);
      fill(247+col, 57-col, 57+col);
      float x=(400-sizeW/2) + gap * (i+1) + csizeW*i;
      float y=(300-sizeH/2) + gap*(j+1) + csizeH*j;
      rect( x, y, csizeW, csizeH, alpha)  ;
       fill(col, 10+col, 80-col);
       ellipse(x+csizeW/2, y+csizeH/2, csizeW/200*alpha, csizeW/200*alpha);
     
   
    
  }
}
// save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("25things.jpg");
  }
}

