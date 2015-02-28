
//Experimenting with BezierShapes, Randomness and Fading

void setup(){
  size (1024,768);
background(0);
}

void draw(){


for(float i = 0; i< 2; i += .5) {
 // color c1 = color(155,222,22,random(15));
  noStroke();
 
  ellipse(random(width),random(height),i,i);
 
  smooth();
   color c2 = color(255,random(200,222),random(122),random(9));
     fill(c2);
    //noFill();
  //stroke(c2);
 // strokeWeight(random(2.65));
beginShape();

vertex(width/2, height/2);
bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
endShape();
}

///How to fade out shapes with Processing
fill(0,2);
rect (0,0,width,height);
/////

}
