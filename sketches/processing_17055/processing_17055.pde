
void setup(){
  size(800,300);
  background(0);
  smooth();
}
void draw(){
  noStroke();
   float x = random(800);
   float y = random(300);
  if(mouseX<300)
    {fill(0,0,210);}
  else {
  if(mouseX<500)
    {fill(210);}
    else {
    {fill(210,0,0);}
    }
   if (mousePressed){
      background(0);
    }
  }
    ellipse(x,y,5,5);
}

