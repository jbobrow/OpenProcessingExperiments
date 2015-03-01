
void setup(){
  size(500,500);
  background (255);
  
}
 
void draw(){  if (mousePressed){
translate( mouseX, mouseY);
rotate(random(2*PI));
  fill(120,mouseY,400,20);
  noStroke();
  ellipse(30,30,150,50);
}
}

void keyReleased()
{  if (key=='s' || key=='S')
{    background(255);
 
}
}
