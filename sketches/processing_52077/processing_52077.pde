
float x_pos;
float y_pos;

float x_speed;
float y_speed;

float paddle_w;
float paddle_h;

float paddle_l_x;
float paddle_l_y;

float paddle_r_x;
float paddle_r_y;

//color change
float c1 = 0;      
float c2 = 255;
float c1dir = 0.3;  
float c2dir = -0.3; 

float c3 = 200;      
float c4 = 0;
float c3dir = 0.3;  
float c4dir = -0.3; 

float theta= 0.0;
// float[] randomCounts;

//PFont f; 

//; = computer will compute

void setup() {
  size(800, 600);
 // randomCounts = new float[100];
    
  x_pos=width/2;
  y_pos=height/2;
  x_speed=3;
  y_speed=3;

  paddle_w=30;
  paddle_h=130;

  paddle_l_x=30;
  paddle_l_y=200;

  paddle_r_x=width-30-paddle_w;
  paddle_r_y=200;
  
  //f = createFont("Arial",16,true);
  //font?
}

void draw() {
  background(255);
  
//  int index = int(random(randomCounts.length));
//  randomCounts[index] ++ ;
//  stroke(175);
//  fill(0);
// for (int x = 0; x < randomCounts.length; x ++ ) {
//    rect(x*10,0,9,randomCounts[x]);
// }
  
  x_pos+=x_speed;
  y_pos+=y_speed;

  if (x_pos>width) {
    x_speed*=- 2;
  }
  if (x_pos<0) {
    x_speed=2;
  }
  if (y_pos>height) {
    y_speed*=- 2;
  }
  if (y_pos<0) {
    y_speed=2;
  }
  //sets parameter for ball to stay on screen
  if (x_pos>paddle_l_x && x_pos<paddle_l_x+paddle_w && y_pos>paddle_l_y && y_pos<paddle_l_y+paddle_h) {
    x_speed=2;
  }
  if (x_pos>paddle_r_x && x_pos<paddle_r_x+paddle_w && y_pos>paddle_r_y && y_pos<paddle_r_y+paddle_h) {
    x_speed=-2;
   // textFont(f,16); 
   // text ( "HIT" ,10,100); 
  }
  //collision for left and right paddle*** 
  fill(c1,0,c2);
  rect(paddle_l_x, paddle_l_y, paddle_w, paddle_h);
  fill(c2,0,c1); 
  rect(paddle_r_x, paddle_r_y, paddle_w, paddle_h);
  ellipse(x_pos, y_pos, 40, 40);

  // Increment theta (try different values for " angular velocity " here)
  theta += 0.02;
  noStroke();
  fill(c3,0,c4);
  fill(c4,0,c3);
  float x = theta;
  
    for (int i = 0; i <= 300; i++) {
    // Calculate y value of sine function
    float y = sin(x)*height/2;
    //ellipse
    ellipse(i*10,y + height/2,30,30);
   // fill(255,0,0,127);
    x += 0.3;
  }
      for (int i = 0; i <= 300; i++) {
    // Calculate y value of sine function
    float y = cos(x)*height/2;
    //ellipse
    ellipse(i*10,y + height/2,40,40);
   fill(150,0,0,120);
    x += 0.3;
  }
  
  //ball
  c1 = c1 + c1dir;
  c2 = c2 + c2dir;
  if (c1 < 0 || c1 > 255) {
    c1dir *= -1;
  }

  if (c2 < 0 || c2 > 255) {
    c2dir *= -1;
  }
  
  c3 = c3 + c3dir;
  c4 = c4 + c4dir;
  if (c3 < 0 || c3 > 255) {
    c3dir *= -1;
  }

  if (c4 < 0 || c4 > 255) {
    c4dir *= -1;
  }
}

void keyPressed() {
  if (keyCode==38) {  //move up
    paddle_r_y-=15;
  }
  if (keyCode==40) { //move down
    paddle_r_y+=15;
    //computer understand to look for key press
  }
  if (keyCode==87) {  //move up, single quote means character(char)
    paddle_l_y-=15;
  }
  if (keyCode==83) { //move down
    paddle_l_y+=15;
  }
}

