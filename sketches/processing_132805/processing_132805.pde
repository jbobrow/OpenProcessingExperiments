
//Mady Dean 02/06/14 Creative Computing: Section B//

void setup() {
  size(400,400);  
  smooth();  
}

void draw() {
   drawcircs (random(1,500), random(0, 500));
}

void drawcircs(float x, float y){
fill(random(255), random(255), random(255), 10);
ellipse(x,y,75,75);
fill(random(255), random(255), random(255), 10);
ellipse(x,y,75,75);
fill(random(255), random(255), random(255), 10);
ellipse(x,y,45,45);
fill(random(255), random(255), random(255), 10);
ellipse(x,y,15,15);

}


