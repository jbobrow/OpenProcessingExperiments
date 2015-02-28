
PImage myImage1, myImage2,myImage3,myImage4,myImage5,myImage6;
//int rad = 120;   
//float xpos, ypos;    

//float xspeed = 5.6; 
//float yspeed = 4.4; 

//int xdirection = 1;  
//int ydirection = 1;  


void setup() {
  size(1600, 1600);
  background(30,30,30);
  noStroke();
  frameRate(30);
  myImage1 = loadImage("3.png");
  myImage2 = loadImage("16.png");
  myImage3 = loadImage("2.png");
  myImage4 = loadImage("4.png");
  myImage5 = loadImage("17.png");
  myImage6 = loadImage("x.png");
  imageMode(CENTER);
  //xpos = 40;
  //ypos = 40;
  
}

int counter = 0;

void draw() {
  //pushMatrix();
  //xpos = xpos + ( xspeed * xdirection );
  //ypos = ypos + ( yspeed * ydirection );
  
  //if (xpos > width-40 || xpos < 40) {
    //xdirection *= -1;
  //}
  //if (ypos > height-40 || ypos < 40) {
   // ydirection *= -1;
  //}
  
 // noStroke();
  //noFill();
  //rect(0,0,120,120);
  //image(myImage6,xpos, ypos120, 120);

  
  rotate(random(0, 2*PI));
  
  float w1 = myImage1.width;
  float h1 = myImage1.height;
  
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.1, 10);
  
  if(mouseX < width/3) {
    tint(255, 255, 255, 50);
    image(myImage1, x1, y1, w1/s1, h1/s1);
  } else if ((mouseX > width/3) && (mouseX <= width/3*2)) {
    tint(255, 255, 255, 50);
    image(myImage3, x1, y1, w1/s1, h1/s1);
  } else if (mouseX > width/3*2) {
    tint(255, 255, 255, 50);
    image(myImage4, x1, y1, w1/s1, h1/s1);
  }
  //popMatrix();
  
  float w2 = myImage2.width;
  float h2 = myImage2.height;
  
  tint(255);
  image(myImage2, mouseX, mouseY, w2/8, h2/8);
 
  
  counter++;
  println(counter);
}

//void keyPressed() {
//  save("image" + counter + ".png");
//}

void mousePressed(){
  float w5 = myImage5.width;
  float h5 = myImage5.height;
  tint(255);
  image(myImage5, mouseX, mouseY, w5/8, h5/8);
  }
  
boolean loop = true;
void keyPressed() {
  if(key == ' ') {
    loop = !loop;
    if(loop) loop();
    else noLoop();
  }

  if (key == 'w') {
    background(255);
  }
}

void keyReleased() {
  background(30,30,30);
}

