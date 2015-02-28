
float x, y, spdX, spdY;
void setup() {
  size(600, 500);
  rectMode(CENTER);

  x = 100;
  y = 100;
  spdX = 0.1;
  spdY = 0.1;
  
  
}

void draw() {
  background(0, 40, 100);
  
  
  fill(205, 210, 210);
  triangle(25, 25, 55, 40, 215, 40);

  fill(70, 140, 190);
  triangle(70, 90, 100, 30, 315, 200);
  
  
  fill(20, 60, 150);
  triangle(250, 350, 500, 370, 400, 440);
  
  fill(90, 190, 235);
  triangle(550, 250, 570, 340, 500, 290);
  
  fill(15, 20, 25);
  triangle(450, 250, 430, 290, 400, 255);
  
  fill(50, 130, 200);
  triangle(350, 250, 350, 270, 220, 150);
  
  fill(15, 15, 13);
  triangle(250, 250, 30, 90, 75, 100);
  
  fill(0, 75, 135);
  triangle(350, 250, 335, 340, 300, 310);
  
  fill(20, 50, 150);
  triangle(550, 150, 400, 70, 425, 20);
  
  fill(10, 20, 100);
  triangle(45, 300, 150, 210, 160, 400);
  
  fill(220, 220, 220);
  triangle(22, 465, 160, 400, 195, 350);
  
  fill(70, 140, 190);
  triangle(550, 450, 495, 400, 545, 420);
  
  fill(70, 155, 195);
  triangle(350, 150, 545, 200, 480, 100);
  
  fill(40, 90, 145);
  triangle(260, 270, 280, 400, 220, 215);
  
  
  fill(255); 
  
    float bx = 100;
    float by = 300;
    float bw = 50;
    float bh = 10;
    
    rect(bx, by, bw, bh);
 
    float bx2 = 150;
    float by2 = 350;
    float bw2 = 50;
    float bh2 = 10;
    
    rect(bx2, by2, bw2, bh2);
    
    float bx3 = 200;
    float by3 = 400;
    float bw3 = 50;
    float bh3 = 10;
    
    rect(bx3, by3, bw3, bh3);
    
    float bx4 = 275;
    float by4 = 450;
    float bw4 = 100;
    float bh4 = 10;
    
    rect(bx4, by4, bw4, bh4);
    
    float bx5 = 350;
    float by5 = 400;
    float bw5 = 50;
    float bh5 = 10;
    
    rect(bx5, by5, bw5, bh5);
    
    float bx6 = 425;
    float by6 = 350;
    float bw6 = 100;
    float bh6 = 10;
    
    rect(bx6, by6, bw6, bh6);
    
    float bx7 = 500;
    float by7 = 300;
    float bw7 = 50;
    float bh7 = 10;
    
    rect(bx7, by7, bw7, bh7);
    
    float bx8 = 550;
    float by8 = 250;
    float bw8 = 50;
    float bh8 = 10;
    
    rect(bx8, by8, bw8, bh8);
 
  
  pushMatrix();
  translate(x, y);
  rotate(radians(frameCount));
  fill(120, 150, 190);
  //rect(0, 0, 50, 50);
  ellipse(0, 0, 50, 50);
  ellipse(20, 20, 25, 25);
  ellipse(-20, -20, 25, 25);
  popMatrix();
  
  spdY = spdY + .2;
  //spdY = spdY + .5;
 // spdY = spdY + .1
  
  x = x + spdX;
  y = y + spdY;
  
  spdX += .005;
  //spdX += .001;
  //spdX += .0075;
  
  if (x > width - 15) {
    x = width - 15;
    spdX = spdX * -1;
  }
    
  
  if (y > height - 15) {
    y = height - 15;
     spdY = spdY * -1; 
  }
  
  if ( x >= bx - 30 && x <= bx+bw - 30 && y > by - 30) {
    y = by - 25;
    spdY = spdY * -1;
  }
  
  if ( x >= bx2 - 30 && x <= bx2+bw2 - 30 && y > by2 - 30) {
    y = by2 - 25;
    spdY = spdY * -1;
  }
  
  if ( x >= bx3 - 30 && x <= bx3+bw3 - 30 && y > by3 - 30) {
    y = by3 - 25;
    spdY = spdY * -1;
  }
  
   if ( x >= bx4 - 30 && x <= bx4+bw4 - 30 && y > by4 - 30) {
    y = by4 - 25;
    spdY = spdY * -1;
  }
  
  if ( x >= bx5 - 30 && x <= bx5+bw5 - 30 && y > by5 - 30) {
    y = by5 - 25;
    spdY = spdY * -1;
  }
  
  if ( x >= bx6 - 30 && x <= bx6+bw6 - 30 && y > by6 - 30) {
    y = by6 - 25;
    spdY = spdY * -1;
  }
  
  if ( x >= bx7 - 30 && x <= bx7+bw7 - 30 && y > by7 - 30) {
    y = by7 - 25;
    spdY = spdY * -1;
  }
  
   if ( x >= bx8 - 30 && x <= bx8+bw8 - 30 && y > by8 - 30) {
    y = by8 - 25;
    spdY = spdY * -1;
  }
  
  }



