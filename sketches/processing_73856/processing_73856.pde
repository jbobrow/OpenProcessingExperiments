
PImage img;
int x=0;
float i=0;

void setup() {
  size(600, 600);
  img = loadImage("Boo.png");
  img = loadImage("turkey.png");
  noStroke();
  smooth();
  background(255);
}

void draw() {
  frameRate(300000);
  
  println(mouseX + " : " + mouseY); 

//////////////////////
///ERASE BACKGROUND///
//////////////////////
  if (mousePressed && (mouseButton == RIGHT)) {
    background(255);
  }
//////////////////////
////END ERASE/////////
//////////////////////


/////////////////////
////FIRST TOOL///////
/////////////////////
  if ((keyPressed = true) && (key == '1')) {
    if (mousePressed && (mouseButton == LEFT) || x ==10) {
      if (mouseX<=300) {
        fill(25, 100, mouseY);
      }
      else {
        fill(mouseX, mouseY, 60);
      }
      ellipse(pmouseX, pmouseY, 20, 20);
    }
  }
///////////////////
///END 1ST TOOL////



////////////////////
///'STAR' TOOL//////
////////////////////

  if ((keyPressed = true) && (key == '3')) {
    if (mousePressed) {
      fill(random(50), random(233), random(120));
      ellipse(pmouseX, pmouseY, random(90), random(20));
      ellipse(pmouseX, pmouseY, random(20), random(20));
      ellipse(pmouseX, pmouseY, random(20), random(90));
    }
  }
/////////////////
//END 'STAR'////
////////////////




/////////////////////
//HALLOWEEN PIC/////
////////////////////

  if ((keyPressed == true) && (key =='6')) {
    img = loadImage("Boo.png"); 
    image(img, 0, 0);
  }
/////////////////////
//END HALLOWEEN/////
////////////////////

///////////////////
//PUMPKIN COLOR////
///////////////////

if ((keyPressed = true) && (key == '2')) {
    if (mousePressed && (mouseButton == LEFT) || x ==10) {
      if (mouseX<=300) {
        fill(250, 142, 25);
      }
      else {
        fill(250, 142, 25);
      }
      ellipse(pmouseX, pmouseY, 20, 20);
    }
  }
/////////////////
//END PUMPKIN////
/////////////////


///////////////////
///"CRAZY" BRUSH///
///////////////////
  
if ((keyPressed == true) && (key =='4')) {
  if (mousePressed) {  
    i= i+1000000000;
    //translate(-100,-70);
    
    translate(300,300);
    rotate(i); 
    fill(random(255),random(255),random(0));
    ellipse(pmouseX, pmouseY,300, 300);
     if (mouseX<=-800) {
    img = loadImage("turkey.png"); 
    image(img,mouseX,mouseY);
     }
}  
} 

if ((keyPressed == true) && (key =='5')) {
  if (mousePressed) {  
    i= i+1000000000;
    //translate(-100,-70);
    
    translate(300,300);
    rotate(i); 
    fill(random(255),random(255),random(0));
    ellipse(pmouseX, pmouseY,300, 300);
     if (mouseX<=800) {
    img = loadImage("turkey.png"); 
    image(img,mouseX,mouseY);
     }
}  
} 
  



}  //END OF VOID DAW//

