
void setup()
{
   size(450,450);
   background(15,2,31);
}
void draw(){
  
 if(key == 'm'){
 background(random(255),random(255),random(255));
}
 
 
  fill(131,67,206);
  ellipse(mouseX, mouseY,14,14);
  fill(227,11,80);
  ellipse(width-mouseX, height-mouseY,14,14);
}


