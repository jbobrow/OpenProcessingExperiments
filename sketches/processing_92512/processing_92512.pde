
//Rafi Alam
//Creative Computing
//200 Objects

int num_of_stars = 200;
float[] starX = new float[num_of_stars];
float[] starY = new float[num_of_stars];
float[] starSpeed = new float[num_of_stars];

int num_of_shots = 15;
float[] shotX = new float[num_of_shots];
float[] shotY = new float[num_of_shots];
float[] elSpeed = new float[num_of_shots];

int num_of_astroids = 10;
float gravity = 0;
int currentPress = 0;
int starCount = 0;
float starSize = random (1, 4);

float astroidX =random(0, width);
float astroidY =-10;
float astroidSize =20;
float astroidSpeed =.02;

int arrayNo = 0;




//Earth
int earth_size = 5000;
float earthX = 0;
float earthY = 0;
float earthSpeed = 4;



//Game System
int game_start = 0;
int astroid_on=1;
int game_reset=1;
int player_lives=3;
int game_over=0;
int high_score=0;




//Points System

int player_score =0;
int astroid_value =10;


/* @pjs
 crisp=true;
 font=Computerfont.vlw;
 */
PFont font;
PFont font_name;
void setup () {
  size(350, 550);
  background(14);
  noStroke();
  font = loadFont ("Computerfont.vlw");
  textFont(font);

  //Earth
  earthX = width/2;
  earthY = height+2000;
}

void draw () {
  font_name=createFont("Computerfont.vlw", 200);
  background(14);


  if (game_start>0) {

    background(14);
    //Stars
    fill(255, 255, 255, random(150, 100));
    for (int i = 0; i < num_of_stars; i++) {
      ellipse(starX[i], starY[i], starSize, starSize);
      starY[i]-= starSpeed[i];
      starSpeed[i]+= gravity;
      starSize = random (1, 4);
    }

    starX[starCount] = random(0, width);
    starY[starCount] = -100;
    starSpeed[starCount]=-10;
    starCount++;

    if (starCount >num_of_stars-1) {
      starCount=0;
    }



    //Earth
    fill(0, 0, 255, 100);
    ellipse(earthX, earthY, earth_size+50, earth_size+50);
    fill(0, 0, 255);
    ellipse(earthX, earthY, earth_size, earth_size);
    fill(0, 70, 0);
    ellipse(earthX-500, earthY, earth_size-700, earth_size-400);

    earthY=earthY+earthSpeed;  



    //Shots
    fill(255, 255, 80, 175);
    for (int i = 0; i < num_of_shots; i++) {
      ellipse(shotX[i], shotY[i], 10, 10);
      shotY[i]+= elSpeed[i];
      elSpeed[i]+= gravity;
    }

    //Ship
    fill(255);
    beginShape();
    vertex(mouseX, mouseY-15);
    vertex(mouseX-15, mouseY+15);
    vertex(mouseX+15, mouseY+15);
    endShape(CLOSE);
    textSize(40);
    text(player_score, 100, 535);


    //Astroids
    if (astroid_on>0) {
      for (int i=0;i<num_of_astroids;i++) {
        //if Shot
        if (dist(astroidX, astroidY, shotX[i], shotY[i])<astroidSize) {
          fill(255, 255, 255, 170);
          rect(0, 0, width, height);
          fill(255, 0, 0);
          ellipse(astroidX, astroidY, astroidSize+20, astroidSize+20);
          astroidY=-10;
          astroidX=random(0, width);
          player_score=player_score+astroid_value;
          astroidSize+=.2;
          astroidSpeed+=.02;
//          println(astroidSpeed +" "+ player_score);
        } 
        else {
          fill(139, 131, 120);
          astroidY = astroidY+astroidSpeed;
          ellipse(astroidX, astroidY, astroidSize, astroidSize);

          //If Ship Crash
          if (dist(astroidX, astroidY, mouseX, mouseY)<astroidSize) {
            fill(255, 255, 255, 170);
            rect(0, 0, width, height);
            fill(255, 0, 0);
            ellipse(astroidX, astroidY, astroidSize+20, astroidSize+20);
            astroidY=-10;
            astroidX=random(0, width);
            //            player_score=player_score+astroid_value;
            //            astroid_value++;
            player_lives--;
            game_reset--;
            game_start=0;
          }

          //If astroid Pass
          if (astroidY>height) {
            fill(255, 255, 255, 170);
            rect(0, 0, width, height);
            fill(255, 0, 0);
            ellipse(astroidX, astroidY, astroidSize+20, astroidSize+20);
            astroidY=-10;
            astroidX=random(0, width);
            //            player_score=player_score+astroid_value;
            //            astroid_value++;
            player_lives--;
            game_reset--;
            game_start=0;
          }
        }
      }
    }
  }
  else {
    if (game_start<1) {
      background(255);


      fill(0);
      rect(0, height/2+100, width, 5);

      if (mouseY>height/2+100) {
        fill(0);
        textSize(20);
        text("PRESS SPACEBAR TO START", mouseX-80, mouseY+40);
        if (key ==' ') {
          game_start=1;
        }
      } 
      else {
        fill(255);
        strokeWeight(2);
        stroke(0);
      }
      beginShape();
      vertex(mouseX, mouseY-15);
      vertex(mouseX-15, mouseY+15);
      vertex(mouseX+15, mouseY+15);
      endShape(CLOSE);
      noStroke();
    }
  }
  
  
   //HUD_________________________________________

    //Lives
    if (player_lives>0) {
      fill(255);
      beginShape();
      vertex(20, 530-7);
      vertex(20-7, 530+7);
      vertex(20+7, 530+7);
      endShape(CLOSE);
    }
    else {
      game_over=1;
     
    }
    if (player_lives>1) {
      fill(255);
      beginShape();
      vertex(40, 530-7);
      vertex(40-7, 530+7);
      vertex(40+7, 530+7);
      endShape(CLOSE);
    }
    if (player_lives>2) {
      fill(255);
      beginShape();
      vertex(60, 530-7);
      vertex(60-7, 530+7);
      vertex(60+7, 530+7);
      endShape(CLOSE);
    }


    //HUD_________________________________________



if (game_over>0) {
  background(0);
      fill(255);
      textSize(50);
      game_start=1;
      text("GAMEOVER",35,300);
      astroid_value=0;
      high_score=player_score;
      textSize(25);
      text(high_score,35,330);
}

}


/*
void mousePressed () {
    shotX[currentPress] = mouseX;
    shotY[currentPress] = mouseY;
    elSpeed[currentPress]=-10;
    currentPress++;
    if (currentPress >num_of_shots-1) {
      currentPress=0;
    }
}
void mouseDragged () {
    shotX[currentPress] = mouseX;
    shotY[currentPress] = mouseY;
    elSpeed[currentPress]=-10;
    currentPress++;
    if (currentPress >num_of_shots-1) {
      currentPress=0;
    }
}
*/


void keyPressed () {
  if (key == ' ') {
    shotX[currentPress] = mouseX;
    shotY[currentPress] = mouseY;
    elSpeed[currentPress]=-10;
    currentPress++;
    if (currentPress >num_of_shots-1) {
      currentPress=0;
    }
  }
}

