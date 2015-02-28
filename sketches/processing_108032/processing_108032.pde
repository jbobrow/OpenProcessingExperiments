
int nbOfHorizontalLines = 40;
int nbOfVerticalLines = 60;

void setup() {
size(450,400);
background(254, 246, 190);
smooth();
}

void draw() {
ellipseMode(CENTER);
rectMode(CENTER);

stroke(0);
fill(255);
strokeWeight(1);

/*float distanceBetweenHorizontalLines = (float)height/nbOfHorizontalLines;
float distanceBetweenVerticalLines = (float)width/nbOfVerticalLines;

for(int i = 0; i < nbOfHorizontalLines; i++)
  {
    line(0, i*distanceBetweenHorizontalLines, width, i*distanceBetweenHorizontalLines);

  }

for(int i = 0; i < nbOfVerticalLines; i++)
  {
    line (i*distanceBetweenVerticalLines,0,i*distanceBetweenVerticalLines, height);
  }
  */
//finn's backpack
fill(93, 191, 56);
ellipse(115, 250, 210, 200);
//finn's head
//top
fill(255);
arc(115, 50, 90, 20, PI, TWO_PI, OPEN);
//left
arc(31, 100, 7, 100, HALF_PI, PI+HALF_PI, OPEN);
//right
arc(199, 100, 7, 100, PI+HALF_PI, TWO_PI+HALF_PI, OPEN);
//finn's ears
arc(50, 50, 40, 60, PI, TWO_PI, OPEN);
arc(180, 50, 40, 60, PI, TWO_PI, OPEN);
noStroke();
rect(115, 100, 169, 100);
stroke(0);
//finn's face
fill(254, 212, 187);
ellipse(115, 100, 120, 90);
//finn's eyes
fill(0); 
ellipse(90, 90, 5, 6); 
ellipse(140, 90, 5, 6); 
//finn's mouth
noFill(); 
arc(115, 100, 30, 10, 0, PI, OPEN);
fill(243, 94, 51); 
arc(114, 105, 11, 17, 0, PI, OPEN);
line(114, 105, 114, 110);

//finn's bod
//finn's arms
fill(254, 212, 187);
quad(190, 160, 290, 260, 275, 275, 175, 175);
quad(40, 160, -60, 260, -45, 275, 55, 175);
//shirt sleeve
fill(34, 176, 243);
quad(200, 150, 250, 200, 215, 235, 165, 185);
quad(30, 150, -20, 200, 15, 235, 65, 185);
//shirt rect
fill(34, 176, 243);
rect(115, 250, 170, 200);
//finn's backpack straps
//top straps
fill(155, 244, 118);
rect(30, 175, 30, 50); 
rect(200, 175, 30, 50);
//bottom straps
fill(93, 191, 56);
quad(15, 200, 45, 200, 30, 260, 15, 260);
quad(185, 200, 215, 200, 215, 260, 200, 260);
//rect(30, 225, 30, 60); 
//rect(200, 225, 30, 60);
//shorts legs
fill(35, 119, 243);
rect(45, 380, 30, 40);
rect(185, 380, 30, 40);
//shorts rect
fill(35, 119, 243);
rect(115, 370, 170, 40);
//shirt curve
fill(34, 176, 243);
arc(115, 350, 170, 10, 0, PI, OPEN);
//shorts curve
fill(35, 119, 243);
arc(115, 390, 170, 10, 0, PI, OPEN);

//Jake's Bod
//jake's legs
fill(255, 198, 31);
rect(310, 380, 30, 60);
rect(390, 380, 30, 60);
//bod
rect(350, 270, 170, 240, 200);
//jake's arms
rect(310, 300, 20, 80);
rect(390, 300, 20, 80);
arc(310, 265, 20, 25, PI, TWO_PI, OPEN);
arc(390, 265, 20, 25, PI, TWO_PI, OPEN);
noStroke();
rect(350, 340, 105, 20);
stroke(0);
//jake's ears
arc(278, 215, 30, 70, 0, PI+HALF_PI, OPEN);
arc(422, 215, 30, 70, PI+HALF_PI, TWO_PI+PI, OPEN);
//jake's eyes
fill(0); 
ellipse(310, 200, 60, 60);
ellipse(390, 200, 60, 60);
fill(255);
ellipse(310, 200, 43, 45);
ellipse(390, 200, 43, 45);
//jake's mouth
noFill();
strokeWeight(3);
arc(350, 235, 20, 20, 0, PI, OPEN);
//jake's jowls
strokeWeight(1);
fill(255, 198, 31);
arc(330, 237, 30, 55, 0, PI+HALF_PI, OPEN);
arc(370, 237, 30, 55, PI+HALF_PI, TWO_PI+PI, OPEN);
arc(350, 214, 55, 20, PI, TWO_PI, OPEN);
noStroke();
rect(350, 215, 35, 15);
//beginShape();
//vertex(340, 230);
//bezierVertex(320, 400, 250, 280, 300, 250);
//bezierVertex(310, 200, 300, 220, 350, 210);
//bezierVertex(390, 200, 390, 250, 380, 270);
//bezierVertex(360, 300, 350, 300, 360, 230);
//endShape();
//jake's nose
fill(0); 
ellipse(350, 230, 30, 15);
}


