
float angle = random(0,TWO_PI);
float speed = .04;
float length1 = 8;
float length2 = 15;
float length3 = 8;
float length4 = 8;
float length5 = 5;
float xpos = 815;
float xpos2 = 815+407;
float Xarea1_1 = 50;
float Xarea1_2 = 150;
float Yarea1_1 = 240+20;
float Yarea1_2 = 240-20;
float Yarea2_1 = 200+20;
float Yarea2_2 = 200-20;
int counter=0;
int diameter = 15;
float ypos = 240;
float ypos2 = 200;
int ballCount = 1;
int ballCount2 = 1;
int ballCount3 = 1;
int ballCount4 = 1;
int ballCount5 =1;
int page = 0;

PFont font;


void setup(){
  size(800,480);
  smooth();
  font = loadFont("GulimChe-48.vlw");
  textFont(font);
}

void draw(){
 if (page == 0){
   instruction();
 }
 if (page == 1){
    levelOne();
  }
  if (page == 2){
    levelTwo();
  }
  if (page == 3){
    levelThree();
  }
  if (page == 4){
    levelFour();
  }

}

void instruction(){
  background(225);
    noStroke();
  fill(255);
  quad(Xarea1_1,0,Xarea1_1,480, Xarea1_2,480, Xarea1_2,0);
  
  textSize(25);
  fill(255,0,0);
  String instructions = "In this game a red box will appear on the left side of the screen, and a red ball on the right.  The ball will scroll across the screen, and the goal of the game is to line the box up with the ball so that it passes through the box for the most amount of time.  The red box is controlled by the 'W' (Up) and 'S' (Down) keys.  In some levels there will be more that one box/ball combination on screen.  The ball/boxes will be colored accordingly.  In this case, the blue box will be controlled by the 'I' (Up) and 'K' (Down) keys.  Each level has a ball counter in the upper right corner, and a score keeper in the lower right. Be careful, as losing one level will cause you to start over.  Good luck!";
  text(instructions, 10, 10, 700, 400);
  text("Click to Begin", 10, 400);
  
  if (mousePressed){
    page = 1;
  }
}

void levelOne(){//GOAL = 150
  background(225);
  
  noStroke();
  fill(255);
  quad(Xarea1_1,0,Xarea1_1,480, Xarea1_2,480, Xarea1_2,0);
  
  stroke(0);
  strokeWeight(2);

 
 fill(255,0,0);
 if(keyPressed){
  if(key == 'w' || key == 'W'){
    Yarea1_1-=5;
    Yarea1_2-=5;
  }
  if(key == 's' || key == 'S'){
    Yarea1_1+=5;
    Yarea1_2+=5;
  }
 }
 

  strokeWeight(2);
  stroke(0);
  xpos -= length1;
  
 if(xpos>=Xarea1_1-15 && xpos<=Xarea1_2+15 && ypos<=Yarea1_1+15 && ypos>=Yarea1_2-15){
    fill(255);
    counter++;
  }
  quad(Xarea1_1, Yarea1_1, Xarea1_2, Yarea1_1 , Xarea1_2, Yarea1_2, Xarea1_1, Yarea1_2);
  fill(255,0,0);
  ellipse(xpos, ypos, diameter,diameter);  
  textSize(25);
  text(counter,710,460);
  text("/150", 750, 460);
  text("Level 1", 700, 30);
  text(11-ballCount, 650, 30);
 

 
  if(xpos <= 0-diameter/2){
    xpos = 815;
    ypos = random(20, 460);
    length1 = 8;
    ballCount++;
  }
  
  if (ballCount > 10){
    length1 = 0;
    if(counter >= 150){
      text("Level 1 Complete --- Click to Begin Next Level", 170, 240);
      if(mousePressed){
        page = 2;
      }
    }
    if(counter < 150){
      text("You Lose --- Reload Program to Try Again", 170, 240);
    }
  }
  
}

void levelTwo(){//GOAL = 85
  background(225);
  
  noStroke();
  fill(255);
  quad(Xarea1_1,0,Xarea1_1,480, Xarea1_2,480, Xarea1_2,0);
  
  stroke(0);
  strokeWeight(2);
  
 fill(255,0,0);
  
 if(keyPressed){
  if(key == 'w' || key == 'W'){
    Yarea1_1-=9;
    Yarea1_2-=9;
  }
  if(key == 's' || key == 'S'){
    Yarea1_1+=9;
    Yarea1_2+=9;
  }
 }

  strokeWeight(2);
  stroke(0);
  xpos -= length2;
  
 if(xpos>=Xarea1_1-15 && xpos<=Xarea1_2+15 && ypos<=Yarea1_1+15 && ypos>=Yarea1_2-15){
    fill(255);
    counter++;
  }
  quad(Xarea1_1, Yarea1_1, Xarea1_2, Yarea1_1 , Xarea1_2, Yarea1_2, Xarea1_1, Yarea1_2);
  fill(255,0,0);
  ellipse(xpos, ypos, diameter,diameter);  
  textSize(25);
  text(counter,710,460);
  text("/235", 750, 460);
  text("Level 2", 700, 30);
    text(11-ballCount2, 650, 30);
 
  if(xpos <= 0-diameter/2){
    xpos = 900;
    ypos = random(20, 460);
    ballCount2++;
  }
  
  if (ballCount2 > 10){
    length2 = 0;
    if(counter >= 235){
      text("Level 2 Complete --- Click to Begin Next Level", 170, 240);
      fill(0,0,255);
      textSize(15);
      text("The next level contains two boxes, so the 'I' (Up) and 'K' (Down) keys will be used to control the blue boxes", 170, 280 , 600, 100);
      if(mousePressed){
        page = 3;
      }
    }
    if(counter < 235){
      text("You Lose --- Reload Program to Try Again", 170, 240);
    }
  }
  
}


void levelThree(){//Goal = 270
  background(225);
  
  noStroke();
  fill(255);
  quad(Xarea1_1,0,Xarea1_1,480, Xarea1_2,480, Xarea1_2,0);
  
  stroke(0);
  strokeWeight(2);
  
 fill(255,0,0);
  
  
 if(keyPressed){
  if(key == 'w' || key == 'W'){
    Yarea1_1-=7;
    Yarea1_2-=7;
  }
  if(key == 's' || key == 'S'){
    Yarea1_1+=7;
    Yarea1_2+=7;
  }
  if(key == 'i' || key == 'I'){
    Yarea2_1-=7;
    Yarea2_2-=7;
  }
  if(key == 'k' || key == 'K'){
    Yarea2_1+=7;
    Yarea2_2+=7;
  }
 }

  fill(255,0,0);
  strokeWeight(2);
  stroke(0);
  xpos -= length4;
  xpos2 -= length3;
  
 if(xpos>=Xarea1_1-15 && xpos<=Xarea1_2+15 && ypos<=Yarea1_1+15 && ypos>=Yarea1_2-15){
    fill(255);
    counter++;
  }
  quad(Xarea1_1, Yarea1_1, Xarea1_2, Yarea1_1 , Xarea1_2, Yarea1_2, Xarea1_1, Yarea1_2);
  fill(255,0,0);
  ellipse(xpos, ypos, diameter,diameter);  
  fill(0,0,255);
  
  if(xpos2>=Xarea1_1-15 && xpos2<=Xarea1_2+15 && ypos2<=Yarea2_1+15 && ypos2>=Yarea2_2-15){
    fill(255);
    counter++;
  }
  
  quad(Xarea1_1, Yarea2_1, Xarea1_2, Yarea2_1 , Xarea1_2, Yarea2_2, Xarea1_1, Yarea2_2);
  fill(0,0,255);
  ellipse(xpos2, ypos2, diameter, diameter);
  fill(255,0,0);
  textSize(25);
  text(counter,710,460);
  text("/505", 750, 460);
  text("Level 3", 700, 30);
  text(11-ballCount3, 650, 30);
  fill(0,0,255);
  text(11-ballCount4, 600, 30); 
 fill(255,0,0); 
 

 
  if(xpos <= 0-diameter/2){
    xpos = 815;
    ypos = random(20, 460);
    ballCount3++;
  }
  
  if(xpos2 <= 0-diameter/2){
    xpos2 = 815;
    ypos2 = random(20,460);
    ballCount4++;
  }
    
  
  if (ballCount3 > 10){
    length4 = 0;

  }
  
  if (ballCount4 > 10){
    length3 = 0;
    if(counter >= 505){
      text("Level 3 Complete --- Click to Begin Next Level", 170, 240);
      if(mousePressed){
        page = 4;
      }
   }
   if(counter < 505){
     text("You Lose --- Reload Program to Try Again", 170, 240);
   }
  }
}


void levelFour(){//Goal = 225
  float ypos = 240+200*sin(angle);
   background(225);
  
  noStroke();
  fill(255);
  quad(Xarea1_1,0,Xarea1_1,480, Xarea1_2,480, Xarea1_2,0);
  
  stroke(0);
  strokeWeight(2);
  
 fill(255,0,0);
 
 if(keyPressed){
  if(key == 'w' || key == 'W'){
    Yarea1_1-=7;
    Yarea1_2-=7;
  }
  if(key == 's' || key == 'S'){
    Yarea1_1+=7;
    Yarea1_2+=7;
  }


 }

  strokeWeight(2);
  stroke(0);
  angle-=speed;
  xpos -= length5;
  
 if(xpos>=Xarea1_1-15 && xpos<=Xarea1_2+15 && ypos<=Yarea1_1+15 && ypos>=Yarea1_2-15){
    fill(255);
    counter++;
  }
  quad(Xarea1_1, Yarea1_1, Xarea1_2, Yarea1_1 , Xarea1_2, Yarea1_2, Xarea1_1, Yarea1_2);
  fill(255,0,0);
  ellipse(xpos, ypos, diameter,diameter);
  textSize(25);  
  text(counter,710,460);
  text("/730", 750, 460);
  text("Level 4", 700, 30);
  text(11-ballCount5, 650, 30);
 

 
  if(xpos <= 0-diameter/2){
    xpos = 815;
    length5 = random(3,5);
    ballCount5++;
  }
  
  if (ballCount5 > 10){
       length5 = 0;
    if(counter >= 730){
      text("Level 4 Complete --- You Have Won. Congratulations!", 170, 240);
      text("Final Score:", 170, 280);
      text(counter, 400, 280);
      if(mousePressed){
        page = 5;
      }
   }
   if(counter < 730){
     text("You Lose --- Reload Program to Try Again", 170, 240);
   }
  }
}

void mousePressed(){
  redraw();
}

  


