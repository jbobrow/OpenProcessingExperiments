
void setup() {
  size(300, 300);
  smooth();
}

void draw() {
 //3rd Clipper Top
 beginShape();
 vertex(250, 50);
 bezierVertex(280, 80, 240, 90, 220, 100);
 bezierVertex(200, 85, 250, 90, 250, 50);
 endShape();
 
 //2nd Clipper Top
 beginShape();
 vertex(200, 50);
 bezierVertex(230, 80, 190, 90, 170, 100);
 bezierVertex(150, 85, 200, 90, 200, 50);
 endShape();
 
 //1st Clipper Top
 beginShape();
 vertex(150, 50);
 bezierVertex(180, 80, 140, 90, 120, 100);
 bezierVertex(100, 85, 150, 90, 150, 50);
 endShape();
 
/* ******************************************* */

 //1st Clipper Bottom
 beginShape();
 vertex(150, 180);
 bezierVertex(180, 150, 140, 140, 120, 130);
 bezierVertex(100, 145, 150, 140, 150, 180);
 endShape();
 
 //2nd Clipper Bottom
 beginShape();
 vertex(200, 180);
 bezierVertex(230, 150, 190, 140, 170, 130);
 bezierVertex(150, 145, 200, 140, 200, 180);
 endShape();
 
 //3rd Clipper Bottom
 beginShape();
 vertex(250, 180);
 bezierVertex(280, 150, 240, 140, 230, 130);
 bezierVertex(200, 145, 250, 140, 250, 180);
 endShape();
 
/* ******************************************* */

 //Face Clipper Top
 beginShape();
 vertex(120, 10);
 bezierVertex(150, 80, 80, 100, 80, 120);
 bezierVertex(40, 100, 110, 110, 120, 10);
 endShape();
 
 //Face Clippter bottom
 beginShape();
 vertex(120, 220);
 bezierVertex(150, 170, 80, 130, 80, 110);
 bezierVertex(40, 130, 110, 120, 120, 220);
 endShape();


/* ******************************************* */

 //body
 ellipse (100, 115, 40, 50);
 ellipse (170, 115, 150, 60);

 


}

