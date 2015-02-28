
void setup() {
  size(270,350);
  background(41,35,38);
  smooth();
}

void draw() {
  noStroke();
  smooth();
 //ext background
  fill(50,40,50);
  quad(0,0,300,0,300,175,0,150);
 //sweater
  fill(50,50,50);
  beginShape();
    vertex(35,350);
    vertex(50,295);
    vertex(55,290);
    vertex(60,285);
    vertex(65,280);
    vertex(70,275);
    vertex(80,270);
    vertex(170,260);
    vertex(270,270);
    vertex(300,270);
    vertex(300,350);
    endShape(CLOSE);
 //neck
  fill(180,140,90);
  strokeWeight(15);
  stroke(40,40,40);
  ellipse(171,270,88,28);
  noStroke();
  fill(180,140,90);
  quad(138,230, 200,230, 205,270, 136,270);

 //face
  fill(225,185,135);
  ellipse(170,170,110,185);
 //eyes
  fill(240,240,240);
  ellipse(143,160,20,20);
  ellipse(198,160,20,20);
 //pupils
  fill(125,50,50);
  ellipse(143,160,10,10);
  ellipse(198,160,10,10);
  fill(0);
  ellipse(143,160,5,5);
  ellipse(198,160,5,5);
 //bottom eye lids
  fill(225,185,135);
  arc(143,165,50,10,0,PI);
  arc(198,165,50,10,0,PI);
 //top eye lids
  noFill();
  strokeWeight(10);
  stroke(225,185,135);
  ellipse(143,168,44,32);
  ellipse(198,168,44,32);
  noStroke();
 //lips
  fill(50,30,30,50);
  ellipse(170,228,15,10);
  fill(240,160,150);
  ellipse(170,225,40,10);
  fill(225,185,135);
  ellipse(170,220,20,5);
  
 //nose
  fill(50,30,30,20);
  ellipse(170,185,25,45); //shadow
  
  fill(230,190,140);
  strokeWeight(5);
  stroke(220,180,130);
  ellipse(170,175,15,40);
  
  strokeWeight(2);
  ellipse(160,198,12,12);
  ellipse(180,198,12,12);
  
  noStroke();
  ellipse(170,195,21,20);
  
  strokeWeight(12);
  stroke(230,190,140);
  line(170,160,170,195); //straighten/bridge
  
 //hair
  fill(50,30,30);
  smooth();
  strokeWeight(5);
  stroke(50,30,30,50);
  ellipse(170,95,70,40);
  strokeWeight(10);
  stroke(50,30,30);
  line(120,95,110,155);
  line(220,110,230,155);
  beginShape();
    vertex(120,110);
    vertex(125,85);
    vertex(145,75);
    vertex(175,65);
    vertex(190,70);
    vertex(200,75);
    vertex(215,95);
    vertex(220,120); //end, head back
    vertex(210,100);
    vertex(195,95);
    vertex(150,95);
    vertex(135,100);
    endShape(CLOSE);
 //eyebrows
  fill(75,30,30);
  noStroke();
  quad(125,152,155,150,157,155,122,156);
  quad(215,152,185,150,183,155,218,156);
 //ears
  fill(220,180,130);
  ellipse(110,178,15,40);
  ellipse(230,178,15,40);
  strokeWeight(8);
  stroke(41,35,38);
  line(100,165,106,200);
  line(240,165,234,200);
 //face fix
  strokeWeight(4);
  stroke(50,30,30);
  noFill();
  ellipse(170,170,113,185);
  strokeWeight(8);
  stroke(50,30,30,150);
  ellipse(170,170,113,185);
  strokeWeight(10);
  stroke(50,30,30,50);
  ellipse(170,168,107,180);
}

