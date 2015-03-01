
float es = 20;
float ex,ey;
boolean over = false;
boolean locked = false;
float xoff, yoff;
PImage webImg;

void setup(){
    size(490,557);
    ex = width-180;
    ey = height-2;
    String url = "http://s18.postimg.org/w9ovmuzh5/maze1.png";
  webImg = loadImage(url);
    image(webImg, 0, 0);
}
 
void draw(){
background(255);
image(webImg, 0, 0);
  if(dist(mouseX,mouseY,ex,ey) < es/2){
     fill(81,177,237);
     over = true;
  }
  else{
     fill(9,135,214);
     over = false;
  }
   
  ellipse(ex, ey,  es,es);
}
void mousePressed(){
   if(over){
      locked = true;
      xoff = mouseX-ex;
      yoff = mouseY-ey;
   }
}
void mouseDragged(){
   if(locked){
      ex = mouseX-xoff;
      ey = mouseY-yoff;
   }  
}
void mouseReleased(){
   locked = false;
   image(webImg, 0, 0);
}
