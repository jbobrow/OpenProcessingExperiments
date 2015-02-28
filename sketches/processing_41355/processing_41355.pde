
int sun = 2;
int speed = 2;
int moon = 1000;
int moonspeed = 5/2;

void setup() {
  size(900, 900);
 
}

void draw() {

  background(79-sun/5, 196-sun/5, 252-sun/5);



  //
  sun=sun+speed;
  noStroke();
  fill(250-sun/4, 229-sun/4, 63-sun/4);
  ellipse(300, sun, 200, 200);

  moon=moon-moonspeed;
  noStroke();
  fill(79+sun/5, 196+sun/5, 252+sun/5);
  ellipse(700, moon, 120, 120);

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(876, 500, 2, 2);

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(100, 400, 2, 2);

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(50, 200, 2, 2);  

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(800, 50, 2, 2);  

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(500, 650, 2, 2); 

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(800, 850, 2, 2); 

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(120, 800, 2, 2);     

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(150, 870, 2, 2);      

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(50, 50, 2, 2);    

  noStroke();
  fill(79-sun/5, 196-sun/5, 252-sun/5);  
  ellipse(450, 450, 2, 2);    
  //ifs start here

  if (moon <= 200)
    moonspeed = 0;

  if (sun >= 900)
    fill(255);
  ellipse(876, 500, 2, 2);

  if (sun >= 850)
    fill(255);
  ellipse(100, 400, 2, 2);

  if (sun >= 800)
    fill(255);
  ellipse(50, 200, 2, 2);  

  if (sun >= 750)
    fill(255);
  ellipse(800, 50, 2, 2);   

  if (sun >= 950)
    fill(255);
  ellipse(500, 650, 2, 2); 

  if (sun >= 1020)
    fill(255);
  ellipse(800, 850, 2, 2); 

  if (sun >= 1000)
    fill(255);
  ellipse(120, 800, 2, 2); 

  if (sun >= 1100)
    fill(255);
  ellipse(150, 870, 2, 2); 

  if (sun >= 700)
    fill(255);
  ellipse(50, 50, 2, 2); 

  if (sun >= 875)
    fill(255);
  ellipse(450, 450, 2, 2);
  
  
}


void keyTyped() {
  sun = 2;
  moon = 1000;
  moonspeed =5/2;
}


