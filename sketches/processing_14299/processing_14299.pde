
int check;


void setup() {
  size(600, 600);  
  smooth(); noCursor();
}

void draw() {

   float mapColorA =  map(mouseY, 0, 600, 250,255);
   float mapColorB =  map(mouseY, 0, 600, 255,150);
   float mapColorC =  map(mouseX, 0, 600, 0,50);
   float mapColorD =  map(mouseY, 0, 600, 255,20);
   fill(255, mapColorA, mapColorB);
   rect (0, 0, width, height);

//left curve line
noFill();
strokeWeight(20);
stroke(0, mapColorC, mapColorD);
ellipse(40,120,530,530) ;

strokeWeight(5);
stroke(180,20,30);
ellipse(-60,200,280,280);

//left gray ellipse
noStroke();
fill(200.20);
ellipse(220,25,30,30) ;

fill(100, mapColorB, mapColorD);
noStroke();

//left check
rect(40,60,20,20);
rect(100,60,20,20);
rect(80,80,20,20);
rect(60,100,20,20);
rect(100,100,20,20);
rect(80,120,20,20);
rect(100,170,35,35);

//left black
beginShape();
vertex(0,300);
vertex(40,340);
vertex(80,280);
vertex(215,470);
vertex(240,420);
vertex(275,444);
vertex(600,180);
vertex(600,300);
vertex(560,280);
vertex(309,480);
vertex(400,540);
vertex(380,600);
vertex(0,600);
vertex(0,300);
fill(0) ;
endShape();

//right black
beginShape();
vertex(273,0);
vertex(280,20);
vertex(220,80);
vertex(240,140);
vertex(270,120);
vertex(340,340);
vertex(440,280);
vertex(420,240);
vertex(580,140);
vertex(600,160);
vertex(600,0);
vertex(273,0);
endShape();

ellipse(470,170,158,158);

  
  
  //red-white ellipse
  if((mouseX > 410) && (mouseX < 410 + 120) && (mouseY > 110) && (mouseY < 110+ 120)) {
    fill(255,0,0);
  }
  else {
    fill(255);
  }
  strokeWeight(16);
  ellipse(470,170,120,120);
  
  //row check and left small ellipse
  fill(220, mapColorB, mapColorD);
  quad(460,420,520,440,500,500,440,480)  ;
  rect(460,520,40,40) ;
  rect(500,560,40,40) ;
  rect(540,520,40,40) ;
  rect(580,480,40,40) ;
  ellipse(143,270,50,50);
  ellipse(143,320,20,20);
  
  fill(0, mapColorC, mapColorD);
ellipse(140,170,120,120);

//cursor
fill(255);
  ellipse(mouseX,mouseY,50,50);



}



