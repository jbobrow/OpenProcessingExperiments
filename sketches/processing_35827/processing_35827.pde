

float L= random(0,300);
float Xpos=0;
float Ypos=0;

void setup() {
 size(700,400);
 background(0);
 stroke(255);
 strokeWeight(2);
 smooth();
 noFill();

}
void draw(){

 
 background(0);
stroke(255);
 beginShape();
   curveVertex(0,200);
   curveVertex(0,200);
   
   curveVertex(100,pmouseY);
    curveVertex(pmouseX,250);
   curveVertex(300,pmouseY);
   curveVertex(pmouseX,50);
   curveVertex(600,pmouseY);
   
   curveVertex(700,200);
   curveVertex(700,200);
   
 endShape();
stroke(255,255,255,80);

beginShape();

stroke(255,255,255,150);
   curveVertex(0,230);
   curveVertex(0,230);
   
   curveVertex(100,pmouseY);
    curveVertex(pmouseX,280);
   curveVertex(300,pmouseY);
   curveVertex(pmouseX,80);
   curveVertex(600,pmouseY);
   
   curveVertex(700,230);
   curveVertex(700,230);
   
 endShape();
  stroke(255,255,255,60); 
 
 beginShape();
   curveVertex(0,260);
   curveVertex(0,260);
   
   curveVertex(100,pmouseY);
    curveVertex(pmouseX,310);
   curveVertex(300,pmouseY);
   curveVertex(pmouseX,110);
   curveVertex(600,pmouseY);
   
   curveVertex(700,260);
   curveVertex(700,260);
   
 endShape();




beginShape();
   curveVertex(0,100);
   curveVertex(0,100);
   
   curveVertex(100,pmouseY);
    curveVertex(pmouseX,340);
   curveVertex(300,pmouseY);
   curveVertex(pmouseX,140);
   curveVertex(600,pmouseY);
   
   curveVertex(700,300);
   curveVertex(700,300);
   
 endShape();
// curve(x1, y1, x2, y2, x3, y3, x4, y4);
//curve(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4); 
 
 Xpos = Xpos +(mouseX- Xpos/10);
 Ypos = Ypos +(mouseY-Ypos/10);
 
}

