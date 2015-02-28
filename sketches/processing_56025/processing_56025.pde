
float angle = 0.0;

void setup() {
  size(600, 600);
}

void draw() {

  smooth();
  strokeWeight(2);
  background(240,240,200);
  ellipseMode(RADIUS);
  
  //float angle = 0.1;
  //translate(mouseX, mouseY);
  rotate(angle);
 angle += 0.05;


  //neck
  fill(0);
  stroke(0);
  line(mouseX +150, mouseY +300, mouseX +150, mouseY +190);
  line(mouseX +170, mouseY +300, mouseX +170, mouseY +190);
  line(mouseX +190, mouseY +300, mouseX +190, mouseY +190);

  //left leg
  stroke(0);
  line(mouseX +100, mouseY +530, mouseX +100, mouseY +490);
  line(mouseX +120, mouseY +530, mouseX +120, mouseY +490);
  line(mouseX +140, mouseY +530, mouseX +140, mouseY +490);

  //right leg
  stroke(0);
  line(mouseX +200, mouseY +530, mouseX +200, mouseY +490);
  line(mouseX +220, mouseY +530, mouseX +220, mouseY +490);
  line(mouseX +238, mouseY +530, mouseX +238, mouseY +490);


  //left arm
  stroke(0);
  line(mouseX +40, mouseY + 330, mouseX +100, mouseY + 250);
  line(mouseX +50, mouseY + 340, mouseX +100, mouseY + 290);
  line(mouseX +56, mouseY + 350, mouseX +100, mouseY + 310);

  stroke(255,130,0);
  fill(60, 197, 222);
  quad(mouseX +40, mouseY + 330, mouseX + 60, mouseY + 350, mouseX + 50, mouseY + 360, mouseX + 30, mouseY + 340);

  //right arm
  stroke(0);
  line(mouseX +300, mouseY + 330, mouseX +240, mouseY + 250);
  line(mouseX +290, mouseY + 340, mouseX +240, mouseY + 290);
  line(mouseX +284, mouseY + 350, mouseX +240, mouseY + 310);

  stroke(255,130,0);
  fill(60, 197, 222);
  quad(mouseX +300, mouseY + 330, mouseX + 280, mouseY + 350, mouseX + 290, mouseY + 360, mouseX + 310, mouseY + 340);
  noStroke();

  // Antennae
  stroke(255,130,0);
  smooth(); 
  strokeWeight(6); 
  strokeJoin(ROUND);
  line(mouseX +170, mouseY + 310, mouseX +20, mouseY +110);
  line(mouseX +170, mouseY + 310, mouseX +320, mouseY +130);

  line(mouseX +70, mouseY +110, mouseX +20, mouseY +190);
  line(mouseX +80, mouseY +130, mouseX +40, mouseY +190);
  line(mouseX +90, mouseY +150, mouseX +60, mouseY +190);

  line(mouseX +260, mouseY +170, mouseX +280, mouseY +210);
  line(mouseX +270, mouseY +170, mouseX +290, mouseY +190);

  strokeWeight(2);

  //body
   stroke(255,130,0);
  fill(60, 197, 222);
  rect(mouseX +100, mouseY +470, 140, 20);
  stroke(60, 197, 222);
  fill(255,130,0);
  rect(mouseX +100, mouseY +250, 140, 220);

  

  //circles
  
  stroke(240,25,80);
  fill(255);
  ellipse(mouseX +170, mouseY +310, 40, 40);
  fill(0);
  ellipse(mouseX +170, mouseY +310, 30, 30);
  fill(240,25,80);
  ellipse(mouseX +170, mouseY +310, 20, 20);
  fill(0);
  ellipse(mouseX +170, mouseY +310, 10, 10);
  fill(240,25,80);
  ellipse(mouseX +170, mouseY +310, 2, 2);
  




  //head
  stroke(210,200,70);
  fill(250,230,120);
  ellipse(mouseX +170,mouseY + 130, 70, 70);

  //eyes

  fill(255); 
  ellipse(mouseX +150, mouseY +120, 17, 17);
  fill(255); 
  ellipse(mouseX +190, mouseY +120, 17, 17);
  fill(0); 
  ellipse(mouseX +150, mouseY +120, 8, 8);
  fill(0); 
  ellipse(mouseX +190, mouseY +120, 8, 8);
  fill(0, 255, 0); 
  ellipse(mouseX +150, mouseY +120, 3, 3);
  fill(225, 0, 0); 
  ellipse(mouseX +190, mouseY +120, 3, 3);


  //smile
  fill(240,25,80);
  arc(mouseX +170, mouseY + 165, 20, 20, QUARTER_PI, PI+QUARTER_PI);


  //hairs
  noStroke();
  fill(0);
  ellipse(mouseX +140, mouseY +51, 15, 15);
  ellipse(mouseX +110, mouseY +70, 15, 15);
  ellipse(mouseX +90, mouseY +100, 15, 15);
  //ellipse(170, 51, 15, 15);
  triangle(mouseX +160, mouseY +60, mouseX +180, mouseY +60, mouseX +170, mouseY +0);
  ellipse(mouseX +200, mouseY +51, 15, 15);
  ellipse(mouseX +230, mouseY +70, 15, 15);
  ellipse(mouseX +250, mouseY +100, 15, 15);

  //hands
  stroke(210,200,70);
  fill(250,230,120);
  ellipse(mouseX +30, mouseY +360, 15, 15);
  ellipse(mouseX +10, mouseY +350, 8, 8);
  ellipse(mouseX +10, mouseY +370, 8, 8);
  ellipse(mouseX +25, mouseY +381, 8, 8);
  ellipse(mouseX +45, mouseY +375, 8, 8);

  ellipse(mouseX +310, mouseY +360, 15, 15);
  ellipse(mouseX +330, mouseY +350, 8, 8);
  ellipse(mouseX +330, mouseY +370, 8, 8);
  ellipse(mouseX +315, mouseY +381, 8, 8);
  ellipse(mouseX +295, mouseY +375, 8, 8);

  //feets
  stroke(210,200,70);
  fill(250,230,120);
  ellipse(mouseX +120, mouseY +550, 30, 30);
  ellipse(mouseX +220, mouseY +550, 30, 30);

  //lace
  stroke(255,130,0);
  fill(60, 197, 222);
  quad(mouseX +100, mouseY +520, mouseX +140, mouseY +540, mouseX +140, mouseY +520, mouseX +100, mouseY +540);
  quad(mouseX +200, mouseY +520, mouseX +240, mouseY +540, mouseX +240, mouseY +520, mouseX +200, mouseY +540);

  //bow
  stroke(255,130,0);
  fill(60, 197, 222);
  quad(mouseX +140, mouseY +200, mouseX +200, mouseY +240, mouseX +200, mouseY +200, mouseX +140, mouseY +240);
}


