

float px,py; //position (x and y)
float pw,ph,rad; //size (width and height)
float spdX, spdY; //speed (how it moves)

float bx,by;
float bw,bh;

float bx2,by2;
float bw2,bh2;

float bx3,by3;
float bw3,bh3;

float bx4,by4;
float bw4,bh4;

float bx5, by5;
float bw5, bh5;

float bx6,by6;
float bw6,bh6;

void setup (){
  //setup only runs once
  //this is where we INITIALIZE values
  size(800, 600);
  //assign the particle a position
  px = width/2;
  py = 30; 
  pw = 50;
  ph = 50;
  rad = pw/2; 
  
  spdX = 3.0;
  spdY = 2.0;
   
  
  
  bx = width/2 - 250;
  by = height- 100;
  bx2 = width/2 - 150;
  by2 = height -150;
  bx3 = width/2 - 50;
  by3 = height - 200;
  bx4 = 500;
  by4 = 0;
  bx5 = 150;
  by5 = 550; 
  bx6 = 0; 
  by6 = 100;
  
 // assign the block size
 bw = 175;
 bh = 50;
 bw2 = 175;
 bh2 = 50;
 bw3 = 175;
 bh3 = 50;
 bw4 = 300;
 bh4 = 550;
 bw5 = 800;
 bh5 = 200;
 bw6 = 50;
 bh6 = 600;
  
}


void draw(){
  background(10,20,200);
  
  fill(225);
  noStroke();
  ellipse(200,50,150,100);
  ellipse(250,55,125,100);
  ellipse(215,100,90,80);
  
  ellipse(350,200,150,100);
  ellipse(375,225,150,100);
  ellipse(380,150,100,75);
  ellipse(399,180,125,100);
  
  fill(250);
  ellipse(px,py,pw,ph);
  fill(100);
  rect(bx,by,bw,bh);
  rect(bx2,by2,bw2,bh2);
  rect(bx3,by3,bw3,bh3);
  fill(250,0,0);
  rect(bx4,by4,bw4,bh4);
  fill(11,200,11);
  rect(bx5,by5,bw5,bh5);
  fill(200,100,25);
  rect(bx6,by6,bw6,bh6);
  
  fill(250);
  rect(600,150,150,200);
  
  
  
  
  
  
  
  px += spdX; 
  py += spdY;
  
  
  if (px > width -rad) {
    spdX *= -1;
  }
  
  if (px < rad) { 
    spdX *= -1;
  }
  
 
  if (py > height -rad) {
    spdY *= -1;
  }
  
  if (py < rad) { 
    spdY *= -1;
  }
  
 
  if(py > by && py < by + bh && px > bx - rad && px < bx + bw /2) {
    px = bx-rad;
    spdX *= -1;
  } 
    if(py > by && py < by + bh && px < bx + bw+ rad && px > bx + bw /2) {
      px = bx +bw +rad;
    spdX *= -1;  
  } 
  if(px > bx && px < bx + bw && py < by - rad && py > by + bh /2) {
    py = by - rad;
    spdX *= -1;  
  } 
  if(px > bx && px < bx + bw && py < by + bh+ rad && py > by + bh /2) {
    py = by +bh + rad;
    spdX *= -1;
    
  } 
  
  
  if(py > by2 && py < by2 + bh2 && px > bx2 - rad && px < bx2 + bw2 /2) {
    px = bx2-rad;
    spdX *= -1;
  } 
    if(py > by2 && py < by2 + bh2 && px < bx2 + bw2+ rad && px > bx2 + bw2 /2) {
      px = bx2 +bw2 +rad;
    spdX *= -1;  
  } 
  if(px > bx2 && px < bx2 + bw2 && py < by2 - rad && py > by2 + bh2 /2) {
    py = by2 - rad;
    spdX *= -1;  
  } 
  if(px > bx2 && px < bx2 + bw2 && py < by2 + bh2+ rad && py > by2 + bh2 /2) {
    py = by2 +bh2 + rad;
    spdX *= -1;
    
  } 
  
  //3
  if(py > by3 && py < by3 + bh3 && px > bx3 - rad && px < bx3 + bw3 /2) {
    px = bx3-rad;
    spdX *= -1;
  } 
    if(py > by3 && py < by3 + bh3 && px < bx3 + bw3+ rad && px > bx3 + bw3 /2) {
      px = bx3 +bw3 +rad;
    spdX *= -1;  
  } 
  if(px > bx3 && px < bx3 + bw3 && py < by3 - rad && py > by3 + bh3 /2) {
    py = by3 - rad;
    spdX *= -1;  
  } 
  if(px > bx3 && px < bx3 + bw3 && py < by3 + bh3+ rad && py > by3 + bh3 /2) {
    py = by3 +bh3 + rad;
    spdX *= -1;
    
  }
 
if(py > by4 && py < by4 + bh4 && px > bx4 - rad && px < bx4 + bw4 /2) {
    px = bx4-rad;
    spdX *= -1;
  } 
    if(py > by4 && py < by4 + bh4 && px < bx4 + bw4 + rad && px > bx4 + bw4 /2) {
      px = bx4 +bw4 +rad;
    spdX *= -1;  
  } 
  if(px > bx4 && px < bx4 + bw4 && py < by4 - rad && py > by4 + bh4 /2) {
    py = by4 - rad;
    spdX *= -1;  
  } 
  if(px > bx4 && px < bx4 + bw4 && py < by4 + bh4+ rad && py > by4 + bh4 /2) {
    py = by4 +bh4 + rad;
    spdX *= -1;
    
  } 
  
  if(py > by5 && py < by5 + bh5 && px > bx5 - rad && px < bx5 + bw5 /2) {
    px = bx5-rad;
    spdX *= -1;
  } 
    if(py > by5 && py < by5 + bh5 && px < bx5 + bw5 + rad && px > bx5 + bw5 /2) {
      px = bx5 +bw5 +rad;
    spdX *= -1;  
  } 
  if(px > bx5 && px < bx5 + bw5 && py < by5 - rad && py > by5 + bh5 /2) {
    py = by5 - rad;
    spdX *= -1;  
  } 
  if(px > bx5 && px < bx5 + bw5 && py < by5 + bh5+ rad && py > by5 + bh5 /2) {
    py = by5 +bh5 + rad;
    spdX *= -1;
    
  }
 
 if(py > by6 && py < by6 + bh6 && px > bx6 - rad && px < bx6 + bw6 /2) {
    px = bx6-rad;
    spdX *= -1;
  } 
    if(py > by6 && py < by6 + bh6 && px < bx6 + bw6 + rad && px > bx6 + bw6 /2) {
      px = bx6 +bw6 +rad;
    spdX *= -1;  
  } 
  if(px > bx6 && px < bx6 + bw6 && py < by6 - rad && py > by6 + bh6 /2) {
    py = by6 - rad;
    spdX *= -1;  
  } 
  if(px > bx6 && px < bx6 + bw6 && py < by6 + bh6+ rad && py > by6 + bh6 /2) {
    py = by6 +bh6 + rad;
    spdX *= -1;
    
  } 
  

}

