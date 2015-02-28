
int SCREEN_WIDTH = 900;
int SCREEN_HEIGHT = 600;
float ball_Ax, ball_Ay; //x & y of the ball
float ball_Ax_vel, ball_Ay_vel; //velocity of the ball
float radius = 12.5; //radius of the ball
int basketx, baskety; //this is for the paddle that makes the ball bounce 
int startCurl; //this is for the curly lines 
color fillColors = color (255,239,207); //this is for the color of the sand
boolean lost= false;  //the player is either playing or losing

void setup() {                                       //the first thing that wll be running 
  size (SCREEN_WIDTH, SCREEN_HEIGHT);
  smooth();

  //initial velocity
  ball_Ax_vel =5;
  ball_Ay_vel = 3;
  // initial position
  ball_Ax =0;
  ball_Ay = 100;
  basketx = SCREEN_WIDTH/2-100;
  baskety = SCREEN_HEIGHT - 50;
}

void draw() {
  float i=0; //local variable used for background strokes 
  float rColor = 255 , gColor = 154, bColor= 51;  //local variable used for strokes colors
  
  if (lost == false) {
    background(255, 239, 207); //cleans up the marks as the ball moves

    // ocean
    fill(164, 218, 210);
    rect(0,400,1200,250);

    // curly lines 
    noFill();
    stroke(218, 242, 237);
    strokeWeight(2); 
    startCurl = startCurl + 1; //defines the rate, larger number increases speed but it has to be less than 8

    if (startCurl > 0) {
      startCurl = -8;  
    } 
    for (int curlX = startCurl + 300; curlX < 900; curlX += 20) {
      int curlY = 425;
      bezier(curlX+10,curlY,curlX+10,curlY+15,curlX+20,curlY+10,curlX+20,curlY);
      bezier(curlX+20,curlY,curlX+20,curlY+10,curlX+30,curlY+10, curlX+30, curlY);
    }

    if (startCurl > 0) {
    } 
    for (int curlX = startCurl+20; curlX < 700; curlX += 20) {
      int curlY = 450;
      bezier(curlX+10,curlY,curlX+10,curlY+15,curlX+20,curlY+10, curlX+20, curlY);
      bezier(curlX+20,curlY,curlX+20,curlY+10,curlX+30,curlY+10, curlX+30, curlY);
    }

    if (startCurl > 0) {
    } 
    for (int curlX = startCurl + 500; curlX < 1180; curlX += 20) {
      int curlY = 470;
      bezier(curlX+10,curlY,curlX+10,curlY+15,curlX+20,curlY+10, curlX+20, curlY);
      bezier(curlX+20,curlY,curlX+20,curlY+10,curlX+30,curlY+10, curlX+30, curlY);
    }
    noStroke();

    //sparkley beach 
    fill (133,83,43);
    rect (0, 490, 1200, 60); 
    stroke (fillColors); 
    strokeWeight(1); 
    for (int b=0; b<300; b++) {
      point (random(SCREEN_WIDTH), random(490, 550));
    }
    noStroke(); 

    //green field 
    //fill(29, 183, 141);
    fill(115, 215, 185);
    rect(0,SCREEN_HEIGHT-50,SCREEN_WIDTH,50);
      
    //background strokes
    stroke (rColor,gColor/10,bColor/2);
    strokeWeight (1);  
    while(i<1200) {
      line(i, 0, i, 400);
      i = i + 6;

      rColor += ball_Ax/4;  //1200 / 255
      if (rColor > 255)
        rColor = 0; 

      gColor += ball_Ax/4;
      if (gColor >255)
        gColor = 0;
      stroke (rColor, gColor, bColor);
    }
    noStroke ();

    //polygon, shape, vertex, shadow 
    fill(243, 123, 125, 90); //opacity.
    beginShape();
    vertex(1400,380);
    vertex(1400, 401);
    //    vertex(basketx+100, baskety);
    vertex(-200,401);
    vertex(-200, 380);
    vertex(ball_Ax, ball_Ay);
    //    vertex(ball_Ax, 0);
    endShape();

    //basket, paddle 
    fill (255, 56, 45);
    if (keyPressed){
    if ((key == '2') && (basketx < SCREEN_WIDTH-200)) {      //-200 makes it stop right by the right boarder
      basketx = basketx + 10;
    }
    else if ((key == '1') && (basketx > 0)) {                //>0 makes it stope right by the left boarder
      basketx = basketx - 10;                                              // 10 pixels at a time 
    }    
    }
    rect(basketx, baskety, 200, 10);

    //ball
    fill(148,0,100);
    ellipse(ball_Ax, ball_Ay, 25, 25); 

    //accumulating velocity 
    ball_Ax+= ball_Ax_vel;
    ball_Ay+= ball_Ay_vel;

    //ball hits the basket and bounces back. 3 conditions need to be true: 
    if (((ball_Ay +radius) >= baskety) && ( basketx <=  ball_Ax  ) && ( ball_Ax  <= basketx+200)) { 
      ball_Ay_vel *= -1;
    } 

    if (ball_Ay > SCREEN_HEIGHT) {
      //      println("lost");
      lost = true;
    }

    //ball hits the right border
    if (ball_Ax  > SCREEN_WIDTH) {
      ball_Ax_vel *= -1;
      ball_Ax = (SCREEN_WIDTH);
    }

    //ball hits the top and left borders
    if (ball_Ax < 0) {
      ball_Ax_vel *= -1;
    }

    if (ball_Ay < 0) {
      ball_Ay_vel *= -1;
    }
  }

  else {
    smooth();
    fill(72, 91, 113); 
    rect(0, 0, 1200, 405); 
    fill(255, 222, 79); 
    ellipse(600,100,300,300);
    fill(165, 110, 133); 
    textSize(22);
    textAlign(CENTER);
    text("Ooooops...", 600,110); 
    textSize(48);
    textAlign(CENTER);
    text("Try Again!", 600, 160); 
    if (keyPressed) {
      lost = false;

      ball_Ax = random(0, 1200);
      ball_Ay = 0;
    }
  }
}

