
int counter;
int d;
int rate;
int a;

float [] xPos = new float[10000000];
float [] yPos = new float[10000000];

void setup() {
  size(1800, 700);
  fill(204,0,0,10);
  background(255);
  counter=0;
  d=3;
  rate=2;
}

void draw() {
  if(mousePressed) {
    
    xPos [counter] = mouseX;
    yPos [counter] = mouseY;    
    
    for (a=0; a <= counter; a++){
      fill(204,0,0,15);
      ellipse ( xPos[a], yPos[a], d+(counter-a)*rate, d+(counter-a)*rate);
    }
    
    noStroke();
    counter++ ;
  }
   
}

void mouseReleased (){
  counter = 0;
}

