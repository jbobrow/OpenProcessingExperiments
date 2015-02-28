
float cy, cx; 
float angle;

void setup(){
  
  size(screen.width,screen.height);
  background(0);
  noStroke();
  smooth();
  
  frameRate(30);
}

void draw(){
  //background(255);
  
  //scale(1.5);
  vortex ();
    
  }
  
  
  void vortex(){
  
    //scale(1.5);
  float radius = sqrt (sq (mouseX-width/2) + sq (mouseY-height/2)); 
  radius=50;
   
  translate(width/2,height/2);
  scale(2.5);
   //fill (random(255),random(255),random(255),random(255));
  //rotate(angle);
  
     translate(2*radius,0);
  rotate(4*angle/3);
  fill(random(255),random(255),random(255),30);
  rect(radius/2,0,100,3);
  angle=angle+0.1;
  
  
    fill(0,random(255),random(200),10);
    rotate(angle);
  ellipse(radius,-radius,20,50);
    //fill(0,0,0,20);
  //ellipse(radius,-radius,15,25);
  angle=angle+0.8;
  
     translate(2*radius,0);
  rotate(4*angle/3);
  fill(random(255),random(255),random(255),30);
  rect(radius/2,0,100,3);
  angle=angle+0.1;

    fill(0,255,200,10);
    rotate(angle);
  ellipse(radius,-radius,20,50);
   // fill(0,0,0,20);
  //ellipse(radius,-radius,15,25);
  angle=angle+0.8;
  }

