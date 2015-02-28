
float angle=0.0;
int r;
int g;
int b;
boolean colorchange;

void setup() {
  size(400,400);
  background(0);
  stroke(0);
  r=100;
  g=50;
  b=150;
  colorchange=false;
}

void draw(){
  fill(r,g,b);
  
  if(mousePressed==true){
  translate(mouseX,mouseY);
  rotate(angle);
  rect(0,0,mouseX/4,mouseY/4);
  angle+=0.07;
  
    if(!colorchange){
      r++;
      g--;
      b--;
    }else if (colorchange) {
    r--;
    g++;
    b++;
    }
    if(g<=0 || g>=255) {
      colorchange= !colorchange;
    } 
  }
  
  if (keyPressed) {
    if(key==' ');{
      background(0);
     }
  }
}

  
  


