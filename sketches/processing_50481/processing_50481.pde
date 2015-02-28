
//Ben's Crazy Name function, plus a creepy clown.
//When you move the mouse, my name follows.  If you let the mouse sit my name will go crazy!!!
//After a while the window will clear and start over again.
//Don't click and drag though.  You'll meet a creepy clown that can't take his eyes off of the mouse.

void setup() {
  background(100);
  size(1000,1000);
  frameRate(20);
    
}


//will draw my name following the mouse's movement, if you pause the name flashes in random colors
void drawBen( int strokeWght, float scaleNum) {
  
  strokeWeight(strokeWght);
  
  if (mouseX == pmouseX && mouseY == pmouseY) {
    stroke(random(255),random(255),random(255));
  } else {
    stroke(0);
  }
  //B
  line(mouseX - (scaleNum*4), mouseY - (scaleNum*3), mouseX - (scaleNum*4), mouseY + (scaleNum*2));
  line(mouseX - (scaleNum*4), mouseY + (scaleNum*2), mouseX - (scaleNum*2), mouseY + (scaleNum*2));
  line(mouseX - (scaleNum*2), mouseY + (scaleNum*2), mouseX - (scaleNum*2), mouseY - (scaleNum*1));
  line(mouseX - (scaleNum*2), mouseY - (scaleNum*1), mouseX - (scaleNum*4), mouseY - (scaleNum*1));
  line(mouseX - (scaleNum*3), mouseY - (scaleNum*1), mouseX - (scaleNum*3), mouseY - (scaleNum*3));
  line(mouseX - (scaleNum*3), mouseY - (scaleNum*3), mouseX - (scaleNum*4), mouseY - (scaleNum*3));
  
  //e
  line(mouseX - (scaleNum*1), mouseY - (scaleNum*0), mouseX + (scaleNum*1), mouseY + (scaleNum*0));
  line(mouseX + (scaleNum*1), mouseY - (scaleNum*0), mouseX + (scaleNum*1), mouseY - (scaleNum*1));
  line(mouseX + (scaleNum*1), mouseY - (scaleNum*1), mouseX - (scaleNum*1), mouseY - (scaleNum*1));
  line(mouseX - (scaleNum*1), mouseY - (scaleNum*1), mouseX - (scaleNum*1), mouseY + (scaleNum*2));
  line(mouseX - (scaleNum*1), mouseY + (scaleNum*2), mouseX + (scaleNum*1), mouseY + (scaleNum*2));
  
  //n
  line(mouseX + (scaleNum*2), mouseY - (scaleNum*(7/5)), mouseX + (scaleNum*2), mouseY + (scaleNum*2));
  line(mouseX + (scaleNum*2), mouseY - (scaleNum*1), mouseX + (scaleNum*4), mouseY - (scaleNum*1));
  line(mouseX + (scaleNum*4), mouseY - (scaleNum*1), mouseX + (scaleNum*4), mouseY + (scaleNum*2));
  
}

//tells how to draw a clown
void drawClown() {
  
  background(0);
  noStroke();
  
  //legs
  fill(255);
    //left
  quad(650,900,660,900,650,1000,640,1000);
    //right
  quad(700,900,700,1000,685,1000,690,900);
  
  //body
  fill(255,0,0);
  quad(700,900,650,900,550,425,675,575);
  
  //head
  fill(255);
  ellipse(500,400,250,250);
  
  //arm
  stroke(255);
  strokeWeight(3);
    //arm
  line(600,565,550,640);
  line(550,640,475,615);
    //hand
  line(475,615,495,595);
  line(495,595,485,585);
  line(475,615,460,595);
  line(460,595,462,583);
  line(475,615,450,625);
  line(450,625,440,615);
  
  //hat
  noStroke();
  fill(255,0,0);
  triangle(500,100,400,300,600,300);
  
  //mouth
  fill(255,0,0);
  ellipse(500,480,125,30);
    //arc
  noFill();
  stroke(0);
  strokeWeight(3);
  arc(500,490,120,30, (5*PI/4), (7*PI/4));
  
  
  //nose
  noStroke();
  fill(255,0,0);
  ellipse(500,420,50,50);
  
  //hat balls
  fill(255,255,0);
  ellipse(500,100,50,50);
  ellipse(400,300,50,50);
  ellipse(440,305,50,50);
  ellipse(480,310,50,50);
  ellipse(520,310,50,50);
  ellipse(560,305,50,50);
  ellipse(600,300,50,50);
  
  //eyes
    //blue shadow
  fill(0,0,255);
  ellipse(550,370,60,60);
  ellipse(450,370,60,60);
    //eye balls
  drawEyeBalls();
    //pupils
  drawPupils(550,370,450,370);
}

//draws eyeballs, will be used later to make things seem to move
void drawEyeBalls() {
  fill(255);
  ellipse(550,370,40,40);
  ellipse(450,370,40,40);
}

//draws pupils, will be used later to make things seem to move
void drawPupils(int a, int b, int c, int d) {
  fill(0);
  ellipse(a,b,15,15);
  ellipse(c,d,15,15);
}

//uses many if statements and the drawEyeBalls and drawPupils funcions to make eyes move with the cursor 
void movingEyes() {
  //moving eyes
  if(mouseX < 333) {
    
    if(mouseY< 333) {
      drawEyeBalls();
      drawPupils(540,360,440,360);
    } else if(333 <= mouseY && mouseY < 666) {
      drawEyeBalls();
      drawPupils(540,370,440,370);
    } else {
      drawEyeBalls();
      drawPupils(540,380,440,380);
    }
     
  } else if(333 <= mouseX && mouseX < 666) {
    
    if(mouseY< 333) {
      drawEyeBalls();
      drawPupils(550,360,450,360);
    } else if(333 <= mouseY && mouseY < 666) {
      drawEyeBalls();
      drawPupils(550,370,450,370);
    } else {
      drawEyeBalls();
      drawPupils(550,380,450,380);
    }
    
  } else {
    
    if(mouseY< 333) {
      drawEyeBalls();
      drawPupils(560,360,460,360);
    } else if(333 <= mouseY && mouseY < 666) {
      drawEyeBalls();
      drawPupils(560,370,460,370);
    } else {
      drawEyeBalls();
      drawPupils(560,380,460,380);
    }
    
  }
}

//my timer variable
int time = 0;

//will add to timer variable and use drawBen function whenever the mouse is not pressed
//whenever the mouse is pressed it adds in the moving eyes
void draw() {
  
  if (mousePressed == false) {
     
    time++;
    
    drawBen(5, 20);
      
    if (time > 75) {
      background(100);
      time = 0;
    } 
  }
  
  if (mousePressed) {
    movingEyes();
  }
}

//says when mouse is pressed perform drawClown once
void mousePressed() {
  drawClown();
}

//when the mouse is released it clears everything and puts in the original background
void mouseReleased() {
  background(100);
}

