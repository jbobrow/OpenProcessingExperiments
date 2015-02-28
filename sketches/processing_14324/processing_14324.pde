



int x;
void setup() {
  size(600,600); 
  noCursor();
  strokeWeight(0);
  x = width/40;
  smooth();
}

void draw() {
  noStroke();
  fill(0);
  smooth();
  background(0);

  if (mousePressed == true) {
    for (int y=50; y<=height; y +=100) {
      for (int x=50; x<width; x +=100) {
        fill(50);
        ellipse(x,y,100,100);
      }
    }
  }


if(keyPressed) {
   noFill();
stroke(41,75,109);
strokeWeight(2);
ellipse(600,0,360,360);
ellipse(180,520,80,80);

fill(41,75,109);
noStroke();
ellipse(0,600,400,400);
ellipse(600,600,480,480);
ellipse(600,0,280,280);
}



  if(mouseX > x) {
    x +=1;
  }
  else if (mouseX < x) {
    x-=1;
  }
  fill(116,160,175);
  noStroke();
  ellipse(x,60,80,80);
  ellipse(440,x,40,40);
  ellipse(400,500,x,x);
  ellipse(x,x,40,40);

  ellipse(mouseX,mouseY,10,10);



  float mapColorB = map(mouseX,0,600,200,255);
  float mapColorG = map(mouseY,0,600,0,255);
  fill(700, mapColorG, mapColorB);

  quad(220,200,320,120,240,300,100,400);
  quad(320,160,340,240,320,380,280,260);
  quad(360,260,400,220,380,340,340,400);
  quad(420,220,460,300,480,420,400,340);
  quad(480,300,600,220,600,500,500,420);

  beginShape();
  vertex(0,0);
  vertex(100,0);
  vertex(200,200);
  vertex(80,400);
  vertex(0,320);
  endShape();





stroke(225);
strokeWeight(3);
line(160,0,220,160);
line(220,160,340,80);
line(340,80,360,220);
line(360,220,400,140);
line(400,140,480,280);
line(480,280,600,160);


line(0,500,260,320);
line(260,320,320,480);
line(320,480,400,380);
line(400,380,580,600);



}




