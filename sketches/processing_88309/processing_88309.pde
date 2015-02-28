
void setup(){
size (500, 500);
smooth ();
}

void draw(){
float ypos= 0;
float xpos= 0;
float v = mouseY;
float vv = mouseX;
float vvv = mouseX+mouseY;
background (255);
 
strokeWeight (2);
 
for (int i=0; i<500; i+=3) {
  line (0, ypos, width, ypos);
  ypos= ypos+ 5;
 
  if (i< vvv) {
    stroke (255-vv);
  }

 
  else {
    stroke (v,255);
    line(random(500),xpos,random(500),ypos);
  }
}
 
strokeWeight (5);
for (int i=0; i<500; i+=2) {
  stroke (255);
  line (xpos, v, xpos, 500);
  xpos= xpos+ 10;
}

}


