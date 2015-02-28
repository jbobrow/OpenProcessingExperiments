
boolean topLeft = false;
boolean topRight = false;
boolean bottomLeft = false;
boolean bottomRight = false;

void setup() {
size(500,500);
noStroke();
}

void draw() {
if(topLeft) {
fill(0);
rect(0,0, width/2,height/2);
} else {
fill(255);
rect(0,0, width/2,height/2);
}
  
if(topRight) {
fill(0);
rect(width/2,0, width/2,height/2);
} else {
fill(255);
rect(width/2,0, width/2,height/2);
}

if (bottomLeft) {
fill(0);
rect(0,height/2, width/2,height/2);
} else {
fill(255);
rect(0,height/2, width/2,height/2);
}

if(bottomRight) {
fill(0);
rect(width/2,height/2, width/2,height/2);
} else {
fill(255);
rect(width/2,height/2, width/2,height/2);
}
  
}

//void mousePressed() {
//if(mouseY < height/2) {
//  //top
//  if (mouseX < width/2){
//    //
//}
//}

void mouseMoved() {
//topleft
  if ((mouseX<width/2) && (mouseY<height/2)) {
topLeft = true;
topRight = false;
bottomLeft = false;
bottomRight = false;
} 
//topright
  if ((mouseX>width/2) && (mouseY<height/2)) {
topLeft = false;
topRight = true;
bottomLeft = false;
bottomRight = false;
}
//bottomLeft
  if ((mouseX<width/2) && (mouseY>height/2)) {
topLeft = false;
topRight = false;
bottomLeft = true;
bottomRight = false;
}
//bottomRight
  if ((mouseX>width/2) && (mouseY>height/2)) {
topLeft = false;
topRight = false;
bottomLeft = false;
bottomRight = true;
}
}


//if(mouseY<(height/2)){
//
//    if(mouseX<(width/2)); {
//      fill(0);
//      rect(0,0,(width/2),(height/2));
//      } else {
//      fill(0);
//      rect((width/2),0,(width/2),(height/2));
//    } 
//    
//}else{
// 
//    if(mouseX<(width/2)); {
//      fill(0);
//      rect(0,(height/2),(width/2),(height/2));
//      
//      } else {
//
//      fill(0);
//      rect((width/2),(height/2),(width/2),(height/2));
//    }
//  
//}






