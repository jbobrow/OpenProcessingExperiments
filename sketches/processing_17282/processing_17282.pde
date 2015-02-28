
void setup(){
  size(200,200);
   }
void draw(){
 background(255,215,195);

ellipseMode(CENTER);

// draw ducks hair
stroke(255,0,0);
fill(255,0,0);

line(100,50,mouseX-50,mouseY-75);
line(100,50,mouseX,10);
line(100,50,mouseX+50,mouseY-75);
line(100,50,mouseX+25,17);
line(100,50,mouseX-25,mouseY-83);

//draw ducks body
noStroke();
fill(255,150,0);
ellipse(100,100,150,150);

//draw ducks left eye
stroke(0,0,255);
fill(255,0,0);
ellipse(75,75,30,30);
ellipse(75,75,20,20);
ellipse(75,75,10,10);

//draw ducks right eye
stroke(255,0,0);
fill(0,0,255);
ellipse(125,75,30,30);
ellipse(125,75,20,20);
ellipse(125,75,10,10);

//draw ducks feet
noStroke();
fill(255,0,0);
ellipse(mouseX+30,190,10,10);
ellipse(mouseX-30,190,10,10);

//draw ducks wings
noStroke();
fill(255,100,0);
triangle(50,100,mouseX-100,mouseY+50,25,100);
triangle(150,100,mouseX+100,mouseY+50,175,100);

//draw ducks legs
stroke(255,0,0);
fill(255,0,0);
line(120,171,mouseX+30,190);
line(80,171,mouseX-30,190);

//draw ducks beak
//draw top
noStroke();
fill(255,100,0);
triangle(60,110,100,mouseY+20,140,110);
//draw tongue
noStroke();
fill(250,50,0);
triangle(70,110,100,mouseY+15,130,110);
//draw bottom
noStroke();
fill(255,100,0);
triangle(60,110,100,mouseY-5,140,110);
}
//evil duck
void mousePressed(){
 background(255,0,0);

ellipseMode(CENTER);

// draw ducks hair
stroke(0,0,0);
fill(0,0,0);

line(100,50,mouseX-50,mouseY-75);
line(100,50,mouseX,10);
line(100,50,mouseX+50,mouseY-75);
line(100,50,mouseX+25,17);
line(100,50,mouseX-25,mouseY-83);

//draw ducks body
noStroke();
fill(0,0,0);
ellipse(100,100,150,150);

//draw ducks left eye
stroke(0,0,0);
fill(255,255,255);
ellipse(75,75,30,30);
ellipse(75,75,20,20);
ellipse(75,75,10,10);

//draw ducks right eye
stroke(0,0,0);
fill(255,255,255);
ellipse(125,75,30,30);
ellipse(125,75,20,20);
ellipse(125,75,10,10);

//draw ducks feet
noStroke();
fill(0,0,0);
ellipse(mouseX+30,190,10,10);
ellipse(mouseX-30,190,10,10);

//draw ducks wings
noStroke();
fill(0,0,0);
triangle(50,100,mouseX-100,mouseY+50,25,100);
triangle(150,100,mouseX+100,mouseY+50,175,100);

//draw ducks legs
stroke(0,0,0);
fill(0,0,0);
line(120,171,mouseX+30,190);
line(80,171,mouseX-30,190);

//draw ducks beak
//draw top
stroke(255,0,0);
fill(0,0,0);
triangle(60,110,100,mouseY+20,140,110);

//draw teeth
noStroke();
fill(255,255,255);
triangle(70,110,72,120,75,110);
triangle(125,110,128,120,130,110);

//draw bottom
noStroke();
fill(255,100,0);
triangle(60,110,100,mouseY-5,140,110);
}

