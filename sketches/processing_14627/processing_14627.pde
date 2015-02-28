
int x;
int y;

void setup(){
  size(640,480);
  smooth();
}
 
void draw(){
  background(173,215,216);
  stroke(255);
  strokeWeight(.5);
  x = 145+30;
  y = 230+30;
  
  
  //background circles
  fill(170,232,213);
  ellipse(x+150,y-25,x+135,y+50);

  noFill();
  for (int i = 375; i < 400; i+= 5){
  ellipse(x+150,y-25,i,i);
  }

//Middle Triangle shape
fill(133,216,192);
beginShape(TRIANGLE_FAN);
vertex(x+300,y-50);
vertex(x,y);
vertex(x+150,y+95);
vertex(x+240,y+55);
vertex(x+300,y-50);
endShape(CLOSE);

//Triangle top
fill(117,175,158);
triangle(x+300,y-50,x,y,x+211,y-135);

//Triangle top left
fill(87,152,133);
triangle(x,y,x+64,y-40,x+55,y-144);

//Top Triangle shape
fill(120,175,160);
beginShape(TRIANGLE_FAN);
vertex(x+197,y-74);
vertex(x+175,y-110);
vertex(x+55,y-144);
vertex(x+64,y-40);
vertex(x+55,y-144);
endShape();

//Bottom Triangle shape
fill(170,240,212);
beginShape(TRIANGLE_FAN);
vertex(x+169,y+19);
vertex(x+150,y+95);
vertex(x+41,y+112);
vertex(x+46,y+30);
vertex(x+169,y+19);
endShape();

//Triangle bottom right
fill(87,152,133);
triangle(x+240,y+55,x+260,y+90,x+150,y+95);

//small circles
fill(255);
  ellipse(x,y,15,15);
  ellipse(x+55,y-144,10,10);
  ellipse(x+300,y-50,20,20);
  ellipse(x+211,y-135,5,5);
  ellipse(x+260,y+90,30,30);


println("x: " + mouseX + "y:" + mouseY);


}

