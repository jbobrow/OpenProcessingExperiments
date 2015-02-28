

float diam;
float x;
float y; 

void setup (){
  size(400,400);
  smooth();
  frameRate(30);
}

void draw(){
  
    if (mouseY < height/2) {
      
    background(0,30,200);
    stroke(0);
    fill(30,200,0);
    rectMode(CENTER);
    rect(200,300,400,200);
    fill(240);
    rectMode(CENTER);
    rect(200,175,50,50);
    fill(100);
    rectMode(CORNER);
    rect(183,168,10,10);
    rect(207,168,10,10);
    fill(50,50,0);
    rectMode(CENTER);
    rect(200,194,8,13);
    noStroke();
    fill(255,255,0);
    ellipseMode(CENTER);
    ellipse(75,100,40,40);
    fill(200,0,0);
    triangle(200,130,175,150,225,150);
  }
  
  else {
  background(0);
    diam=random(20);
    x=random(width);
    y=random(height);
noStroke();
fill(255,0,0);
ellipse(x,y,diam,diam); 
  diam=random(20);
    x=random(width);
    y=random(height);
noStroke();
fill(255,255,0);
ellipse(x,y,diam,diam); 
  diam=random(20);
    x=random(width);
    y=random(height);
noStroke();
fill(230,180,0);
ellipse(x,y,diam,diam); 
    stroke(0);
    fill(30,200,0);
    rectMode(CENTER);
    rect(200,300,400,200);
    fill(240);
    rectMode(CENTER);
    rect(200,175,50,50);
    fill(100);
    rectMode(CORNER);
    rect(183,168,10,10);
    rect(207,168,10,10);
    fill(50,50,0);
    rectMode(CENTER);
    rect(200,194,8,13);
    noStroke();
    fill(255,0,0);
    ellipseMode(CENTER);
    ellipse(75,100,40,40);
    fill(200,0,0);
    triangle(200,130,175,150,225,150);
  }
}



