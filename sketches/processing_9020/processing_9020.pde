
int x = 180;
int lefteyeX = (226);
int righteyeX= (406);
int c1= 100;
int transparency = 0;
int c2=100;
int yMax = 100;
int yMin= 100;
int r = 255;

void setup () {

  size (640,480);
  strokeWeight (3);
  smooth ();
}

void draw () {

  background (240, 216,189); 

  fill (169, 197, 242);
  ellipse (lefteyeX, 180, 100, 100);
  ellipse (righteyeX, 180, 100, 100);
  noFill();
 noStroke();
 fill(255, r, r);
   ellipse (lefteyeX, 187, 85,85);
   ellipse (righteyeX, 187,85,85);
 fill(32, 118, 61);
   ellipse (lefteyeX, 183, 62, 62);
   ellipse (righteyeX,183, 62, 62);
 fill (102,162,59);
   ellipse (lefteyeX, 188, 52, 52);
   ellipse (righteyeX, 188, 52, 52);
 fill(255);
 //eyeballs_____________________________________________________________________
 //lefteye 
  float d = dist (mouseX, mouseY,lefteyeX, 183);
  d = constrain (d, 0, 19);
  float a = atan2 (mouseY-183, mouseX-lefteyeX);
  float x1 =lefteyeX + cos (a) * d;
  float y1 =183 + sin(a) *d;
  ellipse (x1, y1, 25, 25);
 //righteye
  float dr = dist (mouseX, mouseY,righteyeX, 183);
  dr = constrain (d, 0, 19);
  float a2 = atan2 (mouseY-183, mouseX-righteyeX);
  float x2 =righteyeX + cos (a2) * dr;
  float y2 =183 + sin(a2) *dr;

 ellipse (x2, y2, 25, 25);
 
 
 x = constrain (x, -1500, 180);
transparency = constrain (transparency, 0, 100);

 
 //Eyelids & Bags_____________________________________________________________
 if (mousePressed) {
   
   fill (240, 216,189);
   ellipse (lefteyeX, x--, 100, 100);
   ellipse (righteyeX, x--, 100, 100); 
   
   fill (112, 100, 91, transparency++);
   bezier (184, 225, 184, 242, 218, 248, 260, 247);
   bezier (382, 247, 426, 248, 460, 242, 458, 225); 
   
 }else{
     fill (240, 216,189);
  
   ellipse (lefteyeX, x++, 100, 100);
   ellipse (righteyeX, x++, 100, 100);

 fill (112, 100, 91, transparency--);

   bezier (184, 225, 184, 242, 218, 248, 260, 247);
   bezier (382, 247, 426, 248, 460, 242, 458, 225);

 }
   
 stroke (0);
  noFill();
  ellipse (226, 180, 100, 100);
  ellipse (406, 180, 100, 100);

    
//eyebrows___________________________________________________
 
 c1= constrain (c1,yMin, yMax);
 c2= constrain (c2, yMin, yMax); 

if  ((mousePressed) && (x < -900)) {
      yMax= 138;
      beginShape ();
    curveVertex(175, 138);
    curveVertex(192, 100);
    curveVertex (257, (c2)++);
    curveVertex (274,138 );
   endShape ();
  beginShape ();
    curveVertex(355, 138);
    curveVertex(372, (c1)++);
    curveVertex (437, 100);
    curveVertex (454,138 );
  endShape();
}else if  ((mousePressed) && (x < -750)) {
      yMax= 135;
      beginShape ();
    curveVertex(175, 138);
    curveVertex(192, 100);
    curveVertex (257, (c2)++);
    curveVertex (274,138 );
   endShape ();
  beginShape ();
    curveVertex(355, 138);
    curveVertex(372, (c1)++);
    curveVertex (437, 100);
    curveVertex (454,138 );
  endShape();
}else if  ((mousePressed) && (x < -600)) {
      yMax= 130;
      beginShape ();
    curveVertex(175, 138);
    curveVertex(192, 100);
    curveVertex (257, (c2)++);
    curveVertex (274,138 );
   endShape ();
  beginShape ();
    curveVertex(355, 138);
    curveVertex(372, (c1)++);
    curveVertex (437, 100);
    curveVertex (454,138 );
  endShape();

}else if ((mousePressed) &&(x<-450)) {
   yMax = 120;
   beginShape ();
    curveVertex(175, 138);
    curveVertex(192, 100);
    curveVertex (257, (c2)++);
    curveVertex (274,138 );
   endShape ();
  beginShape ();
    curveVertex(355, 138);
    curveVertex(372, (c1)++);
    curveVertex (437, 100);
    curveVertex (454,138 );
  endShape();
  
  }else if ((mousePressed) &&(x<-300)) {
   yMax = 115;
   beginShape ();
    curveVertex(175, 138);
    curveVertex(192, 100);
    curveVertex (257, (c2)++);
    curveVertex (274,138 );
   endShape ();
  beginShape ();
    curveVertex(355, 138);
    curveVertex(372, (c1)++);
    curveVertex (437, 100);
    curveVertex (454,138 );
  endShape();
 }else {   
   
   beginShape ();
    curveVertex(175, 138);
    curveVertex(192, 100);
    curveVertex (257, (c2)--);
    curveVertex (274,138 );
   endShape ();
  beginShape ();
    curveVertex(355, 138);
    curveVertex(372, (c1)--);
    curveVertex (437, 100);
    curveVertex (454,138 );
  endShape();
  
 }
 //bloodshot_____________________________________________________________________
 r = constrain (r, 150, 255);
 if (c1>=138) {
   r--;
 }else{ r++;}
 
}



