

 
void setup(){
  size(600,600);
background(255,255,255);
}

void draw() {
smooth();
frameRate(50);

 int s = second();  // Values from 0 - 59
 int m = minute();  // Values from 0 - 59
 int h = hour();    // Values from 0 - 23

strokeWeight(1);
stroke(0,147+s*4,67);
noFill();
fill(255,255,255,8);

beginShape();
vertex(50,550+-s*8);       
vertex(550+-s*8,550);
vertex(550,50+s*8);
vertex(50+s*8,50);
endShape(CLOSE);

strokeWeight(1);
stroke(0,215,98);
noFill();
fill(255,255,255,8);

beginShape();
vertex(200,400+-m*4);       
vertex(400+-m*4,400);
vertex(400,200+m*4);
vertex(200+m*4,200);
endShape(CLOSE);

strokeWeight(1);
stroke(0,255,116);
noFill();
fill(255,255,255,8);

beginShape();
vertex(270,270+-h*4);       
vertex(340,270+-h*4);
vertex(340,340+-h*4);
vertex(270,340+-h*4);
endShape(CLOSE);

}


