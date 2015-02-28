
// Assignment 1
// Name: Natalie Kato
// E-mail: nkato@brynmawr.edu 
// Date: 09/07/10

void setup() {
  size(500,500);
  smooth();
}

void draw(){
  background(67,121,255);
  
  fill(121,2,227,30);
  rect(0,0,499,230);
  fill(54,0,183,45);
  rect(0,0,499,170);
  fill(37,0,126,65);
  rect(0,0,499,100);
  //sky shading
  
  strokeWeight(2);
  stroke(0);
  fill(0);
  ellipse(140,90,80,65);
  ellipse(260,90,80,65);
  stroke(255);
  curve(0,150,250,100,265,75,400,80);
  curve(0,40,135,75,145,100,260,190);
  //panda ears
  
  noStroke();
  fill(80,170,29,150);
  quad(0,499,30,399,469,399,499,499);
  //grass
  
  stroke(0);
  fill(0);
  rect(50,210,120,45);
  ellipse(50,233,45,45);
  rect(201,210,150,45);
  ellipse(351,233,45,45);
  rect(120,320,50,70);
  ellipse(145,390,50,50);
  rect(231,320,50,70);
  ellipse(256,390,50,50);
  //panda arms/legs

  fill(255);
  ellipse(200,270,200,190);
  //panda body
  
  fill(255);
  ellipse(200,150,150,135); 
  //panda head
  
  arc(200,300,20,20,PI/3,3*PI/2);
  //panda belly-button
      
  fill(255);
  ellipse(170,130,30,30);
  ellipse(229,130,30,30);
  //panda eyes
  
  fill(0);
  ellipse(172,130,20,20);
  ellipse(227,130,20,20);
  //panda pupil
  
  noFill();
  strokeWeight(3);
  arc(188,160,20,20,0,PI/2);
  arc(211,160,20,20,PI/2,PI);
  //panda nose
  
  noStroke();
  fill(16,160,72,200);
  triangle(0,499,30,499,15,450);
  triangle(0,400,80,400,0,330);
  triangle(130,470,200,470,210,390);
  triangle(30,487,185,499,130,410);
  triangle(320,499,460,499,410,395);
  triangle(220,499,270,499,237,376);
  triangle(499,499,499,377,450,430);
  //grass layering
  
  fill(16,124,28);
  triangle(0,400,20,400,10,360);
  triangle(0,400,100,400,0,499);
  triangle(150,499,190,499,130,370);
  triangle(245,483,370,499,200,399);
  triangle(350,490,420,490,410,410);
  //grass layering
  
  beginShape();
  vertex(480,390);
  vertex(460,399);
  vertex(300,399);
  vertex(100,450);
  vertex(290,376);
  vertex(490,499);
  endShape();
  //grass layering
  
  fill(183,255,191,100);
  triangle(0,450,30,450,0,425);
  triangle(30,399,70,399,40,455);
  quad(300,390,350,420,320,460,499,387);
  triangle(50,455,150,430,100,350);
  //grass layering
  
  stroke(0);
  strokeWeight(0.5);
  fill(192,242,68);
  rect(340,280,10,90);
  rect(390,200,25,150);
  rect(375,130,15,250);
  fill(2,227,11,270);
  rect(345,220,23,145);  
  rect(407,90,26,270);
  fill(160,193,96,245);
  rect(410,300,28,82);
  rect(355,100,20,280);
  //bamboo sticks
  
  noStroke();
  fill(70,77,50);
  quad(300,399,330,350,445,350,490,399);
  //bamboo base
    
  fill(248,255,232);
  beginShape();
  curveVertex(300,320);
  curveVertex(325,360);
  curveVertex(330,345);
  curveVertex(448,350);
  curveVertex(449,380);
  curveVertex(360,365);
  curveVertex(355,347);
  endShape();
  //bamboo cushion 
    
  stroke(252,178,38);
  strokeWeight(2);
  line(mouseX + 30,mouseY + 5,mouseX + 35,mouseY + 15);
  line(mouseX + 35,mouseY + 3,mouseX + 40,mouseY + 10);
  //bird legs 
  
  fill(255,237,67);
  stroke(0);
  strokeWeight(0.5);
  triangle(mouseX + 25,mouseY - 17,mouseX + 10,mouseY - 5,mouseX + 30,mouseY - 5); 
  triangle(mouseX + 20,mouseY - 17,mouseX + 10,mouseY - 5,mouseX + 30,mouseY - 5);
  //bird wings
  
  noStroke();
  fill(255,237,67);
  ellipse(mouseX + 20,mouseY,40,13);
  //bird body
  
  fill(255,237,67);
  ellipse(mouseX,mouseY,15,15);
  //bird head
  
  strokeWeight(2);
  stroke(0);  
  point(mouseX - 3,mouseY - 2);
  //bird eye
  
  noStroke();
  fill(252,178,38);
  triangle(mouseX - 7,mouseY + 5,mouseX - 7, mouseY - 5,mouseX - 25, mouseY);
  //bird beak
}

