
boolean button = false;

int sizeX = 200;
int sizeY = 200;

int bugHead = 35;
int bugBody = 100;
int spots = 15;

int grassR = 78;
int grassG = 175;
int grassB = 37;

int yellowR = 255;
int yellowG = 247;
int yellowB = 7;

int bR = 255;
int bG = 45;
int bB = 45;

int grass = 200;
int grassW = 6;


// ladybug

void setup() {
  size(sizeX,sizeY);
  smooth();
  frameRate(20);
}

void draw() {
  
  colorMode(RGB,255);
  background(mouseX,grassR,grassG,grassB);
  noStroke();
  

  
 if ( mousePressed ) {
    button = false;
  } else { 
    button = true;
  }
  
  if (button) {
    background(mouseX,bR,bG,bB);
  } else {
    background(0); 
  
    //flowers
    fill(87,130,90);
    ellipse(grass-25,grass-25,grassW-4,grass-5);
    ellipse(grass-23,grass-25,grassW-5,grass-66);
    ellipse(grass-30,grass-25,grassW-4,grass-24);
    ellipse(grass-32,grass-25,grassW-2,grass-40);
    
    ellipse(grass-76,grass-33,grassW-5,grass-45);
    ellipse(grass-77,grass-44,grassW-3,grass-49);
    ellipse(grass-73,grass-55,grassW-3,grass-55);
    ellipse(grass-88,grass-77,grassW-3,grass-54);
    
    ellipse(grass-76,grass-33,grassW-5,grass-45);
    ellipse(grass-77,grass-44,grassW-3,grass-49);
    ellipse(grass-73,grass-55,grassW-3,grass-55);
    ellipse(grass-88,grass-77,grassW-3,grass-54);
    
    ellipse(grass-76,grass-90,grassW-5,grass-45);
    ellipse(grass-77,grass-70,grassW-3,grass-49);
    ellipse(grass-73,grass-81,grassW-3,grass-55);
    ellipse(grass-88,grass-44,grassW-3,grass-54);
    
    ellipse(grass-76,grass-150,grassW-5,grass-45);
    ellipse(grass-77,grass-100,grassW-3,grass-49);
    ellipse(grass-73,grass-122,grassW-3,grass-55);
    ellipse(grass-88,grass-88,grassW-3,grass-54);
    
    ellipse(grass-155,grass-71,grassW-3,grass-45);
    ellipse(grass-129,grass-88,grassW-3,grass-66);
    ellipse(grass-188,grass-99,grassW-4,grass-22);
    ellipse(grass-100,grass-95,grassW-3,grass-49);
    
    ellipse(grass-75,grass-88,grassW-3,grass-45);
    ellipse(grass-87,grass-84,grassW-3,grass-52);
    ellipse(grass-33,grass-52,grassW-4,grass-55);
    ellipse(grass-54,grass-33,grassW-3,grass-50);
    
    ellipse(grass-30,grass-88,grassW-3,grass-45);
    ellipse(grass-90,grass-84,grassW-3,grass-52);
    ellipse(grass-110,grass-52,grassW-4,grass-55);
    ellipse(grass-196,grass-33,grassW-3,grass-50);
  }
 
  
  ladybug();
  
}

void ladybug() {

 //head
  fill(0);
  ellipse(mouseX,mouseY-55,bugHead,bugHead);
  
  //antenna
  stroke(0);
  strokeWeight(1);
  line(mouseX-10,mouseY-70,pmouseX-27,pmouseY-80);
  line(mouseX+10,mouseY-70,pmouseX+27,pmouseY-80);
 
 
  //body
  stroke(0);
  strokeWeight(3);
  fill(255,0,0);
  ellipse(mouseX,mouseY,bugBody,bugBody+10);
  
  //stripe
  line(mouseX,mouseY-55,mouseX,mouseY+54);
  
  //spots
  noStroke();
  fill(0);
    //middle spots
  ellipse(mouseX+15,mouseY+5,spots,spots);
  ellipse(mouseX-15,mouseY+5,spots,spots);
    //top layer spots
  ellipse(mouseX+35,mouseY-25,spots,spots);
  ellipse(mouseX-35,mouseY-25,spots,spots);
    //bottom layer spots
  ellipse(mouseX+30,mouseY+35,spots,spots);
  ellipse(mouseX-30,mouseY+35,spots,spots);
  
// yellow spots if key is pressed
  
    if ( keyPressed ) {
    button = true;
  } else { 
    button = false;
  }
  
  
  if (button) {
    noStroke();
    fill(yellowR,yellowG,yellowB);
    //body
    ellipse(mouseX,mouseY,bugBody,bugBody+10);
    
    //stripe
    stroke(0);
    line(mouseX,mouseY-55,mouseX,mouseY+54);
      //middle spots
    fill(0);
    ellipse(mouseX+15,mouseY+5,spots,spots);
    ellipse(mouseX-15,mouseY+5,spots,spots);
      //top layer spots
    ellipse(mouseX+35,mouseY-25,spots,spots);
    ellipse(mouseX-35,mouseY-25,spots,spots);
      //bottom layer spots
    ellipse(mouseX+30,mouseY+35,spots,spots);
    ellipse(mouseX-30,mouseY+35,spots,spots);
  
  }
  
//random spot colors occur when mouse is pressed
  
    if ( mousePressed ) {
    button = true;
  } else { 
    button = false;
  }
  
  
  if (button) {
        noStroke();
    fill(random(0,255));
      //middle spots
    ellipse(mouseX+15,mouseY+5,spots,spots);
    ellipse(mouseX-15,mouseY+5,spots,spots);
      //top layer spots
    ellipse(mouseX+35,mouseY-25,spots,spots);
    ellipse(mouseX-35,mouseY-25,spots,spots);
      //bottom layer spots
    ellipse(mouseX+30,mouseY+35,spots,spots);
    ellipse(mouseX-30,mouseY+35,spots,spots);
  
  } 
    
  }
