
PImage photo;
//float rect_length = 0;
boolean clicked = false;
boolean clicked2 = false;
int phase;
Path myPath;
boolean pathStarted= false;


void setup() {

  photo = loadImage("small.png");
  size(1176, 786);

  image(photo, 0, 0, 2000/1.7,1337/1.7);
}

void draw() {

if (pathStarted==true){
   myPath.draw();
  // println("test");
   
   
}


 
}

void mousePressed() {

  //if (phase == 0) {
    if (mouseX >= 280/1.7 && mouseX <= 340/1.7 && mouseY >=580/1.7 && mouseY <= 650/1.7) {
      clicked = true;
      //scale(0.5);
     // image(photo, 0, 0, 2000/1.7,1337/1.7);
      //Create path starting from this x and y location
      myPath = new Path(new PVector(310/1.7, 615/1.7));
      pathStarted=true;
    }


  if (mouseX >= 280/1.7 && mouseX <= 340/1.7 && mouseY >=390 && mouseY <= 430) {
      clicked = true;
      myPath = new Path(new PVector(310/1.7, 402));
      pathStarted=true;
    }
    
    
     if (mouseX >= 280/1.7 && mouseX <= 340/1.7 && mouseY >=431 && mouseY <= 471) {
      clicked = true;
      myPath = new Path(new PVector(310/1.7, 443));
      pathStarted=true;
    }
    
    
    
    if (mouseX >= 280/1.7 && mouseX <= 340/1.7 && mouseY >=471 && mouseY <= 511) {
      clicked = true;
      myPath = new Path(new PVector(310/1.7, 483));
      pathStarted=true;
    }
    
    
    if (mouseX >= 280/1.7 && mouseX <= 340/1.7 && mouseY >=511 && mouseY <= 551) {
      clicked = true;
      myPath = new Path(new PVector(310/1.7, 523));
      pathStarted=true;
    }
    
    
    if (mouseX >= 280/1.7 && mouseX <= 340/1.7 && mouseY >=552 && mouseY <= 592) {
      clicked = true;
      myPath = new Path(new PVector(310/1.7, 560));
      pathStarted=true;
    }
  //}
  
  
  //phase 2
//  if (mouseX >= 248 && mouseX <= 263 && mouseY >=232 && mouseY <= 247) {
//      clicked2 = true;
//      //scale(0.5);
//     // image(photo, 0, 0, 2000/1.7,1337/1.7);
//      //Create path starting from this x and y location
//      myPath = new Path(new PVector(310/1.7, 615/1.7));
//      pathStarted=true;
//    }

  
}

class Path {
  PVector pathStart;
  PVector currentLoc;
  float stroke_length=0;
  float stroke_verti=0;



  Path(PVector _pathStart) {
    pathStart = _pathStart;
    //currentLoc = new PVector(0, 0);
   
  }

  void draw() {

    //start phase 0
    //if (phase==0) {
      // draw lines
      noFill();
      stroke(255, 255, 0);
      strokeWeight(3);
      ellipse(pathStart.x+6, pathStart.y+6, 40, 40);
      
      
      
      
     if (mousePressed == true && mouseX >= 248 && mouseX <= 263 && mouseY >=231 && mouseY <= 245) {
       
    
      stroke(255,255,0);
      strokeWeight(3);
      noFill();
       ellipse(257,238,20,20);
       noStroke();
       fill(255,255,0);
  rect(pathStart.x+92, pathStart.y+5,6,-62);
  rect(pathStart.x+98, pathStart.y-57, stroke_verti, 5);
    stroke_verti = stroke_verti+1.5;
    if (stroke_verti > 117) {
      stroke_verti = 117;
}
}



  if (mousePressed == true && mouseX >= 248 && mouseX <= 263 && mouseY >=247 && mouseY <= 263) {
    
    stroke(255,255,0);
      strokeWeight(3);
      noFill();
       ellipse(257,253,20,20);
       noStroke();
       fill(255,255,0);
  rect(pathStart.x+92, pathStart.y+5,6,-22);
  rect(pathStart.x+98, pathStart.y-17, stroke_verti, 5);
    stroke_verti = stroke_verti+1.5;
    if (stroke_verti > 117) {
      stroke_verti = 117;
}
  }
  
  
  
  
  if (mousePressed == true && mouseX >= 248 && mouseX <= 263 && mouseY >=263 && mouseY <= 278) {
    
    
      stroke(255,255,0);
      strokeWeight(3);
      noFill();
       ellipse(257,270,20,20);
       noStroke();
       fill(255,255,0);
  rect(pathStart.x+92, pathStart.y+5,6,22);
  rect(pathStart.x+98, pathStart.y+20, stroke_verti, 5);
    stroke_verti = stroke_verti+1.5;
    if (stroke_verti > 117) {
      stroke_verti = 117;
}
  }
  
  
  
  if (mousePressed == true && mouseX >= 248 && mouseX <= 263 && mouseY >=278 && mouseY <= 293) {
       
      stroke(255,255,0);
      strokeWeight(3);
      noFill();
       ellipse(257,286,20,20);
      
       noStroke();
       fill(255,255,0);
  rect(pathStart.x+92, pathStart.y+5,6,60);
  rect(pathStart.x+98, pathStart.y+60, stroke_verti, 5);
    stroke_verti = stroke_verti+1.5;
    if (stroke_verti > 117) {
      stroke_verti = 117;
}
}



if (mousePressed == true && mouseX >= 369 && mouseX <= 390 && mouseY >=186 && mouseY <= 205) {
       
      stroke(255,255,0);
      strokeWeight(3);
      noFill();
       ellipse(376,193,20,20);
       noStroke();
       fill(255,255,0);
  rect(pathStart.x+210, pathStart.y+5,6,-62);
  rect(pathStart.x+210, pathStart.y-57, stroke_verti, 5);
    stroke_verti = stroke_verti+1.5;
    if (stroke_verti > 117) {
      stroke_verti = 117;
}
}
    
     drawLine(pathStart.x+23, pathStart.y+5, pathStart.x+10000, pathStart.y+10000000);
//    }
//    else if (phase ==1) {
//    }
  }

  //Draws line between two coordinates
  void drawLine(float X1, float Y1, float X2, float Y2) {
   noStroke();
  fill(255, 255, 0);

  if (clicked == true) {
    rect(pathStart.x+20, pathStart.y+1, stroke_length, 5);
    stroke_length = stroke_length+1.5;
    if (stroke_length > 80) {
      stroke_length = 80;
    }
  }
    }
    
    
//void mouseReleased() {
//  if (mouseX >= 248 && mouseX <= 263 && mouseY >=232 && mouseY <= 247) {
//  rect(pathStart.x+103, pathStart.y+5,5,-20);
//  
//  
//}
//    
//    
//}


    }
  //  line(X1, Y1, X2, Y2);

    //currentLoc = new PVector(X2, Y2);



//}



