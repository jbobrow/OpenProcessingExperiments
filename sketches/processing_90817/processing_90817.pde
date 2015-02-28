
//Rafi Alam
//Creative Computing
//Homework 4

//BREACH!

int intro=1;

int game_start=0;
int playzone_width=200;
int playzone_height=200;
int safe_zone=playzone_width/2;
float pointX=400;
float pointY=300;
float pointX_speed=1;
float pointY_speed=1;
int point1=0;
int player_score=0;
int point_value=0;
int point_value_speed=1;
int game_reset=1;
int high_score=0;
int player_lives=3;
int game_over=0;

//random
float XpdMin=-5;
float XpdMax=5;
float YpdMin=-5;
float YpdMax=5;
float point_dirX=random(XpdMin, XpdMax);
float point_dirY=random(YpdMin, YpdMax);
PFont font;

int help;


/* @pjs
crisp=true;
font=Computerfont.ttf;
*/
PFont font_name;
void setup () {
  size(800, 600);
  smooth();
  font = loadFont("Computerfont.ttf");
  textFont(font);
}

void draw () {
  font_name=createFont("Computerfont.ttf",200);
  background(0);


  //fake points
  fill(255);
  ellipse(random(400, 480), random(300, 380), 10, 10);
  ellipse(random(400, 480), random(300, 380), 10, 10);
  ellipse(random(320, 400), random(220, 300), 10, 10);
  ellipse(random(320, 400), random(220, 300), 10, 10);
  ellipse(random(400, 480), random(220, 300), 10, 10);
  ellipse(random(400, 480), random(220, 300), 10, 10);
  ellipse(random(320, 400), random(300, 380), 10, 10);
  ellipse(random(320, 400), random(300, 380), 10, 10);

  //Escapee
  pointX=pointX+pointX_speed+point_dirX;
  pointY=pointY+pointY_speed+point_dirY;
  point_dirX=random(XpdMin, XpdMax);
  point_dirY=random(YpdMin, YpdMax);

  //if mouse on side of screen move towards opposite
  if (mouseX>width/2) {
    XpdMin=-10;
    XpdMax=5;
  }
  if (mouseX<width/2) {
    XpdMin=-5;
    XpdMax=10;
  }
  if (mouseY>height/2) {
    YpdMin=-10;
    YpdMax=5;
  }
  if (mouseY<height/2) {
    YpdMin=-5;
    YpdMax=10;
  }


  if (game_start>0) {
    point_value=point_value+point_value_speed;
    if (point1>0) {
      noStroke();
      if (dist(pointX, pointY, width/2, height/2)>safe_zone) {
        fill(0, 255, 0);
      }
      else {
        fill(255);
      }
      ellipse(pointX, pointY, 10, 10);

      if (pointY>560) {
        //gameover
        game_reset=0;
        player_lives--;
        println("dead");
        println(game_reset);
      }
      if (pointY<40) {
        //gameover
        game_reset=0;
        player_lives--;
        println("dead");
        println(game_reset);
      }
      if (pointX>width) {
        //gameover
        game_reset=0;
        player_lives--;
        println("dead");
        println(game_reset);
      }
      if (pointX<0) {
        //gameover
        game_reset=0;
        player_lives--;
        println("dead");
        println(game_reset);
      }


      //safezone
      if (dist(mouseX, mouseY, width/2, height/2)>safe_zone) {

        //if eats
        if (dist(mouseX, mouseY, pointX, pointY)<30) {
          //add points, speed up next, reset value

          player_score=player_score+point_value;
          point1=point1--;
          pointX=width/2;
          pointY=height/2;
          pointX_speed=pointX_speed++;
          pointY_speed=pointY_speed++;
          point1=point1++;
          point_value=0;
        }
      }
    } 
    else {
    }
  }


  //HUD
  //Borders
  fill(0);
  rect(0, 0, width, 40);
  rect(0, 560, width, 40);
  fill(255);
  rect(0, 40, width, 2);
  rect(0, 560, width, 2);

  //Safezone cover
  strokeWeight(20);
  stroke(0);
  fill(0, 0, 0, 175);
  ellipse(width/2, height/2, 210, 210);
  noStroke();

  //Player
  noStroke();
  if (dist(mouseX, mouseY, width/2, height/2)<playzone_width/2) {
    fill(255);
  } 
  else {
    fill(255, 0, 0);
  }
  ellipse(mouseX, mouseY, 50, 50);


  //Safezone outline
  fill(0, 0, 0, 0);
  strokeWeight(10);
  stroke(255);
  ellipse(width/2, height/2, playzone_width+10, playzone_height+10);




  //Lives
  noStroke();
  //Life 1
  if (player_lives>0) {
    fill(255, 0, 0);
    ellipse(40, 580, 30, 30);
  }
  //Life 2
  if (player_lives>1) {
    ellipse(75, 580, 30, 30);
  }
  //Life 3
  if (player_lives>2) {
    ellipse(110, 580, 30, 30);
  } 



  //SCORE
  fill(255);
  textSize(20);
  text(player_score, 10, 20);
  text(high_score, 700, 20);
  textSize(14);
  text("HIGH SCORE", 700, 35);
  text("PLAYER 1", 10, 35);
  //println(player_lives +" " +player_score +" High" +high_score+ "speed" +pointX_speed);



  //check if game started
  if ((game_start)<1) {
    fill(0, 0, 0, 200);
    rect(0, 0, width, height);
    if (dist(mouseX, mouseY, width/2, height/2)<150) {

      fill(255);
      ellipse(width/2, height/2, 220, 220);
      fill(255, 0, 0);
      textSize(100);
      text("Go!", 335, 325);
      if (mousePressed) {
        pointX=width/2;
        pointY=height/2;
        game_start=game_start+1;
        game_over=0;
        point1=1;
      }
      if (game_over>0) {
        fill(255);
        textSize(150);
        text("GAME OVER", 25, 140);
      }
    } 
    else {

      fill(255, 0, 0);
      ellipse(width/2, height/2, 220, 220);
      fill(255);
      textSize(100);
      text("Go!", 335, 325);
      if (game_over>0) {
        fill(255);
        textSize(150);
        text("GAME OVER", 25, 140);
      }
    }
  }

  //Reset
  if (game_reset<1) {
    point1=1;
    if (player_score>high_score) {
      high_score=player_score;
    }
    if (player_lives<1) {
      player_score=0;
      player_lives=3;
      game_over=1;
    }
    point_value=0;
    pointX=width/2;
    pointY=height/2;
    pointX_speed=1;
    pointY_speed=2;
    game_start=0;
    game_reset=1;
  }



  //Title


  if (intro>0) {
    game_start=1;
    fill(255, 0, 0);
    background(0);
    textSize(80);
    text("BREACH!", 400, 300);
    //Buttons
    textSize(20);
    
    
    //Play
    if (dist(mouseX, mouseY, 600, 340)<25) {
      fill(255, 0, 0);
      ellipse(600, 340, 50, 50);
      fill(0);
      text("PLAY", 580, 345);
      if (mousePressed) {
        intro=0;
        game_reset=0;
      }
    } 
    else {
      fill(255);
      ellipse(600, 340, 50, 50);
      fill(0);
      text("PLAY", 580, 345);
    }


    //Help
    if (dist(mouseX, mouseY, 660, 340)<25) {
      fill(255, 0, 0);
      ellipse(660, 340, 50, 50);
      fill(0);
      text("HELP", 640, 345);
      if (mousePressed) {
        help=1;
      }
    } 
    else {
      fill(255);
      ellipse(660, 340, 50, 50);
      fill(0);
      text("HELP", 640, 345);
    }

    //Help Screen
    if (help>0) {
      stroke(255);
      strokeWeight(10);
      fill(0, 0, 0, 250);
      rect(50, 50, width-100, height-100);
      fill(255);
      textSize(40);
      text("WELCOME TO THE WORLD OF BREACH!", 70, 90);
      textSize(30);
      text("How long can you contain the deadly Cooties Virus", 70, 130);
      text("from destroying the world?", 70, 160);
      text("Gain Points by collecting the loose Cooties.", 70, 210);
      text("The longer the Cooties breathe fresh air,", 70, 260);
      text("the more the points.", 70, 290);

      noStroke();
      fill(255, 0, 0);
      ellipse(97, 340, 50, 50);
      fill(255);
      text("REGINALD", 132, 345);
      fill(0, 255, 0);
      ellipse(497, 340, 10, 10);
      fill(255);
      text("COOTIES", 522, 345);

      //Close
      if (dist(mouseX, mouseY, width/2, 460)<50) {
        fill(255, 0, 0);
        ellipse(width/2, 460, 100, 100);
        fill(255);
        textSize(35);
        text("CLOSE", 355, 470);
        if (mousePressed) {
          help=0;
        }
      } 
      else {
        fill(255);
        ellipse(width/2, 460, 100, 100);
        fill(0);
        textSize(35);
        text("CLOSE", 355, 470);
      }
    }
  }
}



