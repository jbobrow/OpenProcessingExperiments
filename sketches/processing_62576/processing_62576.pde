
float x=400;
float z=0;
boolean OhNo=false;
void setup (){
  size(400, 300);
  smooth();
  noStroke();
}

void draw (){
}

void mouseMoved(){
  WokkaWokka();
  PacMan();
  LittleGuy();
  x--;
}

void mouseDragged(){
  WokkaWokka();
  if (mouseButton==LEFT){
  PacMan();
  z++;
  x+=0.5;
}
  if (mouseButton==RIGHT){
    PacMan();
    z--;
  }
  LittleGuy();
} 


void LittleGuy (){
  colorMode(HSB);
  fill(70);
      if (z>=x){
        OhNo=true;
      }
      if (OhNo==true){
        noFill();
    }
  ellipse(x, 150, 40, 40);
}

void PacMan (){
  noStroke();
  fill(#FFF700);
  ellipse(z, 150, 150, 150);
  fill(#ED4C4C);
  ellipse(z+10, 120, 20, 20);
  fill(255);
  triangle(z, 150, z+75, 120, z+75, 180);
}

void WokkaWokka(){
  background(255);
  for (int i=0; i<=400; i+=30){
    fill(#2A56D1);
    noStroke();
    ellipse(i, 150, 15, 15);
}
}

