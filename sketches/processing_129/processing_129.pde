

//basketball location
float ballx;
float bally;

//speed of ball
float speedx;
float speedy;


float rainbowx;
float rainbowy;
float rainboww;
float rainbowh;

float rimx;
float rimy;

float angleA=PI/12.0;

float spd=10;
float gravity = 1;

void setup(){
  size(640, 480);


  rimx =485;
  rimy =192;

  ballx=100;
  bally=350;

  speedx=1;
  speedy=1;
}


void draw(){
  background(0);

  smooth();
  //court
  fill(204, 102, 0);
  quad(0, 480, 50, 400, 450, 400, 640, 480);


  ////THE HOOP COMPONENETS
  //pipe
  fill(255);
  stroke(204, 0, 0);
  strokeWeight(2);
  rect(510, 100, 10, 340);

  //backboard
  fill(255);
  stroke(204, 0, 0);
  strokeWeight(3);
  quad(550, 230, 480, 200, 480, 100, 550, 130);

  //rim latch
  fill(204, 0, 0);
  stroke(204, 0, 0);

  quad(530, 200, 500, 190, 500, 175, 530, 185);

  //rim
  noFill();
  stroke(204, 0, 0);
  strokeWeight (4);
  ellipse (rimx, rimy, 100, 10);

  stroke(0, 0, 255);
  fill(0, 0, 255);
  ellipse(ballx, bally, 30, 30);


  if (mousePressed == false){

    bally = bally + speedy;
    speedy = speedy + gravity;


    if (bally > 400){
      speedy = speedy * - 0.9;
    }
    if (bally < 350){
      // bally=350;

      speedy = speedy * 0.9; 
    }

  }
  else{

    bally = bally - (spd*5);      // slowly decreases speed as it moves up the arc
      spd = spd - 1; 
     
   
    ballx=ballx+22.5;     //how big the arc         

    if (ballx > 500){             
      spd = 0;
      ballx=ballx-22.5;
      bally = bally + 15;
    }


    if (bally>400){             
      mousePressed=false;     
      ballx = 100;         
      bally = 375;
      spd=10;       
    }

  }

}



