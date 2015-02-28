
Star[] stars;
Star rectBG;
void setup() {
 size(480,480);
  
    rectBG = new Star(color(0), color(0), color(0), 240,240);
    stars = new Star[400]; //number of stars created
    for(int i = 0; i < stars.length; i++) {
        stars[i] = new Star(color(0), color(0), color(0), random(-450,700), random(-450,700));
    }
}

void draw() {
  
  rectBG.flicker();
  rectBG.displayBackground();
  
// (start) assigns Color-Flashing Scheme, and adds movement   
     for(int i = 0; i < stars.length/5; i++) {
        stars[i].move();
        stars[i].flicker();
        stars[i].display();
    }
    
    for(int i = stars.length/5; i < (stars.length/5)*2; i++) {
        stars[i].move();
        stars[i].flicker();
        stars[i].display2();
    }
    
    for(int i = (stars.length/5)*2; i < (stars.length/5)*3; i++) {
        stars[i].move();
        stars[i].flicker();
        stars[i].display3();
    }
    
    for(int i = (stars.length/5)*3; i < (stars.length/5)*4; i++) {
        stars[i].move();
        stars[i].flicker();
        stars[i].display4();
    }
    
    for(int i = (stars.length/5)*4; i < stars.length; i++) {
        stars[i].move();
        stars[i].flicker();
        stars[i].display5();
    }
  // (end)    
}


class Star {
  
  float[] rArray = new float[3];
  float a, c, d, e;
  float xpos;
  float ypos;
  float rSize = random(89) + (random(100)/100)+1;
    
  Star(color tempC, color tempD, color tempE, float tempXpos, float tempYpos) { 
  
    a = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
 }

void display() {
  stroke(c/2, d/2, e/2);
    fill(c, d, e);
    rectMode(CENTER);
    rect(xpos,ypos,rSize,rSize);
 }

void display2() {
  stroke(d/2, c/2, e/2);
    fill(d, c, e);
    rectMode(CENTER);
    rect(xpos,ypos,rSize,rSize);
 }

void display3() {
  stroke(c/2, e/2, d/2);
    fill(c, e, d);
    rectMode(CENTER);
    rect(xpos,ypos,rSize,rSize);
}

void display4() {
  stroke(e/2, d/2, c/2);
    fill(e, d, c);
    rectMode(CENTER);
    rect(xpos,ypos,rSize,rSize);
}

void display5() {
  stroke(e/2, c/2, d/2);
    fill(e, c, d);
    rectMode(CENTER);
    rect(xpos,ypos,rSize,rSize);
 }

void displayBackground() {
  stroke(0);
    fill(c/1.4, d/1.4, e/1.4);
    rectMode(CENTER);
    rect(xpos,ypos,width+1, height+1);
}

void move(){
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      xpos= xpos + (rSize / 17);
     }
    else if (key == 'a' || key == 'A'){
      xpos= xpos - (rSize / 17);
     }
     else if (key == 'w' || key == 'W'){
      ypos= ypos - (rSize / 17);
     }
     
     else if (key == 's' || key == 'S'){
      ypos= ypos + (rSize / 17);
     }
     
   }
}

void flicker () {
  
  rArray[0] = 3;
  rArray[1] = 5;
  rArray[2] = 17;
    
  if (c + rArray[0] > 255){
    c = 0; 
  }
  else{
    c= c + rArray[0];
  }
  
  if (d + rArray[1] > 255){
    d = 0; 
  }
  else{
    d= d + rArray[1];
  }
  
  if (e + rArray[2] > 255){
    e = 0; 
  }
  else{
    e = e + rArray[2];
   }
  
 
  }

}
