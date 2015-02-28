
//Shannon 9/3/2011

float x = 200;
float y = 200;
int change = 1;
int c1 = #5BD691;
int c2 = #95E33E;
int speed = 1;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  
  x = x + speed;
  if ((x>width)||(x<0)){
   speed = speed*-1; 
  }

  background(100);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //antennae (origin where both antennae meet = x,y-40)
  stroke(0);
  line(x-25,y-75,x,y-40);
  line(x,y-40,x+25,y-75);
  noStroke();
  fill(0);
  ellipse(x-25,y-75,width/60,height/60);
  ellipse(x+25,y-75,width/60,height/60);
  
  //arms
  for (float i = y-10; i < y+81; i+=80) {
  strokeWeight(4);
  stroke(c1);
  line(x-40,i,x,i+10);
  line(x+40,i,x,i+10);
  }
 
  stroke(c2);
  line(x-40,y+30,x,y+40);
  line(x+40,y+30,x,y+40);
  
  //body (order = bottom to top of caterpillar)
  noStroke();
  fill(c1);
  ellipse(x,y+80,width/8,height/8);
  fill(c2);
  ellipse(x,y+40,width/8,height/8);
  //central circle based on half width half height
  fill(c1);
  ellipse(x,y,width/8,height/8);
  //the head
  fill(c2);
  ellipse(x,y-40,width/8,height/8);
  
  //face
  //mouth
  stroke(0);
  strokeWeight(1);
  noFill();
  arc(x,y-42,40,40,0,PI/2);
  arc(x,y-42,40,40,PI/2,PI);
  //eyes
  arc(x-10,y-45,10,10,TWO_PI-PI/2, TWO_PI);
  arc(x-10,y-45,10,10,PI, TWO_PI-PI/2);
  arc(x+10,y-45,10,10,TWO_PI-PI/2, TWO_PI);
  arc(x+10,y-45,10,10,PI, TWO_PI-PI/2); 
  
}

void mousePressed(){
stroke(0);
c1 = c1 + 10;
c2 = c2 + 10;
}



