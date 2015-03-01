

PImage bg;

float eyel = -200;
float pupl =-200;
float eyer = -100;
float pupr =-100;
float face= -150;
float nose = -150;
float mouth = - 150;

float eyel2 = +200;
float pupl2 =+200;
float eyer2 = +100;
float pupr2 =+100;
float face2= +150;
float nose2 = +150;
float mouth2 =  +150;

float eyel3 = -200;
float pupl3 =-200;
float eyer3 = -100;
float pupr3 =-100;
float face3= -150;
float nose3 = -150;
float mouth3 =  -150;

float eyel4 = +200;
float pupl4 =+200;
float eyer4 = +100;
float pupr4 =+100;
float face4= +150;
float nose4 = +150;
float mouth4 =  +150;

void setup() {
  size(400, 400);

}

void draw() {
  background(0,200,50);
  float slow_circle_size = 50;

  if (random(10) > 5) {
    slow_circle_size = 60;
  }
  //face
  fill(255,255,0);
  ellipse(face,90,150,150);
  
  //nose
  fill(255,0,0);
 ellipse(nose,95,20,40);
 
   //mouth
  fill(random(30),random(200),random(75));
  rectMode(CENTER);
 rect(mouth,130,80,random(20));
 

  //left eye
  fill(#C1FF3E);
  ellipse(eyel, 80, random(50), slow_circle_size);
  
  fill(0);
  ellipse(pupl, 80, 30, 30);
  
  //right eye
 fill(#C1FF3E);
  ellipse(eyer,80, random(50), slow_circle_size);
  fill(0);
  ellipse(pupr, 80, 30, 30);


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
  
  //face 2:
  
    if (random(10) > 5) {
    slow_circle_size = 60;
  }
  //face
  fill(255,255,0);
  ellipse(face2,90,150,150);
  
  //nose
  fill(255,0,0);
 ellipse(nose2,95,20,40);
 
   //mouth
  fill(random(30),random(200),random(75));
  rectMode(CENTER);
 rect(mouth2,130,80,random(20));
 

  //left eye
  fill(#C1FF3E);
  ellipse(eyel2, 80, random(50), slow_circle_size);
  
  fill(0);
  ellipse(pupl2, 80, 30, 30);
  
  //right eye
 fill(#C1FF3E);
  ellipse(eyer2,80, random(50), slow_circle_size);
  fill(0);
  ellipse(pupr2, 80, 30, 30);


  eyel2 = eyel2 - 1;
  if (eyel2 < -200) {
    eyel2 = 500;
  }

pupl2 = pupl2 - 1;
  if (pupl2 < -200) {
    pupl2 = 500;
  }
  
  eyer2 = eyer2 - 1;
  if (eyer2 < -200) {
    eyer2 =500;
  }

 pupr2 = pupr2 - 1;
  if (pupr2 < -200) {
    pupr2 = 500;
  }
   face2 = face2 - 1;
  if (face2 <-150) {
   face2 = 550;
  }
     nose2 = nose2 - 1;
  if (nose2 <-150) {
   nose2 = 550;
  }
       mouth2 = mouth2 - 1;
  if (mouth2 <-150) {
  mouth2 = 550;
  }
  
  //face3:
    //face
  fill(255,255,0);
  ellipse(face3,300,150,150);
  
  //nose
  fill(255,0,0);
 ellipse(nose3,310,20,40);
 
   //mouth
  fill(random(30),random(200),random(75));
  rectMode(CENTER);
 rect(mouth3,345,80,random(20));
 

  //left eye
  fill(#C1FF3E);
  ellipse(eyel3, 285, random(50), slow_circle_size);
  
  fill(0);
  ellipse(pupl3, 285, 30, 30);
  
  //right eye
 fill(#C1FF3E);
  ellipse(eyer3,285, random(50), slow_circle_size);
  fill(0);
  ellipse(pupr3, 285, 30, 30);


  eyel3 = eyel3 + 1;
  if (eyel3 >500) {
    eyel3 = -200;
  }

pupl3 = pupl3 + 1;
  if (pupl3 > 500) {
    pupl3 = -200;
  }
  
  eyer3 = eyer3 + 1;
  if (eyer3 > 600) {
    eyer3 =-100;
  }

 pupr3 = pupr3 + 1;
  if (pupr3 > 600) {
    pupr3 = -100;
  }
   face3 = face3 + 1;
  if (face3 >550) {
   face3 = -150;
  }
     nose3 = nose3 + 1;
  if (nose3 >550) {
   nose3 = -150;
  }
       mouth3 = mouth3 + 1;
  if (mouth3 >550) {
  mouth3 = -150;
  }
  
  //face 4:
      //face
  fill(255,255,0);
  ellipse(face,300,150,150);
  
  //nose
  fill(255,0,0);
 ellipse(nose,310,20,40);
 
   //mouth
  fill(random(30),random(200),random(75));
  rectMode(CENTER);
 rect(mouth,345,80,random(20));
 

  //left eye
  fill(#C1FF3E);
  ellipse(eyel, 285, random(50), slow_circle_size);
  
  fill(0);
  ellipse(pupl, 285, 30, 30);
  
  //right eye
 fill(#C1FF3E);
  ellipse(eyer,285, random(50), slow_circle_size);
  
  fill(0);
  ellipse(pupr, 285, 30, 30);


  eyel = eyel + 1;
  if (eyel <-200) {
    eyel = 500;
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

