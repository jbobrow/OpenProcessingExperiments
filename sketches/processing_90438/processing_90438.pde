
/* @pjs preload="Space_invaders.jpg"; */

float enemy1 = 0;
float enemy2 = 0;
float enemy3 = 0;
float boss = 0;
float weakness1 = 0;
float weakness2 = 0;
float time = 0;
float win = 0;
PImage img;

void setup(){
  background(#AAE383);
  size(800,800);
  img = loadImage("Space_invaders.jpg");
}

void draw(){
  time += 0.0167;
  noStroke();
  image(img,0,0,800,800);
  fill(#FF0303);
  textSize(70);
  text("TIME:"+ time,150,400);
  textSize(20);
  
  if(enemy1 == 0){
    fill(#621A56);
    rect(50,50,140,100);
    fill(#F02C2C);
    triangle(70,70,100,130,70,130);
    triangle(170,70,170,130,140,130);
  }
  
  if(enemy1 >= 1){
    fill(#F8FF9D);
    ellipse(120,100,150,150);
    fill(#3BE802);
    text("GOT HIM!",80,100);
  }
  
  if(enemy2 == 0){
    fill(#621A56);
    rect(350,50,140,100);
    fill(#F02C2C);
    triangle(370,70,400,130,370,130);
    triangle(470,70,470,130,440,130);
  }
  
  if(enemy2 >= 1){
    fill(#F8FF9D);
    ellipse(420,100,150,150);
    fill(#3BE802);
    text("HE'S DONE!",360,100);
  }
  
    if(enemy3 == 0){
    fill(#621A56);
    rect(550,50,140,100);
    fill(#F02C2C);
    triangle(570,70,600,130,570,130);
    triangle(670,70,670,130,640,130);
  }
  
  if(enemy3 >= 1){
    fill(#F8FF9D);
    ellipse(620,100,150,150);
    fill(#3BE802);
    text("KABOOM!!",580,100);
  }
  
  if(enemy1 >= 1 && enemy2 >= 1 && enemy3 >= 1){
    boss += 1;
    fill(#FF0D11);
    text("INCOMING BOSS",25,25);
    text("INCOMING BOSS", 600,25);
    
    fill(#621A56);
    rect(25,25,725,225);
    fill(#F02C2C);
    triangle(100,100,350,150,100,150);
    triangle(700,100,450,150,700,150);
    
    if(weakness1 < 3){
    fill(#FF6A6C);
    rect(150,225,100,25);
    }
    
    if(weakness1 >= 3){
    fill(#050501);
    rect(150,225,100,25);
    }
    
    if(weakness2 < 3){
    fill(#FF6A6C);
    rect(550,225,100,25);
    }
    
    if(weakness2 >= 3){
    fill(#050501);
    rect(550,225,100,25);
    }
    
  }
  
  if(time > 10 && win == 0){
      fill(#000000);
      rect(0,0,800,800);
      fill(#FF0000);
      textSize(90);
      text("YOU LOSE LOSER!",0,100);
      text("YOU LOSE LOSER!",0,200);
      text("YOU LOSE LOSER!",0,300);
      text("YOU LOSE LOSER!",0,400);
      text("YOU LOSE LOSER!",0,500);
      text("YOU LOSE LOSER!",0,600);
    }
  
  if(weakness1 >= 3 && weakness2 >= 3){
       win += 1;
      fill(#000000);
      rect(0,0,800,800);
      fill(#10FF0D);
      textSize(90);
      text("YOU WIN WINNER!",0,100);
      text("YOU WIN WINNER!",0,200);
      text("YOU WIN WINNER!",0,300);
      text("YOU WIN WINNER!",0,400);
      text("YOU WIN WINNER!",0,500);
      text("YOU WIN WINNER!",0,600);
  }
  
  fill(#1E98C6);
  triangle(mouseX,700,mouseX-50,800,mouseX+50,800);
  
}

void mousePressed(){
  stroke(#E38383);
  strokeWeight(4);
  line(mouseX,100,mouseX,700);
  
  if(mouseX >= 50 && mouseX <= 150){
    enemy1 += 1;
  }
  
  if(mouseX >= 350 && mouseX <= 450){
    enemy2 += 1;
  }
  
  if(mouseX >= 550 && mouseX <= 650){
    enemy3 += 1;
  }
  
  if(mouseX >= 150 && mouseX <= 250 && boss >= 1){
    weakness1 += 1;
  }
  
  if(mouseX >= 550 && mouseX <= 650 && boss >= 1){
    weakness2 += 1;
  }
}


