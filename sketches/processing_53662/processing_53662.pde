
float x = 150; float y = 300; // location of ball

float speed = 0; //speed of ball
float gravity = 0.1; //gravity of ball

float cr = 255; //color of ball
float cg = 255;
float cb = 255;

/*---------------------------------*/void setup() {
  size (300,300);
  background (250);
  smooth ();
  rectMode (CENTER);
  ellipseMode (CENTER);
}

/*-------------------------------*/void draw() {
  background (255);
  rectMode(CENTER);
  ellipseMode(CENTER);

  //Ball
  fill (cr,cg,cb);
  noStroke();
  ellipse(x,y,50,50);
  
  y = y + speed;
  speed = speed + gravity;
  
  //If ball reaches bottom
  //Reverse Speed
  if (y > height) { 
  speed = speed * -0.99;
  cr = random(255);
  cg = random(255);
  cb = random(255);
  }
  
  if (y < speed) {
    speed = 0; 
  }
    
   
}

