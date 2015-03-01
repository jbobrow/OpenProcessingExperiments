
float r,g,b;
void 
setup()
{
  size(400,400);
  background(0);
  strokeWeight(5);
  stroke(255);
}
void 
draw()
{
  fill(#F3FC00);
  rect(0,0,40,40);
  fill(#C025CB);
  rect(40,0,40,40);
  fill(#FC00DB);
  rect(80,0,40,40);
  fill(#00FCC8);
  rect(120,0,40,40);
  fill(#14FC00);
  rect(160,0,40,40);
  fill(r,g,b);
  r=random(0,120); 
  g=random(0,60);
  b=random(6,255);
  rect(200,0,40,40);
  if (mousePressed)
  {
  line(pmouseX,pmouseY,mouseX,mouseY);
  if (mousePressed)
    {
      if((mouseX>0)&&(mouseX<40) && (mouseY<40)){
       stroke(#F3FC00);}
      else if((mouseX>40)&&(mouseX<80) && (mouseY<40)){
       stroke(#C025CB);}
      else if((mouseX>80)&&(mouseX<120) && (mouseY<40)){
       stroke(#FC00DB);}
      else if((mouseX>120)&&(mouseX<160) && (mouseY<40)){
       stroke(#00FCC8);}
      else if((mouseX>160)&&(mouseX<200) && (mouseY<40)){
       stroke(#14FC00);}
      else if((mouseX>200)&&(mouseX<240) && (mouseY<40)){
       stroke(r,g,b);
         r=random(0,120);
         g=random(0,60);
         b=random(6,255);}
    }
   }
}
