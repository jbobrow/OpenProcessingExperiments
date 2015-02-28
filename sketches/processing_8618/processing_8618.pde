
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    
float xspeed = 2.2;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
float x1pos, y1pos;    // Starting position of shape    
int x1direction = 1;  // Left or Right
int y1direction = 1;  // Top to Bottom
float x2pos, y2pos;    // Starting position of shape    
int x2direction = 1;  // Left or Right
int y2direction = 1;  // Top to Bottom
float x3pos, y3pos;    // Starting position of shape    
int x3direction = 1;  // Left or Right
int y3direction = 1;  // Top to Bottom
float x4pos, y4pos;    // Starting position of shape    
int x4direction = 1;  // Left or Right
int y4direction = 1;  // Top to Bottom
float x5pos, y5pos;    // Starting position of shape    
int x5direction = 1;  // Left or Right
int y5direction = 1;  // Top to Bottom
float x6pos, y6pos;    // Starting position of shape    
int x6direction = 1;  // Left or Right
int y6direction = 1;  // Top to Bottom
float x7pos, y7pos;    // Starting position of shape    
int x7direction = 1;  // Left or Right
int y7direction = 1;  // Top to Bottom
float x8pos, y8pos;    // Starting position of shape    
int x8direction = 1;  // Left or Right
int y8direction = 1;  // Top to Bottom

void setup() {
  size(300,300);
  noStroke();
  frameRate(30);
  smooth();
  init_pos();
}

void draw() {
  background(0);
  stroke(0);
  
  draw_rect();
  ball1();
  ball2();
  ball3();
  ball4();
  ball5();
  ball6();
  ball7();
  ball8();
  ball9();
}

void init_pos(){
  // Set the starting position of shape
  xpos = 1;
  ypos = 0;

  x1pos = 120;
  y1pos = 20;

  x2pos = 250;
  y2pos = 0;

  x3pos = 20;
  y3pos = 120;

  x4pos = 110;
  y4pos = 110;

  x5pos = 220;
  y5pos = 110;

  x6pos = 0;
  y6pos = 200;

  x7pos = 120;
  y7pos = 220;

  x8pos = 200;
  y8pos = 200;
}

void draw_rect(){
    //Top left square
    fill(0);
    rect(0,0,width/3-1,height/3-1);

    //Top middle square
    fill(255);
    rect(width/3,0,width/3-1,height/3-1);

    //Top right square
    fill(0);
    rect(width-(width/3)-2,0,width/3,height/3-1);

    //2nd left square
    fill(255);
    rect(0,height/3,width/3-1,height/3-1);

    //2nd middle square
    fill(0);
    rect(width/3,height/3,width/3-1,height/3-1);

    //2nd right square
    fill(255);
    rect(width-(width/3)-1,height/3,width/3,height/3);

    //3rd left square
    fill(0);
    rect(0,(height-height/3-2),width/3-1,height/3-1);

    //3rd middle square
    fill(255);
    rect(width/3,(height-height/3-1),width/3-1,height/3);

    //3rd right square
    fill(0);
    rect(width-(width/3)-2,(height-height/3-2),width/3-1,height/3-1);
}

void ball1(){
  //1 Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width/6 || xpos < 0) {
    xdirection *= -1;
  }
      if (ypos > height/6 || ypos < 0) {
           ydirection *= -1;
       }
  // Draw the shape
  fill(255);
  ellipse(xpos+size/2, ypos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball2(){
  //2 Update the position of the shape
  x1pos = x1pos - ( xspeed * x1direction );
  y1pos = y1pos + ( yspeed * y1direction );
  
  if (x1pos > width/3 || x1pos < 2*width/3) {
    x1direction *= -1;
  }
      if (y1pos > height/6 || y1pos < height/3) {
           y1direction *= -1;
       }
  // Draw the shape
  fill(0);
  ellipse(x1pos+size/2, y1pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball3(){
  //3 Update the position of the shape
  x2pos = x2pos - ( xspeed * x2direction );
  y2pos = y2pos + ( yspeed * y2direction );
  
  if (x2pos < 190 || x2pos > 250) {
    x2direction *= -1;
  }
        if (y2pos < 0 || y2pos > 50) {
           y2direction *= -1;
       }
  // Draw the shape
  fill(255);
  ellipse(x2pos+size/2, y2pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball4(){
  //4 Update the position of the shape
  x3pos = x3pos - ( xspeed * x3direction );
  y3pos = y3pos + ( yspeed * y3direction );
  
  if (x3pos > width/6 || x3pos < width/6) {
    x3direction *= -1;
  }
        if (y3pos > 2*height/3-size || y3pos <  2*height/3-size) {
           y3direction *= -1;
       }
  // Draw the shape
  fill(0);
  ellipse(x3pos+size/2, y3pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball5(){
  //5 Update the position of the shape
  x4pos = x4pos - ( xspeed * x4direction );
  y4pos = y4pos + ( yspeed * y4direction );
  
  if (x4pos < width/3-size/4 || x4pos > 2*width/3-1-size) {
    x4direction *= -1;
  }
        if (y4pos > 2*height/3-1-size || y4pos < height/3-size/6) {
           y4direction *= -1;
       }
  // Draw the shape
  fill(255);
  ellipse(x4pos+size/2, y4pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball6(){
  //6 Update the position of the shape
  x5pos = x5pos - ( xspeed * x5direction );
  y5pos = y5pos + ( yspeed * y5direction );
  
  if (x5pos < width-1-size || x5pos > width-1-size) {
    x5direction *= -1;
  }
        if (y5pos > height/3 || y5pos < height/3) {
           y5direction *= -1;
       }
  // Draw the shape
  fill(0);
  ellipse(x5pos+size/2, y5pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball7(){
  //7 Update the position of the shape
  x6pos = x6pos - ( xspeed * x6direction );
  y6pos = y6pos + ( yspeed * y6direction );
  
  if (x6pos > width/6 || x6pos < 0) {
    x6direction *= -1;
  }
        if (y6pos > height-size || y6pos < 2*height/3-1-size/6) {
           y6direction *= -1;
       }
  // Draw the shape
  fill(255);
  ellipse(x6pos+size/2, y6pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball8(){
  //8 Update the position of the shape
  x7pos = x7pos - ( xspeed * x7direction );
  y7pos = y7pos + ( yspeed * y7direction );
  
  if (x7pos > width/6 || x7pos < width/3) {
    x7direction *= -1;
  }
      if (y7pos < height || y7pos > 2*height/3) {
           y7direction *= -1;
       }
  // Draw the shape
  fill(0);
  ellipse(x7pos+size/2, y7pos+size/2, size/2, size/2);
  //ball bouncing end
}

void ball9(){
  //9 Update the position of the shape
  x8pos = x8pos - ( xspeed * x8direction );
  y8pos = y8pos + ( yspeed * y8direction );
  
  if (x8pos > width-1-size || x8pos < 2*width/3) {
    x8direction *= -1;
  }
      if (y8pos > height-size || y8pos < 2*height/3) {
           y8direction *= -1;
       }
  // Draw the shape
  fill(255);
  ellipse(x8pos+size/2, y8pos+size/2, size/2, size/2);
  //ball bouncing end
}


