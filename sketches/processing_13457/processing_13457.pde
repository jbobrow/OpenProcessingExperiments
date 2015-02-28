


void setup() {
  size(640, 480);
  background(0);
  smooth();
 // noCursor();
  noStroke();
  fill(240);

}

void draw (){
  background(0);
  
    //eye corners
  fill(100);
  triangle(260, 244,   270, 299,   230, 313);
  triangle(382, 247,   367, 301,   412, 314);
  
  
  
  //eyeballs
 fill(204, 204- (mouseY/6), 102 -mouseX/6);
 ellipse (width/4, height/2, 200, 200);
  ellipse ((3*width)/4, height/2, 200, 200);
  
  
  //pupils
  /*  {
  float mx = constrain (mouseX, (width/4)-60, (width/4)+55);
  float my = constrain(mouseY, (height/2)-50, (height/2)+50);
  fill(153, 204, 0, 120);
  ellipse (mx, my, 150, 150);
  float mx2 = constrain (mouseX, ((width/4)*3)-55, ((width/4)*3)+60);
  float my2 = constrain(mouseY, (height/2)-50, (height/2)+50);
  fill(153, 204, 0, 120);
  ellipse (mx2, my2, 150, 150);
  }*/
  fill(0);
  if (mousePressed==false)
  {
  float mx = constrain (mouseX, (width/4)-60, (width/4)+55);
  float my = constrain(mouseY, (height/2)-50, (height/2)+50);
  fill(0);
  ellipse (mx, my, 30, 150);
  float mx2 = constrain (mouseX, ((width/4)*3)-55, ((width/4)*3)+60);
  float my2 = constrain(mouseY, (height/2)-50, (height/2)+50);
  fill(0);
  ellipse (mx2, my2, 30, 150);
  }
 if (mousePressed==true)
 {
   if (mouseButton==LEFT){
  float mx = constrain (mouseX, (width/4)-60, (width/4)+55);
  float my = constrain(mouseY, (height/2)-50, (height/2)+50);
       fill(0);
  ellipse (mx, my, 10, 150);
  float mx2 = constrain (mouseX, ((width/4)*3)-55, ((width/4)*3)+60);
  float my2 = constrain(mouseY, (height/2)-50, (height/2)+50);
  fill(0);
  ellipse (mx2, my2, 10, 150);
   }
   }   if (mouseButton==RIGHT){
        float mx = constrain (mouseX, (width/4)-60, (width/4)+35);
  float my = constrain(mouseY, (height/2)-50, (height/2)+50);
       fill(0);
  ellipse (mx, my, 70, 150);
  float mx2 = constrain (mouseX, ((width/4)*3)-35, ((width/4)*3)+60);
  float my2 = constrain(mouseY, (height/2)-40, (height/2)+50);
  fill(0);
  ellipse (mx2, my2, 70, 150);
    }

  


fill(0);
quad(354, mouseY/4+ 208,   354, 0,   583, 0,    583, mouseY/4 +60);
  quad(286, mouseY/4+ 208,   286, 0,   57, 0,    57, mouseY/4 +60);
  
  println (mouseX + "," + mouseY);
  
 
  if (mousePressed==true){
    if (mouseX<340 && mouseX >140){
    fill(0);
quad(354, mouseY/4+ 208,   354, 0,   583, 0,    583, mouseY/2 +110);
  quad(286, mouseY/4+ 208,   286, 0,   57, 0,    57, mouseY/2 +110);
    }
  }
  
}


