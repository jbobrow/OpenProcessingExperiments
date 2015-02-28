
//ivy lin
//15/2/11

float x;
float y;
int directionx;
int directiony;
int value =255 ;

void setup() {
  size(580,600);
  background(0);
  smooth();
  y=0;
  directiony=1;
}

void draw() {
  background(250);
  fill(value);
  rect(0,0, 290, 600);
  rect(0,300,290,300);
  //loop
  for(int j =0; j<height; j+=10) {
    fill(0);
    rect(0,j,600,5);
  }
  y +=directiony;
  noStroke();
  fill(250);
  rect(0,y,40,20);
  rect(120,y,40,20);
  rect(240,y,40,20);
  rect(360,y,40,20);
  rect(480,y,40,20);
  fill(0);
  rect(60,y,40,20);
  rect(180,y,40,20);
  rect(300,y,40,20);
  rect(420,y,40,20);
  rect(540,y,40,20);
  println(x);
  if(y<0) {
    directiony=1;
  }
  if(y>height) {
    directiony=-1;
  }  
}
void mouseMoved() {
    value = value -1;
    if (value <20) {
    value = 20;
    }
}




