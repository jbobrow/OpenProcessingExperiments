
boolean c=false;
boolean d=false;
float x=mouseX;
float y=mouseY;
float a;
float b;
float i=400;
float j=550;
float p=135;
float q=206;
float r=250;

void setup(){
  size(1350, 700);
  smooth();
}

void hat(){
  strokeWeight(15);
  stroke(0);
  if(r>25){
  line(x, y, x-40, y+40);
  line(x, y, x+40, y+40);
  }
}

void mouseClicked() {
  c=true;
  a=mouseX;
  b=mouseY;
}
  
void mouseMoved() {
  if(c==false){
  x=mouseX;
  y=mouseY;
  hat();
  }
  if(i>1350||j<0&&r>25){
    p=p-3;
    q=q-3;
    r=r-3;
}}

void mouseDragged(){
  d=true;
}

void mouseReleased() {
  d=false;
}

void words() {
  PFont font;
  font = loadFont("ARCHRISTY-200.vlw");
  textFont(font);
  fill(255);
  if(r>25){
  text("bientot le soleil", 20, 400);
  }
  else{
    text("après le soleil", 80, 400);
  }
}
  
void sun() {
  fill(#FFF68F);
  stroke(#FFF68F);
  if(d==false){
    i++;
    j--;
  }
  else {
    i=i+1+(mouseX-i)/50;
    j=j+1+(mouseY-j)/50;
  }
  ellipse(i, j, 70, 70);
}

void draw() {
  background(p, q, r);
  words();
  if(c==true) {
    x=a;
    y=b;
    hat();
  }
  sun();
}

