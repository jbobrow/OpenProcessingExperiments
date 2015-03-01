
//mouse click engages random colors that may be uncomfortable watch

float mx = 0;
float my = 0;
float c = 255;

void setup() {
  size(800,600);
  smooth();
  frameRate(24);
  strokeWeight(2);
  background(255,178,77);
  ellipseMode(RADIUS);
  frameRate(45);
}

void draw(){
  background(255,178,77);
  if(mousePressed== true){
  frameRate(50);
  background(random(255),random(255),random(255));
  } else {
 frameRate(45);
 background(255,178,77);
  }
 mx=pmouseX;
 my=mouseY;
 
 //floater
 strokeWeight(8);
 stroke(99,237,c);
 fill(0,205,232);
 //fill(random(0,255));
  ellipse(mx,my+150,85,70);
  //antennae
  stroke(120);
  strokeWeight(2);
  line(mx,my,mx-120,my-120);
  //antenna bobber
  fill(c);
  ellipse(mx-120,my-120,10,10);
  //body
  stroke(c);
  fill(c);
  rect(mx-100,my+10,200,175);
  smooth();
  fill(c);
  stroke(c);
  ellipse(mx,my,100,100);
  //stripe
  strokeWeight(0);
  fill(0,205,232);
  rect(mx-102,my+120,205,15);
  fill(c);
  //arms
  ellipse(mx-130,my+120,20,80);
  ellipse(mx+130,my+120,20,80);
 
  //eyeball
  stroke(0);
  fill(0);
  ellipse(mx, my-10, 80,50);
  
  //eyes
  stroke(255);
  //fill(255);
  fill(random(255),random(255),random(255));
  ellipse(mx-35,my-10,10,25);
  ellipse(mx+35,my-10,10,25);
  
  if(mousePressed == true) {
    c= random(255);
  } else { 
    c= 255;
  }
    
  
  
}
  
  
