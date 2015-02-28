
void setup(){size(450,450);smooth();strokeWeight(5);}void draw(){fill(x(),x(),x(),99);beginShape();for(int i=0;i<5;i++){curveVertex(x(),x());}endShape();}float x(){return random(450);}


