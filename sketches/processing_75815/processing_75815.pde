
void setup(){
  
  size(1200,600);
  
  background(255);
  
  smooth();
  
  frameRate(15);
  

  
  
  fill(232,227,63);
stroke(46,213,227);
strokeWeight(3);

beginShape(TRIANGLE_STRIP);
vertex(0, 0);
vertex(100, 100);
vertex(200, 0);
vertex(300, 100);
vertex(400, 0);
vertex(500, 100);
vertex(600, 0);
vertex(700, 100);
vertex(800, 0);
vertex(900, 100);
vertex(1000, 0);
vertex(1100, 100);
vertex(1200, 0);
endShape();

 beginShape(TRIANGLE_STRIP);
vertex(0, 200);
vertex(100, 100);
vertex(200, 200);
vertex(300, 100);
vertex(400, 200);
vertex(500, 100);
vertex(600, 200);
vertex(700, 100);
vertex(800, 200);
vertex(900, 100);
vertex(1000, 200);
vertex(1100, 100);
vertex(1200, 200);
endShape();


beginShape(TRIANGLE_STRIP);
vertex(0, 200);
vertex(100, 300);
vertex(200, 200);
vertex(300, 300);
vertex(400, 200);
vertex(500, 300);
vertex(600, 200);
vertex(700, 300);
vertex(800, 200);
vertex(900, 300);
vertex(1000, 200);
vertex(1100, 300);
vertex(1200, 200);
endShape();

beginShape(TRIANGLE_STRIP);
vertex(0, 400);
vertex(100, 300);
vertex(200, 400);
vertex(300, 300);
vertex(400, 400);
vertex(500, 300);
vertex(600, 400);
vertex(700, 300);
vertex(800, 400);
vertex(900, 300);
vertex(1000, 400);
vertex(1100, 300);
vertex(1200, 400);
endShape();


beginShape(TRIANGLE_STRIP);
vertex(0, 400);
vertex(100, 500);
vertex(200, 400);
vertex(300, 500);
vertex(400, 400);
vertex(500, 500);
vertex(600, 400);
vertex(700, 500);
vertex(800, 400);
vertex(900, 500);
vertex(1000, 400);
vertex(1100, 500);
vertex(1200, 400);
endShape();

beginShape(TRIANGLE_STRIP);
vertex(0, 600);
vertex(100, 500);
vertex(200, 600);
vertex(300, 500);
vertex(400, 600);
vertex(500, 500);
vertex(600, 600);
vertex(700, 500);
vertex(800, 600);
vertex(900, 500);
vertex(1000, 600);
vertex(1100, 500);
vertex(1200, 600);
endShape();

}

int value = 0;

float a = 0.0;

float inc = TWO_PI/25.0;

void draw() {
  
  noStroke();
  
  fill(255,10);      //draws a transparent rectangle over circles that have already been drawn
  
  rect(0,0,width,height);
 
  

 noFill();
stroke(89,50,175);
strokeWeight(5);
bezier(1200, 300, value, 10, 90, value, 150, 80);



stroke(201,92,28);
strokeWeight(5);

if(mouseY>300){
   
  beginShape(TRIANGLE_STRIP);
vertex(0, 0);
vertex(100, 100);
vertex(200, 0);
vertex(300, 100);
vertex(400, 0);
vertex(500, 100);
vertex(600, 0);
vertex(700, 100);
vertex(800, 0);
vertex(900, 100);
vertex(1000, 0);
vertex(1100, 100);
vertex(1200, 0);
endShape();

 beginShape(TRIANGLE_STRIP);
vertex(0, 200);
vertex(100, 100);
vertex(200, 200);
vertex(300, 100);
vertex(400, 200);
vertex(500, 100);
vertex(600, 200);
vertex(700, 100);
vertex(800, 200);
vertex(900, 100);
vertex(1000, 200);
vertex(1100, 100);
vertex(1200, 200);
endShape();


beginShape(TRIANGLE_STRIP);
vertex(0, 200);
vertex(100, 300);
vertex(200, 200);
vertex(300, 300);
vertex(400, 200);
vertex(500, 300);
vertex(600, 200);
vertex(700, 300);
vertex(800, 200);
vertex(900, 300);
vertex(1000, 200);
vertex(1100, 300);
vertex(1200, 200);
endShape();

beginShape(TRIANGLE_STRIP);
vertex(0, 400);
vertex(100, 300);
vertex(200, 400);
vertex(300, 300);
vertex(400, 400);
vertex(500, 300);
vertex(600, 400);
vertex(700, 300);
vertex(800, 400);
vertex(900, 300);
vertex(1000, 400);
vertex(1100, 300);
vertex(1200, 400);
endShape();


beginShape(TRIANGLE_STRIP);
vertex(0, 400);
vertex(100, 500);
vertex(200, 400);
vertex(300, 500);
vertex(400, 400);
vertex(500, 500);
vertex(600, 400);
vertex(700, 500);
vertex(800, 400);
vertex(900, 500);
vertex(1000, 400);
vertex(1100, 500);
vertex(1200, 400);
endShape();

beginShape(TRIANGLE_STRIP);
vertex(0, 600);
vertex(100, 500);
vertex(200, 600);
vertex(300, 500);
vertex(400, 600);
vertex(500, 500);
vertex(600, 600);
vertex(700, 500);
vertex(800, 600);
vertex(900, 500);
vertex(1000, 600);
vertex(1100, 500);
vertex(1200, 600);
endShape();
   
 }
 
 else{
   
   value =0;
   
 }
 
 stroke(28,38,201);
strokeWeight(5);
 
 if(mouseY>100){
   
   beginShape();
vertex(value, 10);
vertex(50,value);
vertex(value, 10);
vertex(50,value);
vertex(value, 10);
vertex(50, value);
endShape(CLOSE);
   
 }
 
 else{
   
   value=0;
   
 }
 
 
 strokeWeight(1);

  for (int i = 0; i < 1200; i++) {
  float r = random(230);
  stroke(r);
  rect(800, i, r, i);
}
 
 
   

}


void mouseMoved() {
  value = value + 5;
  if (value > 600) {
    value = 0;
  }
  
  
}

void keyPressed(){
  if(key=='s'){
    save("kelsey.png");
  }
  
}
