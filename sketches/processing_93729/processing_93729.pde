
int backA;
int backB;
int speed;
int growthrateA;
int growthrateB;
int backpoint;

void setup() {
  //canvas size
  size(400, 400);

  //background starts moving at 1 
  backA = 1;
  backB = 1;
  //to change the speed 
  speed = -1;
  //speed growing rate
  growthrateA = speed;
  growthrateB = -speed;
}

void draw() {

  background(171, 242, 0);

  backA = backA + growthrateA; 
  
  if(200+backA==0){
    growthrateA = -speed;
  }
  else if(200+backA==200){
    growthrateA = speed;
  }

  //changing background
  fill(189, 255, 18);
  triangle(0+backA, 0, 200+backA,200, 0+backA,400);

  fill(207, 255, 36);
  triangle(0+backA, 50, 150+backA, 200, 0+backA, 350);

  fill(225, 255, 54);
  triangle(0+backA,100,100+backA,200,0+backA,300);

  backB = backB + growthrateB;
  if(200+backB==400){
    growthrateB = speed;
  }
  else if(200+backB==200){
    growthrateB = -speed;
  }

  fill(189, 255, 18);
  triangle(400+backB, 0, 200+backB,200, 400+backB,400);

  fill(207, 255, 36);
  triangle(400+backB, 50, 250+backB, 200, 400+backB, 350);

  fill(225, 255, 54);
  triangle(400+backB,100,300+backB,200,400+backB,300);
  
  //cat's ear
  fill(176, 176, 176);
  triangle(60, 25, 60, 175, 250, 100);
  triangle(340, 25, 340, 175, 150, 100);
  fill(255, 193, 158);
  triangle(75, 45, 75, 155, 230, 100);
  triangle(325, 45, 325, 155, 170, 100);
  //cat's face
  fill(176, 176, 176);
  ellipse(200, 200, 295, 295);
  //cat's eyes
  fill(178+mouseY/10, 235-mouseY/3, 244-mouseY/3);
  ellipse(150, 150, 12, 12);
  fill(167+mouseY/10, 72+mouseY/3, 255-mouseY/4);
  ellipse(250, 150, 12, 12);
  //cat's nose
  fill(103, 0, 0);
  quad(190, 180, 195, 190, 205, 190, 210, 180);
  //cat's philtrum
  stroke(93, 93, 93);
  strokeWeight(1);
  line(200, 190, 200, 260);
  //cat's freckles
  point(120, 200);
  point(130, 190);
  point(140, 200);
  point(280, 200);
  point(270, 190);
  point(260, 200);
  //cat's mustache
  line(150, 225, 30, 200-mouseX/30);
  line(145, 240, 20, 260);
  line(250, 225, 370, 200-mouseX/30);
  line(255, 240, 380, 260);
  //cat's libon
  noStroke();
  fill(255, 0, 0);
  quad(100, 370, 100, 330, 300, 370, 300, 330);
  //cat's mouth
  fill(187, 41, 41);
  rect(190, 260, 20, mouseY/10, 0, 0, 40, 40);
}
