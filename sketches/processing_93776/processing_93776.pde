
float a = 10;

class Balloons{
  float size;
  int ballColor;
  float xpos;
  float ypos;
  
  Balloons(int Size,int Color,float X,float Y) {
    size = Size;
    ballColor = Color;
    xpos= X;
    ypos= Y;
  }
  void display(){
    noStroke();
    if(ballColor == 0)
    fill(100, 255, 50);
    else if(ballColor == 1)
    fill(100, 200, 209);
    else if(ballColor == 2)
    fill(255, 240, 100);
    else if(ballColor == 3)
    fill(255, 155, 100);
    else if(ballColor == 4)
    fill(180, 100, 255);
    else if(ballColor == 5)
    fill(255, 100, 200);
    else if(ballColor == 6)
    fill(255, 80, 20);

    triangle(xpos, ypos, xpos - 10, ypos + size * 2, xpos + 10, ypos + size * 2);
    ellipse(xpos, ypos, size * 3, size * 3.2);
  }
}

Balloons[] balloons = new Balloons[10];

void setup() {
  size(800, 800);  
    
  balloons[0] = new Balloons(50, 0, 400, 300);
  balloons[1] = new Balloons(50, 1, 450, 370);
  balloons[2] = new Balloons(50, 5, 600, 400);
  balloons[3] = new Balloons(50, 3, 350, 350); 
  balloons[4] = new Balloons(50, 4, 450, 300);
  balloons[5] = new Balloons(50, 5, 300, 370); 
  balloons[6] = new Balloons(50, 6, 570, 500);  
  balloons[7] = new Balloons(50, 2, 480, 400);   
  balloons[8] = new Balloons(50, 3, 250, 480);  
  balloons[9] = new Balloons(50, 1, 500, 450);    
}

void draw() {
  background(220, 240, 255);
  
  //the ground
  fill(220, 200, 180);
  noStroke();
  ellipse(width / 2, height, width * 2, height * 1.5);
  
  //the chileren's arm
  stroke(240, 220, 210);
  strokeWeight(15);
  line(100, 620, 125, 640);
  line(100, 620, 75, 640);
  
  line(200, 570, 225, 590);
  line(200, 570, 175, 590);

  line(400, 670, 430, 710);
  line(400, 670, 370, 710);
  
  line(620, 520, 645, 540);
  line(620, 520, 595, 540);

  line(670, 570, 700, 610);
  line(670, 570, 640, 610);

  stroke(200, 180, 160);  
  line(150, 500, 175, 520);
  line(150, 500, 125, 520);
  
  line(280, 650, 310, 690);
  line(280, 650, 250, 690);
  
  line(380, 315, 400, 330);
  line(380, 315, 360, 330);
  
  stroke(240, 220, 210);
  line(430, 315, 450, 330);
  line(430, 315, 410, 330);
  
  line(600, 420, 625, 440);
  line(600, 420, 575, 440);
  
  //the children's legs
  strokeWeight(5);
  fill(240, 220, 210);
  rect(103, 650, 12, 20, 0, 0, 10, 10);
  rect(85, 650, 12, 20, 0, 0, 10, 10);  
  
  rect(203, 600, 12, 20, 0, 0, 10, 10);
  rect(185, 600, 12, 20, 0, 0, 10, 10);  

  rect(403, 700, 15, 50, 0, 0, 10, 10);
  rect(382, 700, 15, 50, 0, 0, 10, 10);  
  
  rect(623, 550, 12, 20, 0, 0, 10, 10);
  rect(605, 550, 12, 20, 0, 0, 10, 10);

  rect(673, 600, 15, 50, 0, 0, 10, 10);
  rect(652, 600, 15, 50, 0, 0, 10, 10);
  
  stroke(200, 180, 160);
  fill(200, 180, 160);    
  rect(153, 530, 12, 20, 0, 0, 10, 10);
  rect(135, 530, 12, 20, 0, 0, 10, 10); 

  rect(283, 680, 15, 50, 0, 0, 10, 10);
  rect(262, 680, 15, 50, 0, 0, 10, 10);    

  rect(383, 335, 8, 18, 0, 0, 10, 10);
  rect(369, 335, 8, 18, 0, 0, 10, 10);  

  stroke(240, 220, 210);
  fill(240, 220, 210);    
  rect(433, 335, 8, 18, 0, 0, 10, 10);
  rect(419, 335, 8, 18, 0, 0, 10, 10); 

  rect(603, 450, 15, 20, 0, 0, 10, 10);
  rect(582, 450, 15, 20, 0, 0, 10, 10);   
  
  //the children's body
  fill(200, 240, 210);
  noStroke();
  triangle(100, 600, 125, 650, 75, 650);
  triangle(200, 550, 225, 600, 175, 600);
  triangle(400, 650, 430, 720, 370, 720);
  triangle(620, 500, 645, 550, 595, 550);
  triangle(670, 550, 700, 620, 640, 620);
  triangle(150, 480, 175, 530, 125, 530);
  triangle(280, 630, 310, 700, 250, 700);
  triangle(380, 300, 400, 340, 360, 340);
  triangle(430, 300, 450, 340, 410, 340);
  triangle(600, 400, 625, 450, 575, 450);
  
  //the children's faces
  fill(240, 220, 210);
  ellipse(100, 600, 50, 50);
  ellipse(200, 550, 50, 50);
  ellipse(400, 650, 60, 60);
  ellipse(620, 500, 45, 45);
  ellipse(670, 550, 60, 60);
  fill(200, 180, 160);
  ellipse(150, 480, 45, 45);
  ellipse(280, 630, 60, 60);
  ellipse(380, 300, 30, 30);
  fill(240, 220, 210);
  ellipse(430, 300, 30, 30);
  ellipse(600, 400, 50, 50);
  
  a = a * 1.005;

  for(int i = 0; i < 10; i++) {
    balloons[i].size = a;
  }
  
  for(int i = 0; i < 10; i++) {
    balloons[i].display();
  }

 if(a >= 600) {
   
   background(220, 240, 255);
   textSize(50);
   fill(50);
   text("bye!", 370, height / 2);
 }
}
