
//declaration of variables to be used
boolean shot=false;
boolean alive=true;
int shotPosX=0;
int shotPosY=0;
float ball1X = random(0,width-20);
float ball1Y = -20;
float ball2X = random(0,width-20);
float ball2Y = -30;
float ball3X = random(0,width-20);
float ball3Y = -50;
float ballspd = 1;
int score = 0;
int hiscore = 0;
boolean c = true;

//starfield x,y values
float s1x = 50;
float s1y = 0;
float s2x = 200;
float s2y = -10;
float s3x = 100;
float s3y = -20;
float s4x = 400;
float s4y = -5;
float s5x = 150;
float s5y = -30;


//initial setup of screen size and anti-aliasing
void setup(){
  size(400,600);
  //drawing using corners of the bounding box of ellipses
  ellipseMode(CORNERS);
  smooth();
}

//time to animate!
void draw(){
  //framerate, bigger number for faster, smaller for slower
  frameRate(60);
  //redrawing the black space background
  noStroke();
  //opacity affected to give risidual trail
  fill(0,24);
  rectMode(CORNER);
  rect(0,0,width,height);
  
  
  
  //creating the starfield
  //each star is white and travels at different speeds
  stroke(255);
  strokeWeight(1);
  //when they reach the bottom, they respawn at the top in a random position
  if(s1y < height){
    point(s1x,s1y);
    s1y++;
  }else{
    s1x=random(0,width);
    s1y=0;
  }
  if(s2y < height){
    point(s2x,s2y);
    s2y+=3;
  }else{
    s2x=random(0,width);
    s2y=0;
  }
  if(s3y < height){
    point(s3x,s3y);
    s3y+=4;
  }else{
    s3x=random(0,width);
    s3y=0;
  }
  if(s4y < height){
    point(s4x,s4y);
    s4y++;
  }else{
    s4x=random(0,width);
    s4y=-10;
  }
  if(s5y < height){
    point(s5x,s5y);
    s5y+=2;
  }else{
    s5x=random(0,width);
    s5y=0;
  }

  
  
  
  
  
  //if the player is alive, draw the spaceship
  if(alive==true){
    //Drawing the Spaceship
    fill(255,255,0);
    noStroke();
    rectMode(CENTER);
    //body
    rect(mouseX,mouseY, 10, 20);
    //fins
    triangle(mouseX,mouseY+3,mouseX+10,mouseY+10,mouseX-10,mouseY+10);
  
    //Drawing the lazer shot if clicked
    if(shot==true){
      strokeWeight(1);
      stroke(0,255,0);
      line(shotPosX,shotPosY,shotPosX,shotPosY-10);
      shotPosY-=10;
      if(shotPosY<-5){
        shot=false;
      }
    }
    
    //collision check with asteroid 1 (basically if mouseX and mouseY fall in bounding box of asteroid
    if(mouseX > ball1X){
      if(mouseY > ball1Y){
        if(mouseX < ball1X+20){
          if(mouseY < ball1Y+20){
            alive=false;
            //draw an explosion when it hits
            fill(255,255,0);
            stroke(255,0,0);
            strokeWeight(10);
            ellipseMode(CENTER);
            ellipse(pmouseX,pmouseY,40,40);
            ellipseMode(CORNERS);
            noStroke();
            //display end message and score
            println("You are dead!");
            println("Asteroids shot: " + score +".");
            if(score>hiscore){
              hiscore = score;
              println("New Highscore!");
            }else{
              println("Highscore: " + hiscore);
            }
          }
        }
      }
    }
    //collision check with asteroid 2
    if(mouseX > ball2X){
      if(mouseY > ball2Y){
        if(mouseX < ball2X+20){
          if(mouseY < ball2Y+20){
            alive=false;
            println("You are dead!");
            //display end message and score
            println("Asteroids shot: " + score +".");
            if(score>hiscore){
              hiscore = score;
              println("New Highscore!");
            }else{
              println("Highscore: " + hiscore);
            }
          }
        }
      }
    }
    //collision check with asteroid 3
    if(mouseX > ball3X){
      if(mouseY > ball3Y){
        if(mouseX < ball3X+20){
          if(mouseY < ball3Y+20){
            alive=false;
            println("You are dead!");
            //display end message and score
            println("Asteroids shot: " + score +".");
            if(score>hiscore){
              hiscore = score;
              println("New Highscore!");
            }else{
              println("Highscore: " + hiscore);
            }
          }
        }
      }
    }
  }
  
  
  
  //Drawing asteroids
  //asteroid 1
  fill(100,0,0);
  noStroke();
  if(ball1Y < height){
    ellipse(ball1X, ball1Y, ball1X+20, ball1Y+20);
    ball1Y+=ballspd;
  }else{
    ball1X=random(0,width-20);
    ball1Y=-20;
  }
  //add another asteroid when doing well
  if(score>10){
    //asteroid 2
    fill(150,0,0);
    noStroke();
    if(ball2Y < height){
      ellipse(ball2X, ball2Y, ball2X+20, ball2Y+20);
      ball2Y+=ballspd+3;
    }else{
      ball2X=random(0,width-20);
      ball2Y=-20;
    }
  }
  //add third asteroid when doing well
  if(score>20){
    //asteroid 3
    fill(150,50,50);
    noStroke();
    if(ball3Y < height){
      ellipse(ball3X, ball3Y, ball3X+20, ball3Y+20);
      ball3Y+=ballspd+5;
    }else{
      ball3X=random(0,width-20);
      ball3Y=-20;
    }
  }
  //speed increases as score goes up
  if(score>30){
    ballspd=4;
    if(score>35){
      ballspd=5;
      if(score>40){
        ballspd=6;
      }
    }
  }
  
  
  
  
  //detecting collision of lazer and asteroid
  if(shotPosX > ball1X){
    if(shotPosY > ball1Y){
      if(shotPosX < ball1X+20){
        if(shotPosY < ball1Y+20){
          //draw an explosion when it hits
          fill(255,0,0);
          stroke(255,255,0);
          strokeWeight(10);
          ellipse(ball1X,ball1Y,ball1X+20,ball1Y+20);
          //reset the location of asteroid
          ball1X=random(0,width-20);
          ball1Y=-20;
          //increase the score
          score++;
        }
      }
    }
  }
  if(shotPosX > ball2X){
    if(shotPosY > ball2Y){
      if(shotPosX < ball2X+20){
        if(shotPosY < ball2Y+20){
          //draw an explosion when it hits
          fill(255,0,0);
          stroke(255,255,0);
          strokeWeight(10);
          ellipse(ball2X,ball2Y,ball2X+20,ball2Y+20);
          //reset the location of asteroid
          ball2X=random(0,width-20);
          ball2Y=-20;
          //increase the score
          score++;
        }
      }
    }
    if(shotPosX > ball3X){
      if(shotPosY > ball3Y){
        if(shotPosX < ball3X+20){
          if(shotPosY < ball3Y+20){
            //draw an explosion when it hits
            fill(255,0,0);
            stroke(255,255,0);
            strokeWeight(10);
            ellipse(ball3X,ball3Y,ball3X+20,ball3Y+20);
            //reset the location of asteroid
            ball3X=random(0,width-20);
            ball3Y=-20;
            //increase the score
            score++;
          }
        }
      }
    }
  }
}


//for shooting
void mousePressed(){
  //while the player is still alive
  if(alive==true){
    //and if there are no shots on ths creen
    if(shot==false){
      //sets the initial position of the lazer
      shot=true;
      shotPosY=mouseY+10;
      shotPosX=mouseX;
    }
  }
}



//for resetting life
void keyPressed(){
  //pressing space will reset the game
  if(key==' '){
    alive = true;
    score = 0;
    shot = false;
    ball1X = random(0,width-20);
    ball1Y = -20;
    ball2X = random(0,width-20);
    ball2Y = -30;
    ball3X = random(0,width-20);
    ball3Y = -50;
    ballspd = 1;
    println("Reset!");
  }
  //pressing c will make the mouse cursor disappear
  if(key=='c'){
    if(c==false){
      cursor();
      c=true;
    }else{
      noCursor();
      c=false;
    }
  }
}
