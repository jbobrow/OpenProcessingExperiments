
float x = 50;
float y = 50;
float diam = 70;
float r = 255;
float g = 90;
float b = 148;
boolean count = true;
float speed = 0;
float gravity = .1;

void setup() {
  size(640,480);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
}

void draw() {
  background(0);
  
  //body
  stroke(255);
  strokeWeight(1);
  fill(r,g,b);
  ellipse(x,y+10,35,35);
  ellipse(x,y-20,42,42);
  
  //arm ends
  ellipse(x-33,y+7,10,10);
  ellipse(x+33,y+7,10,10);
  
  //mouth
  fill(255);
  noStroke();
  arc(x,y-10,20,15,0,PI);
  
  //eyes
  fill(#80C691);
  stroke(0);
  strokeWeight(2);
  ellipse(x-7,y-22,12,15);
  ellipse(x+7,y-22,12,15);
  fill(0);
  ellipse(x-6,y-22,4,5);
  ellipse(x+7,y-22,4,5);
  stroke(255);
  line(x-12,y-26,x-11,y-25);
  line(x+3,y-26,x+4,y-25);
  
  //arms and legs
  stroke(#369CFF);
  strokeWeight(3);
  line(x-7,y+29,x-10,y+37); 
  line(x+8,y+29,x+10,y+37);
  line(x-20,y+7,x-25,y+7);
  line(x+20,y+7,x+25,y+7);
  
  //belly button
  noStroke();
  fill(#FFB2C9);
  
  for(int i = 0; i<10; i++){
    fill(0, 3*i, 200-20*i);
    ellipse(x,y+15,15-i,15-i);
  }
  stroke(255);
  strokeWeight(3);
  point(x,y+15);
  
  
  //feet
  strokeWeight(1);
  fill(255);
  ellipse(x-15,y+40,18,9);
  ellipse(x+15,y+40,18,9);
  fill(#369CFF);
  rect(x-15,y+43,18,5);
  rect(x+15,y+43,18,5);
  
  //moustache
  fill(0);
  noStroke();
  triangle(x-5,y-2,x+5,y-2,x,y+4);
  
  //make the guy bounce around
   if(!count) {
     y = y+speed;
     x = pmouseX;
     speed = speed + gravity;
     if(y> height){
       speed = speed * -.92;
     }
   }
   
  //bugs
  fill(255);
  noStroke();
  
  float snowX = random(640);
  float snowY = random(440,480);
  ellipse(snowX, snowY, 5, 5);
  ellipse(snowX, snowY, 8, 8);
    
}

void mousePressed() {
  if(count) {
    r = random(255);
    g = random(255);
    b = random(255);
    speed = 5;
  } 
  count = !count;
 
}



