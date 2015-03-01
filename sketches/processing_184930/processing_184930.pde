

PImage bg;

float eyel = -200;
float pupl =-200;
float eyer = -100;
float pupr =-100;
float face= -150;
float nose = -150;
float mouth = - 150;


void setup() {
  size(400, 400);
 
}

void draw() {
  background(130);
  float slow_circle_size = 25;

  if (random(10) > 5) {
    slow_circle_size = 30;
  }
  //face
  fill(255,255,0);
  ellipse(face,100,150,175);
  
  //nose
  fill(255,0,0);
 ellipse(nose,100,20,35);
 
   //mouth
  fill(random(30),random(200),random(75));
  rectMode(CENTER);
 rect(mouth,137.5,100,random(25));
 

  //left eye
  fill(#C1FF3E);
  ellipse(eyel, 75, random(75), slow_circle_size);
  
  fill(0);
  ellipse(pupl, 75, 20, 20);
  
  //right eye
 fill(#C1FF3E);
  ellipse(eyer,75, random(75), slow_circle_size);
  fill(0);
  ellipse(pupr, 75, 20, 20);


  eyel = eyel + 1;
  if (eyel >500) {
    eyel = -200;
  }

pupl = pupl + 1;
  if (pupl > 500) {
    pupl = -200;
  }
  
  eyer = eyer + 1;
  if (eyer > 600) {
    eyer =-100;
  }

 pupr = pupr + 1;
  if (pupr > 600) {
    pupr = -100;
  }
   face = face + 1;
  if (face >550) {
   face = -150;
  }
     nose = nose + 1;
  if (nose >550) {
   nose = -150;
  }
       mouth = mouth + 1;
  if (mouth >550) {
  mouth = -150;
  }
  
  
  
  
  

  if (random(10) > 5) {
    slow_circle_size = 30;
  }
  //face
  fill(255,255,0);
  ellipse(face,300,150,175);
  
  //nose
  fill(255,0,0);
 ellipse(nose,300,20,35);
 
   //mouth
  fill(random(30),random(200),random(75));
  rectMode(CENTER);
 rect(mouth,350,100,random(25));
 

  //left eye
  fill(#C1FF3E);
  ellipse(eyel, 275, random(75), slow_circle_size);
  
  fill(0);
  ellipse(pupl, 275, 20, 20);
  
  //right eye
 fill(#C1FF3E);
  ellipse(eyer,275, random(75), slow_circle_size);
  fill(0);
  ellipse(pupr, 275, 20, 20);


  eyel = eyel + 1;
  if (eyel >500) {
    eyel = -200;
  }

pupl = pupl + 1;
  if (pupl > 500) {
    pupl = -200;
  }
  
  eyer = eyer + 1;
  if (eyer > 600) {
    eyer =-100;
  }

 pupr = pupr + 1;
  if (pupr > 600) {
    pupr = -100;
  }
   face = face + 1;
  if (face >550) {
   face = -150;
  }
     nose = nose + 1;
  if (nose >550) {
   nose = -150;
  }
       mouth = mouth + 1;
  if (mouth >550) {
  mouth = -150;
  }
   
}
  

