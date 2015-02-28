
void setup(){size(400,400);
  for (int i = 10; i < 900; i = i + 9)
  {
    Round(i, 20);
  }
  }
void draw(){beginShape();
fill(139);
/*vertex(30, 20);
vertex(30, 120);
vertex(85, 120);
vertex(85, 75);
vertex(140,75);
vertex(140,20);*/
endShape(CLOSE);
noFill();
strokeWeight(5);
stroke(139);
//Trigger guard
arc(85, 75, 30, 30, 0, HALF_PI);
pushMatrix();
noStroke();
fill(139);
//Gun
beginShape();
curveVertex(30,  19);
curveVertex(30,  20);
curveVertex(30,  120);
curveVertex(85,  120);
curveVertex(85,  75);
curveVertex(140, 75);
curveVertex(140, 20);
curveVertex(30, 19);
curveVertex(30, 1);
endShape();
popMatrix();
//Trigger
pushMatrix();
beginShape();
curveVertex(85, 75);
curveVertex(85, 75);
curveVertex(89,  85);
curveVertex(89,  86);
curveVertex(90,  75);
curveVertex(90,  75);
endShape();
popMatrix();
fill(200,0,0);
}


void Round(int x, int y){
if(keyPressed== true) {
pushMatrix();
  translate(x,y);
fill(200,200,0);
rect(200,48,30,10);
rect(225, 48,10,10);
popMatrix();
} 
else { 
 fill(200);
  rect(200,48,30,10);
rect(225, 48,10,10);

}
}
