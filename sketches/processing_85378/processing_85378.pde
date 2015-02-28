
void setup() {
   size(480,480);
   smooth();
}
void draw()  {
  if (mousePressed)  {
      fill(random(160),random(180),random(200));
  }else  {
      fill(180);
       background((20),(20),(20));
  }
  ellipse(mouseX,mouseY,20,80);
  ellipse(mouseX,mouseY,80,20);
}



