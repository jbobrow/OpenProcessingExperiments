
void setup(){
    size(400,400);
    background(255);
    frameRate(24);
}

void draw(){
  //init
  smooth();
  noStroke();
  //bg
  rect(0,0, 400,400);
  //head
  fill(0);
  ellipse(200,200, 100,100);
  rect(185,200,30,100);
  //face
  fill(255);
  ellipse(165,185, 10,10);
  ellipse(235,185, 10,10);
  arc(200,200, 90,90, 0,PI);
  //suit
  stroke(150,150,150);
  strokeWeight(5);
  quad(135,290, 265,290, 280,400, 120,400);
  triangle(155,315, 185,300, 183,280);
  triangle(245,315, 215,300, 216,280);
  strokeCap(SQUARE);
  line(240,345, 245,400);
  line(160,345, 155,400);
  noStroke();
  fill(0,10,240);
  triangle(183,290, 216,290, 200,310);
  quad(200,300, 180,380, 200,410, 220,380);
  fill(255);
  
    if(mousePressed){
      noStroke();
      fill(0);
      rect(0,0, 400,400);
      //face
      fill(255,0,0);
      ellipse(mouseX-35,mouseY-15, 10,10);
      ellipse(mouseX+35,mouseY-15, 10,10);
      arc(mouseX,mouseY, 90,90, 0,PI);
      //backface
      stroke(255,0,0,90);
      strokeWeight(3);
      //left eye
      line(95,95, 170,95);
      line(75,105, 185,105);
      line(65,115, 190,115);
      line(85,125, 190,125);
      line(105,135, 190,135);
      //right eye
      line(265,95, 328,95);
      line(255,105, 340,105);
      line(250,115, 350,115);
      line(247,125, 340,125);
      line(249,135, 330,135);
      //nose
      line(170,145, 189,145);
      line(168,155, 188,155);
      line(166,165, 187,165);
      line(163,175, 186,175);
      line(160,185, 184,185);
      line(156,195, 182,195);
      line(154,205, 180,205);
      line(151,215, 178,215);
      line(149,225, 179,225);
      line(150,235, 180,235);
      line(153,245, 185,245);
      line(156,255, 230,255);
      line(174,265, 215,265);
      line(180,275, 210,275);
      //mouth
      line(160,285, 205,285);
      line(135,295, 200,295);
      line(110,305, 210,305);
      line(132,315, 202,315);
      line(160,325, 230,325);
      line(180,335, 215,335);
      //flash
      fill(255,0,0);
  }
}
