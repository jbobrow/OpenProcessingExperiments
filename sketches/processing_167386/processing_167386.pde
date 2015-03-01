
//import processing.opengl.*
//float angle;
PImage photo;
int pointillize = 16;
PFont f;
void setup() {
  size(600, 300);

 noStroke();
  photo= loadImage("wafflez2.png");
    background(0);
//   smooth();
  
  
}

void draw() {

 
 
  
//   camera(width/2, height/2, 300, width/2, height/2, 0, 0, 1, 0);
//  pointLight(200, 200, 200, width/2, height/2, 200);
//  
//  translate(width/4, height/4);
//  rotateY(angle);
//  rotateX(angle);
//  
//   angle += 0.01;
//   
//    float cameraY = height/2.0;
//  float fov = mouseX/float(width) * PI/2;
//  float cameraZ = cameraY / tan(fov / 2.0);
//  float aspect = float(width)/float(height);
//  if (mousePressed) {
//    aspect = aspect / 2.0;
//  }
//  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
//  
//  translate(width/2+30, height/2, 0);
//  rotateX(-PI/6);
//  rotateY(PI/3 + mouseY/float(height) * PI);
 
  
  /////waffle
  
  
    
  if (mouseX>0) {
  tint(255,0,0);
  image(photo, 0,0);
}

if (mouseX>50) {
  tint(0,255,0);
  image(photo, 0,0);
}

if (mouseX>100) {
  tint(0,0,255);
  image(photo, 0,0);
}

if (mouseX>150) {
  tint(0,200,255);
  image(photo, 0,0);
}

if (mouseX>200) {
  tint(255,200,0);
  image(photo, 0,0);
}

if (mouseX>250) {
  tint(0,200,255);
  image(photo, 0,0);
}

if (mouseX>300) {
  tint(100,255,0);
  image(photo, 0,0);
}

if (mouseX>350) {
  tint(255,25,200);
  image(photo, 0,0);
}

if (mouseX>400) {
  tint(25,25,25);
  image(photo, 0,0);
}

if (mouseX>450) {
  tint(0,100,255);
  image(photo, 0,0);
}

if (mouseX>500) {
  tint(255,100,255);
  image(photo, 0,0);
}

if (mouseX>550) {
  tint(0,255,255);
  image(photo, 0,0);
}

if (mouseX>600) {
  tint(255,0,0);
  image(photo, 0,0);
}

if (mouseX>650) {
  tint(50);
  image(photo, 0,0);
}
///////// end waffle

/// points
int x = int(random(photo.width));
int y = int(random(photo.height));
int loc = x + y*photo.width;

loadPixels();
float r = red(photo.pixels[loc]);
float g = green(photo.pixels[loc]);
  float b = blue(photo.pixels[loc]);
  noStroke();
  //// end points
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);



//////////// ellipse1
if (mouseX>50) {
  stroke(0,0,0,0);
  fill(0, 0, 0,50);
  ellipse(mouseX, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,100);
  ellipse(mouseX, mouseY-15, 30, 30);
}

if (mouseX<600) {
  stroke(0,0,0,0);
  fill(0, 0, 0,50);
  ellipse(mouseX, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,100);
  ellipse(mouseX, mouseY-15, 30, 30);
}
if (mouseY>50) {
  stroke(0,0,0,0);
  fill(0, 0, 0,50);
  ellipse(mouseX, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,100);
  ellipse(mouseX, mouseY-15, 30, 30);
}

if (mouseY<300) {
  stroke(0,0,0,0);
  fill(0, 0, 0,50);
  ellipse(mouseX, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,100);
  ellipse(mouseX, mouseY-15, 30, 30);
}

  ////////////// ellipse 2
 if (mouseX>50) { 
stroke(0,0,0,0);
  fill(108,108,108,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,100);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
   if (mouseX<600) { 
stroke(0,0,0,0);
  fill(108,108,108,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,100);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
   if (mouseY>50) { 
stroke(0,0,0,0);
  fill(108,108,108,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,100);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
    if (mouseY<300) { 
stroke(0,0,0,0);
  fill(108,108,108,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,100);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
  /////////// ellipse 3
  if (mouseX>50) {
  stroke(0,0,0,0);
  fill(196,196,196,50);
  ellipse(mouseX-15, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,100);
  ellipse(mouseX-15,mouseY-15, 30, 30);
  }
  
  if (mouseX<600) {
  stroke(0,0,0,0);
  fill(196,196,196,50);
  ellipse(mouseX-15, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,100);
  ellipse(mouseX-15,mouseY-15, 30, 30);
  }
  
   if (mouseY>50) {
  stroke(0,0,0,0);
  fill(196,196,196,50);
  ellipse(mouseX-15, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,100);
  ellipse(mouseX-15,mouseY-15, 30, 30);
  }
  
   if (mouseY<300) {
  stroke(0,0,0,0);
  fill(196,196,196,50);
  ellipse(mouseX-15, mouseY-15, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,100);
  ellipse(mouseX-15,mouseY-15, 30, 30);
  }
  
  /////////// ellipse 4
  if (mouseX>50) {
  stroke(0,0,0,0);
  fill(237,237,237, 50);
  ellipse(mouseX+15, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(0,250,28, 100);
  ellipse(mouseX+15, mouseY,30,30);
  }
  
  if (mouseX<600) {
  stroke(0,0,0,0);
  fill(237,237,237, 50);
  ellipse(mouseX+15, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(0,250,28, 100);
  ellipse(mouseX+15, mouseY,30,30);
  }
  
   if (mouseY>50) {
  stroke(0,0,0,0);
  fill(237,237,237, 50);
  ellipse(mouseX+15, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(0,250,28, 100);
  ellipse(mouseX+15, mouseY,30,30);
  }
  
   if (mouseY<300) {
  stroke(0,0,0,0);
  fill(237,237,237, 50);
  ellipse(mouseX+15, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(0,250,28, 100);
  ellipse(mouseX+15, mouseY,30,30);
  }
 

    }


