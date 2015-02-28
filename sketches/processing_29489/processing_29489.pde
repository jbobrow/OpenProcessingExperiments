
// This a comand
void setup(){
size(500,700,P3D);
smooth();
frameRate(30);
}

void draw(){
background(255);
 // Change height of the camera with mouseY
camera(500.0, mouseY, 1100.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ

//cape
fill(255,0,0,150);
beginShape();
vertex(340, 280);
bezierVertex(340, 280, 480, 575,340,400);
endShape();
beginShape();
vertex(260, 280);
bezierVertex(260, 280, 120, 575,260,400);
endShape();
triangle(340,250,340,280,380,245);
triangle(260,250,260,280,220,245);
//head
stroke(0);
fill(230);
ellipseMode(CORNERS);
ellipse(150,150,450,250);
//neck
ellipse(250,250,350,260);
ellipse(250,260,350,270);
ellipse(250,270,350,280);

//torso
fill(230);
rectMode(CORNERS);
rect(260,280, 340,400);
//right leg
ellipse(210,400,290,410);
ellipse(210,410,290,420);
ellipse(210,420,290,430);
ellipse(210,430,290,440);
ellipse(210,440,290,450);
//left leg
ellipse(300,400,380,410);
ellipse(300,410,380,420);
ellipse(300,420,380,430);
ellipse(300,430,380,440);
ellipse(300,440,380,450);
//hands
fill(130,190);
ellipse(330,300,350,350);
ellipse(250,300,270,350);
//legs
ellipse(300,450,410,465);
ellipse(180,450,290,465);

line(300,290,300,300);
line(300,305,300,310);
line(300,315,300,325);
line(300,330,300,335);
//belt
rect(260,350,340,358);
rect(280,350,320,358);

ellipse(150,180, 160,190);
//eyes
fill(0);
ellipse(230,180,240,200);
ellipse(360,180,370,200);
line(151,182,151,100);
println("take me to your leader");
fill(255,0,0);
triangle(151,100,151,120,175,110);
}


