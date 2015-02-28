
Catcher myCatcher;
Spider[] mySpider;
GameOver gameOver;
YouLose youLose;
Start myStart;

  
 int score = 0;
 int lives = 0; //allowed to miss 10 spiders before game over
 int play = 0;
 PFont f;
  
void setup(){
size(1000, 450);
 
f = createFont("Arial",14,true); // A font to write text on the screen
  frameRate(24);
  myCatcher = new Catcher();
  smooth();
  
  gameOver = new GameOver();
  youLose = new YouLose();
   myStart = new Start();
    
  mySpider = new Spider[17];
  mySpider[0] = new Spider();
  mySpider[1] = new Spider();
  mySpider[2] = new Spider();
  mySpider[3] = new Spider();
  mySpider[4] = new Spider();
  mySpider[5] = new Spider();
  mySpider[6] = new Spider();
  mySpider[7] = new Spider();
  mySpider[8] = new Spider();
  mySpider[9] = new Spider();
  mySpider[10] = new Spider();
  mySpider[11] = new Spider();
  mySpider[12] = new Spider();
  mySpider[13] = new Spider();
  mySpider[14] = new Spider();
  mySpider[15] = new Spider();
  mySpider[16] = new Spider();
  }
 
  
void draw(){
  background(80);
    if (score >= 30){
    gameOver.display();
    }
    else if (lives >= 10){
     youLose.display(); 
    }
    else if (play >= 1){
    int q;
  for (q = 0; q < 17; q++){
    mySpider[q].display();
    mySpider[q].fall();
     
  if ((abs(mouseY - mySpider[q].bodyY) < 20) && (abs(mouseX - mySpider[q].bodyX) < 20)){
      mySpider[q].caught();
   println(q + " caught");
  }
  }
    myCatcher.display();
    
    // Display number of lives left
    textFont(f,14);
    fill(0);
   // text("Spiders Missed: " + lives,10,20);
    text("Score: " + score, 300, 20);
    text("Missed: " + lives, 100, 20);
}
else{
  myStart.display();
}
}
  



  
class Catcher{
 float r;  //radius
 float x = mouseX;
 float y = mouseY;
   
 Catcher(){
  r = 20;
 }
   
void display(){
 noStroke();
 noFill();
ellipse(mouseX, mouseY, r, r);
}
}

class GameOver{
  float bodyX;
  float bodyY;
  
  GameOver(){
    bodyX = 770;
    bodyY = 80;
  }
  
  void display(){
    fill(100);
    stroke(255, 175, 13);
    rect(width/2, height/2, 1000, 450);
    textFont(f,48);
    textAlign(CENTER);
    fill(0);
    text("YOU WON!!",250,height/2);
    
    //trophie
    fill(255, 222, 0);
        //handles
    beginShape();
    vertex(680, 140);
    vertex(620, 140);
    vertex(620, 220);
    vertex(680, 280); 
    vertex(700, 240);
    vertex(860, 140);
    vertex(920, 140);
    vertex(920, 220);
    vertex(860, 280); 
    vertex(840, 240);
    endShape();
    //cup
    beginShape();
    vertex(680, 120);
    vertex(680, 180);
    vertex(720, 300);
    vertex(750, 320);
    vertex(790, 320);
    vertex(820, 300);
    vertex(860, 180);
    vertex(860, 120);
    endShape();
    
    rect(770, 335, 20, 30);
    
    beginShape();
    vertex(760, 350);
    vertex(720, 380);
    vertex(720, 400);
    vertex(820, 400);
    vertex(820, 380);
    vertex(780, 350);
    endShape();

    
    //spider on top
  //most top and bottom legs
  line(bodyX, bodyY, bodyX+25, bodyY+25);
  line(bodyX, bodyY, bodyX-25, bodyY-25);
  line(bodyX, bodyY, bodyX+25, bodyY-25);
  line(bodyX, bodyY, bodyX-25, bodyY+25);
  //middle legs
  line(bodyX, bodyY, bodyX-29, bodyY-9);
  line(bodyX, bodyY, bodyX-29, bodyY+9);
  line(bodyX, bodyY, bodyX+29, bodyY+9);
  line(bodyX, bodyY, bodyX+29, bodyY-9);
  //body
  ellipse(bodyX, bodyY, 40, 40);
  ellipse(bodyX, bodyY-25, 20, 20);
  line(770, 100, 770, 120);
  
  //squished spider
  fill(0);
    stroke(0);
  line(715, 400, 705, 395);
  line(712, 400, 700, 407);
  line(725, 400, 735, 393);
  line(730, 400, 740, 397);
  stroke(255, 0, 0);
  ellipse(720, 400, 13, 13);
  
  //reset button
  textFont(f, 18);
  text("Restart", 900, 425);
  
   if ((mouseX >= 880) && (mouseX <= 920) && (mouseY >= 415) && (mouseY <= 435)){
     play = 0;
       lives = 0;
        score = 0;
  myStart.display(); 
   }

  }
}
class Spider{
float bodyX;
float bodyY;
float i;
float s;
float d;
float speed;
float opacity;
float bodyR;
float outlineRed;
float outlineGreen;
float bodyColor;
  
Spider (){
  bodyX = int(random(width));
  bodyY = int(random(height/2));
  i= random(23, 27);
  s= random(28, 31);
  d= random(8, 11);
  bodyR = random(30, 40);
  speed = random(1, 2.5);
  opacity = 200;
  outlineRed = random(80, 255);
  outlineGreen = random(0, 180);
  bodyColor = random(0, 40);
}
  
  
void display(){
    ellipseMode(CENTER);
  rectMode(CENTER);
    
  //web
stroke(255, opacity);
line(bodyX, 0, bodyX, bodyY);
  
 //legs
  stroke(0);
  strokeWeight(2);
  //makes legs move
  i= random(23, 27);
  //most top and bottom legs
  line(bodyX, bodyY, bodyX+i, bodyY+i);
  line(bodyX, bodyY, bodyX-i, bodyY-i);
  line(bodyX, bodyY, bodyX+i, bodyY-i);
  line(bodyX, bodyY, bodyX-i, bodyY+i);
    
  //makes legs move
  s= random(28, 31);
  d= random(8, 11);
  //middle legs
  line(bodyX, bodyY, bodyX-s, bodyY-d);
  line(bodyX, bodyY, bodyX-s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY-d);
    
  //body
  stroke(outlineRed, outlineGreen, 0);
  fill(bodyColor);
  ellipse(bodyX, bodyY, bodyR, bodyR);
  ellipse(bodyX, bodyY+25, 10, 10);
}
  
void fall(){
    if (bodyY >= 474){
    bodyY = random(-40, -10);
    bodyX = random(width);
    opacity = 200;

  }else {
    bodyY+= speed;
  }
    if ((bodyY >= 472) && (bodyY <= 474)){
    lives++;
    }
}
  
// If the spider is caught
void caught() {
   bodyY = 475;
   opacity = 0;
   score++;
}
}


class Start{
 
 Start(){
  
 }

void display(){
  fill(100);
  rectMode(CENTER);
  rect(width/2, height/2, 1000, 450);
  textFont(f, 52);
  textAlign(CENTER);
  fill(0);
  text("SWAT THE SPIDERS!", 350, 70);
  
  textFont(f, 26);
  text("Swat and kill the spiders", 350, 120);
  text("before they take over", 350, 150);
  text("your house!", 350, 180);
  
  textFont(f, 18);
  text("Get 300 spiders to win", 350, 220);
  text("Miss 10 spiders and you lose", 350, 240);
  
  rect(350, 370, 200, 100);
  
  fill(255);
  textFont(f, 55);
  text("PLAY", 350, 390);
  
  //spider
  stroke(50);
    strokeWeight(5);
    //legs under body
    line(660, 240, 560, 220);
    line(560, 220, 500, 340);
    line(660, 200, 580, 140);
    line(580, 140, 500, 260);
    line(660, 180, 620, 120);
    line(620, 120, 580, 200);
    line(680, 140, 660, 100);
    line(660, 100, 640, 130);
    //body + head
    stroke(255, 0, 0);
    fill(0);
    ellipse(740, 200, 240, 240);
    ellipse(720, 240, 80, 80);
    fill(255);
    ellipse(710, 235, 10, 10);
    ellipse(730, 235, 10, 10);
    fill(255, 0, 0);
    triangle(700, 230, 715, 230, 700, 220);
    triangle(725, 230, 740, 230, 740, 220);
    triangle(710, 260, 710, 270, 740, 250);
    //legs over body
    stroke(50);
    line(800, 140, 840, 100);
    line(840, 100, 880, 160);
    line(820, 180, 880, 120);
    line(880, 120, 940, 180);
    line(820, 220, 920, 180);
    line(920, 180, 980, 260);
    line(800, 260, 920, 240);
    line(920, 240, 970, 380);
  
  
  if ((mouseX >= 280) && (mouseX <= 480) && (mouseY >= 320) && (mouseY <= 420)){
  play++; 
  println("play");
   }
} 
}



class YouLose{
  
  YouLose(){
  }
  
  void display(){
    fill(100);
    stroke(255, 0, 0);
    rect(width/2, height/2, 1000, 450);
    textFont(f,48);
    textAlign(CENTER);
    fill(0);
    text("YOU LOSE",250,height/2);
    
    //reset button
    textFont(f, 18);
    text("Restart", 900, 425);
    
    stroke(50);
    strokeWeight(5);
    //legs under body
    line(660, 240, 560, 220);
    line(560, 220, 500, 340);
    line(660, 200, 580, 140);
    line(580, 140, 500, 260);
    line(660, 180, 620, 120);
    line(620, 120, 580, 200);
    line(680, 140, 660, 100);
    line(660, 100, 640, 130);
    //body + head
    stroke(255, 0, 0);
    fill(0);
    ellipse(740, 200, 240, 240);
    ellipse(720, 240, 80, 80);
    fill(255);
    ellipse(710, 235, 10, 10);
    ellipse(730, 235, 10, 10);
    fill(255, 0, 0);
    triangle(700, 230, 715, 230, 700, 220);
    triangle(725, 230, 740, 230, 740, 220);
    triangle(710, 260, 710, 270, 740, 250);
    //legs over body
    stroke(50);
    line(800, 140, 840, 100);
    line(840, 100, 880, 160);
    line(820, 180, 880, 120);
    line(880, 120, 940, 180);
    line(820, 220, 920, 180);
    line(920, 180, 980, 260);
    line(800, 260, 920, 240);
    line(920, 240, 970, 380);
    
      if ((mouseX >= 880) && (mouseX <= 920) && (mouseY >= 415) && (mouseY <= 435)){
        play = 0;
       lives = 0;
        score = 0;
  myStart.display(); 
   }
  }
}


