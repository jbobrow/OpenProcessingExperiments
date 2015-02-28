
void setup (){
  
  size (300, 500);
  frameRate(30);
  smooth();
}

void draw(){
// noStroke();
// fill(255, 204, 0, 5);
// rect(0, 120, 300, 380);
// noFill();
// noStroke();
// line (0, 120, 0, 0);
// line (300, 400, 300, 200);
// stroke (255, 204, 0, 20);
// bezier (0, 120, 0, 0, 300, 400, 300, 200);
pushMatrix();
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
translate (0, 50);
drawmyBeerline();
popMatrix();


drawmyBeerbubbles();

}


void drawmyBeerline (){
noFill();
strokeWeight (50);
stroke(255, 204, 0, 40);
beginShape();
curveVertex (0, 120);
curveVertex (0, 120); 
curveVertex (50, 90);
curveVertex (200,140);
curveVertex (300,100);
curveVertex (320, 100);
vertex (320,100);
vertex (320,100);
endShape ();
}

void drawmyBeerbubbles (){
  stroke(255);
  strokeWeight(2);
  ellipse(random(width), random(height), 10, 10);
  ellipse(random(width), random(height), 15,15);
  ellipse(random(width), random(height), 2,2);
  ellipse(random(width), random(height), 5,5);  
  strokeWeight(5);
  ellipse(random(width), random(height), 8,8);
  ellipse(random(width), random(height), 12,12);
  
}

