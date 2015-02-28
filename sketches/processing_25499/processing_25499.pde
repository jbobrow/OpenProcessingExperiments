
int xtemp;
int ytemp;

void setup () {
  size (700,700);
  smooth ();
}

void draw() {
  background(255);

pushMatrix();
 translate(width/2,height/2);
 rotate(radians(frameCount));
 legs_top();
 legs_bottom();
 face_clipper();
 body();
popMatrix();
}

/* ***************************************************************************** */

void legs_top() {
  
 fill (50, 120, 200);
 
 //3rd Clipper Top
 beginShape();
 //using Temp to position vertex based on mouse position
 xtemp=mouseX+80;
 ytemp=mouseY-65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+30, xtemp-10, ytemp+40, xtemp-30, ytemp+50);
 bezierVertex(xtemp-50, ytemp+35, xtemp, ytemp+40, xtemp, ytemp);
 endShape(CLOSE);
 
 //2nd Clipper Top
 beginShape();
 xtemp=mouseX+30;
 ytemp=mouseY-65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+30, xtemp-10, ytemp+40, xtemp-30, ytemp+50);
 bezierVertex(xtemp-50, ytemp+35, xtemp, ytemp+40, xtemp, ytemp);
 endShape(CLOSE);
 
 //1st Clipper Top
 beginShape();
 xtemp=mouseX-20;
 ytemp=mouseY-65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+30, xtemp-10, ytemp+40, xtemp-30, ytemp+50);
 bezierVertex(xtemp-50, ytemp+35, xtemp, ytemp+40, xtemp, ytemp);
 endShape(CLOSE);

}

/* ***************************************************************************** */

void legs_bottom (){
 
 fill (50, 120, 200); 
  
 //1st Clipper Bottom
 beginShape();
 xtemp=mouseX-20;
 ytemp=mouseY+65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-30, xtemp-10, ytemp-40, xtemp-30, ytemp-50);
 bezierVertex(xtemp-50, ytemp-35, xtemp, ytemp-40, xtemp, ytemp);
 endShape(CLOSE);
  
 //2nd Clipper Bottom
 beginShape();
 xtemp=mouseX+30;
 ytemp=mouseY+65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-30, xtemp-10, ytemp-40, xtemp-30, ytemp-50);
 bezierVertex(xtemp-50, ytemp-35, xtemp, ytemp-40, xtemp, ytemp);
 endShape(CLOSE);
  
 //3rd Clipper Bottom
 beginShape();
 xtemp=mouseX+80;
 ytemp=mouseY+65;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-30, xtemp-10, ytemp-40, xtemp-30, ytemp-50);
 bezierVertex(xtemp-50, ytemp-35, xtemp, ytemp-40, xtemp, ytemp);
 endShape(CLOSE);
 
}

/* ***************************************************************************** */

void face_clipper () {
  
 //Face Clipper Top
 beginShape();
 fill(0,255,0);
 xtemp=mouseX-50;
 ytemp=mouseY-105;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp+70, xtemp-40, ytemp+90, xtemp-40, ytemp+110);
 bezierVertex(xtemp-80, ytemp+90, xtemp-10, ytemp+100, xtemp, ytemp);
 endShape(CLOSE);
  
 //Face Clippter bottom
 beginShape();
 fill(0,255,0);
 xtemp=mouseX-50;
 ytemp=mouseY+105;
 vertex(xtemp, ytemp);
 bezierVertex(xtemp+30, ytemp-50, xtemp-40, ytemp-90, xtemp-40, ytemp-110);
 bezierVertex(xtemp-80, ytemp-90, xtemp-10, ytemp-100, xtemp, ytemp);
 endShape(CLOSE);

}

/* ***************************************************************************** */ 
 
void body() {
 colorMode(HSB, 255);
 color c = color(0, 126, 255);
 fill(c);
 //head positioned based on mouse centre(body ellipse centre)
 ellipse (mouseX-70, mouseY, 70, 50);
 float value = saturation(c);  // Sets "value" to "126"
 fill(value);
 //body centres on mouse position
 ellipse (mouseX, mouseY, 150, 60);
}

