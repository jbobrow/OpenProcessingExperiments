
PShape bg;
PShape eybrow2;
PShape rainbow;
PShape tear;
//PShape bg;
//PShape bg;
//PShape bg;
//PShape bg;

float rx = 340;
float ry = 140;

float dx = 340;
float dy = 140;


float tx = 380;
float ty = 200;
float dty= 200;
float tearSpeed = 2;
boolean tearFalling =false;

float speed = 0.3;



void setup() {
  size(612,792);
  bg = loadShape("eyes3.svg");
  eybrow2 = loadShape("eybrow2.svg");
  rainbow = loadShape("rainbow.svg");
  tear = loadShape("tear.svg");
  smooth();
}

void draw() {
  background(255);

  // property += (destination - prpperty) * speed
  // xPosition += (destinationXposition - xPosition) * speed
  // speed of .3 is very fast. speed of .05 is very slow.````````````````````````````````````````````````````````````````
  rx += (dx - rx) * speed;
  ry += (dy - ry)* speed;

  if (tearFalling ==  false) {
    ty += (dty - ty)* speed/6;
  } else {
    ty += tearSpeed; 
    tearSpeed += 0.2;
    println(tearSpeed);
  }

  if (ty > 244.8) {
   tearFalling = true;
   
   if (ty > height + 20) {
     ty = 200;
     tearSpeed = 2;
   }
   
  } else {
    tearFalling = false;
  }

  float tearWid = random(69,71);
  float tearHei = random(99,101);

 
  
  tint(255, 0, 0);
  shape(tear, tx, ty, tearWid, tearHei);
  shape(rainbow, rx, ry);
  shape(bg, 100, 100);
  shape(eybrow2, 60, 50);
   



  if (mousePressed ) {


    if (mouseX > 75 && mouseX < 275 && mouseY > 75 && mouseY < 115) { 
      rain();
    }
    if (mouseX > 360 && mouseX < 535 && mouseY > 135 && mouseY < 290) { 
      dx = 320;
      dy = 50;
      dty = 245;
      speed = .2;
    }
    if (mouseX > 480 && mouseX < 505 && mouseY > 245 && mouseY < 285) { 
      rain();
    }

    //println(mouseX +" ," + mouseY);
    //println(ty);
  } 


  else {
    dx = 340;
    dy = 140;
    dty = 200;
    speed = 0.05;
  }
}

void rain() {
  fill(0);
  float x = random(100, 272);
  float y = random(120, 200);
  float w = random(100, 272);
  float z = random(120, 200);
  ellipse(x, y, 2, 20);

  ellipse(w+10, z+10, 2, 20);
}


