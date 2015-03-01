
void setup () {
  size (600, 600);
  background (#FFFFFF);
}

void draw () {
   if(keyPressed) 
    if(key == 'z'){
      stroke(200, 0, 0);
      line(pmouseX, pmouseY, mouseX, mouseY);
  }
   if(keyPressed)
    if(key == 'x'){
     stroke(0, 200, 0);
     line(pmouseX, pmouseY, mouseX, mouseY);
  }
   if(keyPressed)
    if(key == 'c'){
     stroke(0, 0, 200);
     line(pmouseX, pmouseY, mouseX, mouseY);
  }
   if(keyPressed)
    if(key == 'a'){
      triangle(pmouseX-10, pmouseY-10, pmouseX+10, pmouseY+10, pmouseX, pmouseY);
  }
   if(keyPressed)
    if(key == 'q'){
      filter(INVERT);
      ellipse(pmouseX, pmouseY, pmouseX+20, pmouseY+20);
  }
}  



