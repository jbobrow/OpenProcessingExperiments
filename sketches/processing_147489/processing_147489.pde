
PVector redLoc = new PVector(50,100);
PVector blueLoc = new PVector(50,200);
float radius = 30;
float lastX, lastY; //test

void setup() {
    size(500,400);
    background(255);
    stroke(0);
    fill(0);
    strokeWeight(5);
    textSize(24);
    text("Simple Paint",20,40);  
    
    //red color selector
    fill(255,0,0);
    ellipse(redLoc.x, redLoc.y,radius*2,radius*2);
    
    //blue color selector
    fill(0,0,255);
    ellipse(blueLoc.x, blueLoc.y,60,60);
    
}

void draw() {
  if (mousePressed) {
    
    if ( clickOnColor(redLoc) ) { //click is on red:
      stroke(255,0,0);
    } else if ( clickOnColor(blueLoc) ) { //click is on blue:
      stroke(0,0,255);
    } else {
      //point(mouseX,mouseY);
      line(lastX,lastY,mouseX,mouseY);
    }
    
  } 
 
   lastX = mouseX;
   lastY = mouseY;
    
}

boolean clickOnColor(PVector colorLoc) {
  //red centered at redLoc
  PVector clickLoc = new PVector(mouseX, mouseY);
  if ( clickLoc.dist(colorLoc) <= radius ) {
    return true;
  }  
  return false;
}


