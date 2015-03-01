
/* 
@pjs preload="both.png,grilled_cheese.png,human.png,pbj.png,robot.png"; 
 */

PFont font;
PImage robot;
PImage human;
PImage pbj;
PImage grilledcheese;
PImage bothSandwiches;

float humanX;
float humanY;
float robotX;
float robotY;
float diam = 150;

float rImageW = 700;
float rImageH = 300;

float hImageW = 160;
float hImageH = 200;

float fYeahX;
float fYeahY;
float mehX;
float mehY;

float rightieX;
float rightieY;
float leftieX;
float leftieY;
float bothX;
float bothY;

float gImageW = 330;
float gImageH = 300;

float pImageW = 330;
float pImageH = 300;

float bImageW = 720;
float bImageH = 300;

int state = 0; //initial screen


void setup(){
  background(241, 245, 242); //white background
  size(1000, 800);
  noStroke();
  fill(0);
  font = loadFont("AbadiMT-CondensedExtraBold-48.vlw");
  textFont(font, 30);
  
  humanX = width/4; //human button position
  humanY = 150;
  robotX = 3*width/4; //robot button position
  robotY = 150;

  fYeahX = width/4; //fuck yeah button position
  fYeahY = 400;
  mehX = 3*width/4;  //meh button position 
  mehY = 400;

  leftieX = width/4; //leftie button position
  leftieY = 650;
  rightieX = width/2; //rightie button position
  rightieY = 650;
  bothX =  3*width/4; //meh button position
  bothY = 650;
}

void draw(){
  
  if (state == 0){ 
    drawZero();
} else if (state == 1){
    drawOne();
} else if (state == 2){
    drawTwo();
} else if (state == 3){
    drawThree();
} else if (state == 4){
    drawFour();
} else if (state == 5){
    drawFive();
} else if (state == 6){
    drawSix();
} else if (state == 7){
    drawSeven();
}

}

void mousePressed(){
  if (state == 0){
    if(dist(mouseX, mouseY, humanX, humanY)<diam/2){
      state = 1;
    }
    if(dist(mouseX, mouseY, robotX, robotY)<diam/2){
      state = 2;
    }
  }
  
  if (state == 1){
    if(dist(mouseX, mouseY, fYeahX, fYeahY)<diam/2){
      state = 3;
    }
    if(dist(mouseX, mouseY, mehX, mehY)<diam/2){
      state = 4;
    }
  }
  
  if (state == 2){
    if((mouseX>width/6) && (mouseX<5*width/6) && (mouseY>height/3+100) && (mouseY<height/3+300)){
      state = 0;
      }
    }
    
  if (state == 3){
    if(dist(mouseX, mouseY, leftieX, leftieY)<diam/2){
      state = 5;
      }
    if(dist(mouseX, mouseY, rightieX, rightieY)<diam/2){
      state = 6;
      }
    if(dist(mouseX, mouseY, bothX, bothY)<diam/2){
      state = 7;
      }
    }
   
   if (state == 4){
     if((mouseX>2*width/3) && (mouseY>2*height/3)){
       state = 0;
     }
   }
   
   if (state == 5){
     if((mouseY>height/2-150) && (mouseY<height/2+150)){
       state = 0;
     }
   }
   
   if (state == 6){
     if((mouseY>height/2-150) && (mouseY<height/2+150)){
       state = 0;
     }
   }
   
   if (state == 7){
     if((mouseY>height/2-150) && (mouseY<height/2+150)){
       state = 0;
     }
   }
   
   
}
void drawZero(){ //draws initial screen
    background(241, 245, 242); //white background

    fill(13, 15, 14); //black question
    text("ARE YOU A...", (width/2-120), 50);
    noStroke();
    
    fill(244, 131, 108); //coral button
    noStroke();
    ellipse(humanX, humanY, diam, diam); //human button

    fill(241, 245, 242);
    text("HUMAN", (humanX-65), 162); //human button text

    fill(244, 131, 108); //coral button
    noStroke();
    ellipse(robotX, robotY, diam, diam); //robot button

    fill(241, 245, 242);
    noStroke();
    text("ROBOT", (3*width/4-65), 162); //robot button text
}

void drawOne(){ //draws human answer and second human question
    background(241, 245, 242); //white background

    fill(13, 15, 14); //black question
    text("ARE YOU A...", (width/2-120), 50);
    noStroke();
    
    fill(240, 81, 81); //red button
    noStroke();
    ellipse(humanX, humanY, diam, diam); //human button red if pressed

    fill(241, 245, 242);
    text("HUMAN", (humanX-65), 162); //human button text

    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(robotX, robotY, diam, diam); //robot button

    fill(241, 245, 242);
    noStroke();
    text("ROBOT", (3*width/4-65), 162); //robot button text
    
    fill(13, 15, 14); //black question
    noStroke();
    text("DO YOU LIKE SANDWICHES, HUMAN?", width/6, 300); //question 2 appears if pressed

    fill(244, 131, 108); //coral button
    noStroke();
    ellipse(fYeahX, fYeahY, diam, diam); //fuck yeah button appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("FUCK", fYeahX-60, fYeahY); //fuck yeah text appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("YEAH!!", fYeahX-63, fYeahY+40); //fuck yeah text appears if pressed

    fill(244, 131, 108); //coral button
    noStroke();
    ellipse(mehX, mehY, diam, diam); //meh button appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("MEH...", mehX-60, mehY+20); //meh button text appears if pressed
}

void drawTwo(){ //draws robot answer and sad robot
    background(241, 245, 242); //white background

    fill(13, 15, 14); //black question
    text("ARE YOU A...", (width/2-120), 50);
    noStroke();
    
    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(humanX, humanY, diam, diam); //human button

    fill(241, 245, 242);
    text("HUMAN", (humanX-65), 162); //human button text

    fill(240, 81, 81);
    noStroke();
    ellipse(robotX, robotY, diam, diam);//robot button red if pressed

    fill(241, 245, 242);
    noStroke();
    text("ROBOT", (3*width/4-65), 162); //robot button text
    
    fill(13, 15, 14);
    noStroke();
    text("SORRY, ROBOTS DON'T EAT SANDWICHES.", width/4-100, 300); //sad robot text if pressed

    robot = loadImage("robot.png");
    image(robot, width/6, height/3+100, rImageW, rImageH);

    fill(244, 131, 108);
    text("CLICK ON THE ROBOT TO TRY AGAIN", width/4-75, 750);
}

void drawThree(){ //draws fuck yeah answer and handwriting question options
    background(241, 245, 242); //white background

    fill(13, 15, 14); //black question
    text("ARE YOU A...", (width/2-120), 50);
    noStroke();
    
    fill(240, 81, 81); //red button
    noStroke();
    ellipse(humanX, humanY, diam, diam); //human button red if pressed

    fill(241, 245, 242);
    text("HUMAN", (humanX-65), 162); //human button text

    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(robotX, robotY, diam, diam); //robot button

    fill(241, 245, 242);
    noStroke();
    text("ROBOT", (3*width/4-65), 162); //robot button text
    
    fill(13, 15, 14); //black question
    noStroke();
    text("DO YOU LIKE SANDWICHES, HUMAN?", width/6, 300); //question 2 appears if pressed

    fill(240, 81, 81);
    noStroke();
    ellipse(fYeahX, fYeahY, diam, diam); //fuck yeah button red if pressed

    fill(241, 245, 242);
    noStroke();
    text("FUCK", fYeahX-60, fYeahY); //fuck yeah text appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("YEAH!!", fYeahX-63, fYeahY+40); //fuck yeah text appears if pressed

    fill(244, 131, 108); //coral button
    noStroke();
    ellipse(mehX, mehY, diam, diam); //meh button appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("MEH...", mehX-60, mehY+20); //meh button text appears if pressed
    
    fill(13, 15, 14);
    noStroke();
    text("ARE YOU A RIGHTIE OR A LEFTIE?", width/6, 550); //rightie leftie question appears if pressed

    fill(244, 131, 108);
    noStroke();
    ellipse(rightieX, rightieY, diam, diam); //rightie button appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("RIGHTIE", rightieX-70, rightieY+20); //rightie text appears if pressed

    fill(244, 131, 108);
    noStroke();
    ellipse(leftieX, leftieY, diam, diam); //leftie button appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("LEFTIE", leftieX-60, leftieY+20);

    fill(244, 131, 108);
    noStroke();
    ellipse(bothX, bothY, diam, diam); //both circle appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("BOTH", bothX-60, bothY+20);
}

void drawFour(){ //draws meh answer and judgemental human
    background(241, 245, 242); //white background

    fill(13, 15, 14); //black question
    text("ARE YOU A...", (width/2-120), 50);
    noStroke();
    
    fill(240, 81, 81); //red button
    noStroke();
    ellipse(humanX, humanY, diam, diam); //human button red if pressed

    fill(241, 245, 242);
    text("HUMAN", (humanX-65), 162); //human button text

    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(robotX, robotY, diam, diam); //robot button

    fill(241, 245, 242);
    noStroke();
    text("ROBOT", (3*width/4-65), 162); //robot button text
    
    fill(13, 15, 14); //black question
    noStroke();
    text("DO YOU LIKE SANDWICHES, HUMAN?", width/6, 300); //question 2 appears if pressed

    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(fYeahX, fYeahY, diam, diam); //fuck yeah button appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("FUCK", fYeahX-60, fYeahY); //fuck yeah text appears if pressed

    fill(241, 245, 242);
    noStroke();
    text("YEAH!!", fYeahX-63, fYeahY+40); //fuck yeah text appears if pressed

    fill(240, 81, 81); //meh button turns red if pressed
    noStroke();
    ellipse(mehX, mehY, diam, diam); //meh button still there if pressed

    fill(241, 245, 242);
    noStroke();
    text("MEH...", mehX-60, mehY+20); //meh button text appears if pressed
    
    fill(244, 131, 108);
    noStroke();
    text("YOUR ANSWER IS UNACCEPTABLE.", width/6-100, 675); //unacceptable text if pressed

    fill(244, 131, 108);
    noStroke();
    text("CLICK ON THE HUMAN TO TRY AGAIN.", width/6-100, 725); // unacceptable text line two if pressed

    human = loadImage("human.png");
    image(human, 5*width/6-100, 560, hImageW, hImageH);  //human image if pressed
}

void drawFive(){ //draws grilled cheese
    background(72, 91, 89); //re-load background to clear page

    grilledcheese = loadImage("grilled_cheese.png");
    image(grilledcheese, width/2-150, height/2-150, gImageW, gImageH);

    fill(240, 81, 81);
    noStroke();
    text("OM NOM NOM!", 100, 150);

    fill(244, 131, 108);
    noStroke();
    text("CLICK ON THE SANDWICH TO TRY AGAIN!", width/4-200, 725); // try again text if pressed
}

void drawSix(){ //draws pbj
    background(72, 91, 89);

    pbj = loadImage("pbj.png");
    image(pbj, width/2-150, height/2-150, pImageW, pImageH);

    fill(240, 81, 81);
    noStroke();
    text("PEANUT BUTTAH JELLY TIME!", 100, 150);

    fill(244, 131, 108);
    noStroke();
    text("CLICK ON THE SANDWICH TO TRY AGAIN!", width/4-200, 725); // try again text if pressed
}

void drawSeven(){ //draws both sandwiches
   background(72, 91, 89);

   bothSandwiches = loadImage("both.png");
   image(bothSandwiches, 100, height/2-150, bImageW, bImageH);

   fill(240, 81, 81);
   noStroke();
   text("EAT ALL THE THINGS!", 100, 150);

   fill(244, 131, 108);
   noStroke();
   text("CLICK ON THE SANDWICHES TO TRY AGAIN!", width/4-200, 725); // try again text if pressed
}


