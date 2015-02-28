
PImage img;
int x;
int y;
int rectLeftX;
int rectTopY;

Object[] objects= new Object[1]; 

void setup() {
  size(600,600);
  smooth();
  img = loadImage("Planet500.png");
  for (int i = 0; i < objects.length; i ++ ) { 
    objects[i] = new Object(color(i*2),0,i*2,i/20.0); 
  }
}

void draw() {
  size(600,600);
  background(255);
  smooth();
  x = 0;
  
  for (int i = 0; i < objects.length; i ++ ) { 
    objects[i].move();
    objects[i].display();
  }
  if(mousePressed){
   if(mouseButton == LEFT && mouseX < 310 && mouseY < 500){
    x = x - 300;
  
  fill(#FF0000); // Truck rect
  stroke(10);
  rect(100+x,330,200,150);
  
  fill(#BDBDBD); // Tire 1(1)
  stroke(5);
  ellipse(150+x,480,50,50);
  
  fill(#FBFBEF); // Tire 1(2)
  noStroke();
  ellipse(150+x,480,20,20);
  
  fill(#FF0000); // Truck rect 2
  stroke(10);
  rect(303+x,380,80,100);
  
  fill(#BDBDBD); // Tire 2(1)
  stroke(5);
  ellipse(340+x,480,50,50);
  
  fill(#FBFBEF); // Tire 2(2)
  noStroke();
  ellipse(340+x,480,20,20);
  
  fill(#FBFBEF); // Window
  stroke(5);
  rect(310+x,390,60,40);
  
  textSize(30);
  text("Coca Cola",125+x,370);
  
  fill(#BDBDBD); // Truck chimney
  stroke(5);
  rect(303+x,340,10,40);
  
  fill(#EFF2FB); // Smoke
  noStroke();
  rect(307+x,325,10,10);
  rect(300+x,310,10,10);
  rect(315+x,310,10,10);
  rect(285+x,300,10,10);
  rect(270+x,280,10,10);
  rect(255+x,270,10,10);
  rect(235+x,250,10,10);
   }
  }
  if (mousePressed){
    if(mouseButton == RIGHT && mouseX > 390 && mouseY < 500) {
    x = x + 300;
  
  fill(#FF0000); // Truck rect
  stroke(10);
  rect(100+x,330,200,150);
  
  fill(#BDBDBD); // Tire 1(1)
  stroke(5);
  ellipse(150+x,480,50,50);
  
  fill(#FBFBEF); // Tire 1(2)
  noStroke();
  ellipse(150+x,480,20,20);
  
  fill(#FF0000); // Truck rect 2
  stroke(10);
  rect(303+x,380,80,100);
  
  fill(#BDBDBD); // Tire 2(1)
  stroke(5);
  ellipse(340+x,480,50,50);
  
  fill(#FBFBEF); // Tire 2(2)
  noStroke();
  ellipse(340+x,480,20,20);
  
  fill(#FBFBEF); // Window
  stroke(5);
  rect(310+x,390,60,40);
  
  textSize(30);
  text("Coca Cola",125+x,370);
  
  fill(#BDBDBD); // Truck chimney
  stroke(5);
  rect(303+x,340,10,40);
  
  fill(#EFF2FB); // Smoke
  noStroke();
  rect(307+x,325,10,10);
  rect(300+x,310,10,10);
  rect(315+x,310,10,10);
  rect(285+x,300,10,10);
  rect(270+x,280,10,10);
  rect(255+x,270,10,10);
  rect(235+x,250,10,10);
  
    }
  }
  
  if(mousePressed){
   if(mouseY < 300 && mouseX > 300 && mouseButton == LEFT){
    x = x + 100;
    fill(#F7FE2E); // Sun
    noStroke();
    ellipse(100+x,100,100,100);
  
    fill(#F7FE2E); // Sun Rays
    stroke(1);
    line(100+x,16,100+x,46);
    line(100+x,154,100+x,184);
    line(16+x,100,46+x,100);
    line(154+x,100,184+x,100);
  
    //angular
    line(58+x,58,25+x,25);
    line(138+x,58,165+x,25);
    line(60+x,142,28+x,181);
    line(138+x,138,164+x,187);
    
   }
   
  }

  if(mousePressed){
    if(mouseY > 500 && mouseButton == LEFT){
      fill(#B40404); // Meteor 1
      stroke(40);
      ellipse(450,100,100,100);
      fill(#000000);
      stroke(1);
      rect(425,100,20,20);
      rect(435,80,50,10);
      rect(460,100,10,30);
      line(480,30,520,10);
      line(500,50,550,20);
      line(510,80,560,50);
      line(520,120,570,90);
      
    }
  }
  
  if(mousePressed){
    if(mouseY > 500 && mouseButton == RIGHT){
      fill(#B40404); // Meteor 1
      stroke(40);
      ellipse(450,100,100,100);
      fill(#000000);
      stroke(1);
      rect(425,100,20,20);
      rect(435,80,50,10);
      rect(460,100,10,30);
      line(480,30,520,10);
      line(500,50,550,20);
      line(510,80,560,50);
      line(520,120,570,90);
      
      fill(#B40404); // Meteor 2
      stroke(40);
      ellipse(450,250,100,100);
      fill(#000000);
      stroke(1);
      rect(425,250,20,20);
      rect(435,230,50,10);
      rect(460,250,10,30);
      line(480,200,520,170);
      line(500,230,550,200);
      line(510,260,560,230);
      line(520,280,570,260);
      
      fill(#B40404); // Meteor 3
      stroke(40);
      ellipse(250,100,100,100);
      fill(#000000);
      stroke(1);
      rect(225,100,20,20);
      rect(235,80,50,10);
      rect(260,100,10,30);
      line(280,30,320,10);
      line(300,50,350,20);
      line(310,80,360,50);
      line(320,120,370,90);
      
    }
  }
  
  if(mousePressed){
    if(mouseX > 310 && mouseX < 370 && mouseY > 390 && mouseY < 430){
      stroke(10);
      line(340,430,340,410);
      ellipse(340,410,10,10);
      stroke(0);
      line(340,420,350,415);
      line(340,420,350,425);
      ellipse(360,420,10,10);
      line(360,423,370,425);
      stroke(2);
      line(340,407,347,407);
      
    }
  }
  
  if(mousePressed){
    if(mouseX > 50 && mouseX < 200 && mouseY > 50 && mouseY < 200 && mouseButton == RIGHT){
      fill(#F6CECE);
      ellipse(100,100,105,105);
    }
  }
  
  if(mousePressed){
    if(mouseX > 550 && mouseY <50 && mouseButton == RIGHT){
      image(img,0,0,600,600);
    }
  }
      
}

class Object { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int x;
  int y;

  Object(color c_, float xpos_, float ypos_, float xspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  }

  void display() {
  fill(#3B170B); // Ground
  noStroke();
  rect(0,500,600,100);
  
  fill(#FF0000); // Truck rect
  stroke(10);
  rect(100,330,200,150);
  
  fill(#BDBDBD); // Tire 1(1)
  stroke(5);
  ellipse(150,480,50,50);
  
  fill(#FBFBEF); // Tire 1(2)
  noStroke();
  ellipse(150,480,20,20);
  
  fill(#FF0000); // Truck rect 2
  stroke(10);
  rect(303,380,80,100);
  
  fill(#BDBDBD); // Tire 2(1)
  stroke(5);
  ellipse(340,480,50,50);
  
  fill(#FBFBEF); // Tire 2(2)
  noStroke();
  ellipse(340,480,20,20);
  
  fill(#FBFBEF); // Window
  stroke(5);
  rect(310,390,60,40);
  
  textSize(30);
  text("Coca Cola",125,370);
  
  fill(#BDBDBD); // Truck chimney
  stroke(5);
  rect(303,340,10,40);
  
  fill(#EFF2FB); // Smoke
  noStroke();
  rect(307,325,10,10);
  rect(300,310,10,10);
  rect(315,310,10,10);
  rect(285,300,10,10);
  rect(270,280,10,10);
  rect(255,270,10,10);
  rect(235,250,10,10);
  
  fill(#F7FE2E); // Sun
  noStroke();
  ellipse(100,100,100,100);
  
  fill(#F7FE2E); // Sun Rays
  stroke(1);
  line(100,16,100,46);
  line(100,154,100,184);
  line(16,100,46,100);
  line(154,100,184,100);
  
  //angular
  line(58,58,25,25);
  line(138,58,165,25);
  line(60,142,28,181);
  line(138,138,164,187);
  
  fill(#FBFBEF); // Road pauldrons
  stroke(1);
  rect(20,500,60,30);
  rect(190,500,60,30);
  rect(360,500,60,30);
  rect(530,500,60,30);
  //divider
  fill(#000000);
  noStroke();
  rect(0,550,600,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width/100) {
      xpos = 1;
    }
  } 
 
  
}


