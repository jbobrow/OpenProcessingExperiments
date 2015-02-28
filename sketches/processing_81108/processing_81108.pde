
void setup()
{
  size(1000,1000);
  background(0,0,0);
}

void draw()
{
  if(mousePressed){
  fill(255,0,210);
  ellipse(mouseX,mouseY,20,20);
  fill(255,0,210);
  ellipse(width-mouseX,height-mouseY,20,20);
}  
  if(key == '1'){
  background(random(255),random(255),random(255));
}
  if(key == '2'){
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,20,20);
  fill(random(255),random(255),random(255));
  ellipse(width-mouseX,height-mouseY,20,20);
}
  if(key == '3'){
  background(100,140,250);
  fill(0,0,0);
  ellipse(mouseX,mouseY,40,40);
  fill(255,255,255);
  ellipse(width-mouseX,height-mouseY,40,40);
  
}
  


}
  


