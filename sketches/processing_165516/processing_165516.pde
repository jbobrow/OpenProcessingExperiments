
void setup (){
  size (200, 200);
  strokeWeight (8);
  smooth ();
}

void draw (){
  background (255);
  line (mouseX, mouseY, pmouseY, pmouseX+20);
  line (width-mouseX,height-mouseY,height-pmouseY,width-pmouseX+20);
  ellipse (mouseX, mouseY,8,8);
  ellipse (mouseY, mouseX+20, 4,4);
  stroke (mouseX+11, mouseY+20, mouseY);
  ellipse (width-mouseX,height-mouseY, 8,8);
  ellipse (height-pmouseY,width-pmouseX+20, 4,4);
  stroke (mouseX, mouseY+30, mouseY);

  line (mouseX-30, mouseY, pmouseY, pmouseX+20);
  line (width-mouseX+30,height-mouseY,height-pmouseY,width-pmouseX+20);
  ellipse (width-mouseX,height-mouseY, pmouseX,pmouseX);
  ellipse (height-pmouseY,width-pmouseX+20, pmouseY, pmouseY);
  stroke (mouseX, pmouseY+30, mouseY);
  strokeWeight (map (pmouseY, 0, 200, 4,25));
}


