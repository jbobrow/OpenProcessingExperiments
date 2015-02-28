
int setX = int(random(30,150));
int setY = int(random(200, 400));
int prevSetX;
int prevSetY;

int usX = int(random (150, 300));
int usY = int(random(200, 400));
int prevUsX;
int prevUsY;

int freeX = int(random(300, 415));
int freeY = int(random(200, 400));
int prevFreeX;
int prevFreeY;

PFont fontArial;
PFont fontLucida;

void setup(){
  size(500,500);
  background(40, 95, 80);
  noStroke();
  fontArial = loadFont("Arial-Black-36.vlw");
  fontLucida = loadFont("LucidaBright-Italic-36.vlw");
}
void draw(){
  //If the mouse goes off the edge, the word will try to escape
  // at that point and bounce at the edge.
  //If the mouse stays still on the screen and the word
  // reaches it, the word will bounce against the mouse.
  background(40,95,80);
  
   //This is for the word SET
  textFont(fontArial);
  fill(211, 162, 36);
  text("Set", setX, setY);
  
  //If the mouse has not stopped
  if(pmouseX != mouseX && pmouseY != mouseY) {
  
  //And if the word is not at the edge, it will simply
  //follow the mouse

    if((setX > 1 && setX < 433) && (setY > 30 && setY < 498)) {
     if (setX < mouseX){
     prevSetX = setX;
     setX ++;
     }
     if(setX > mouseX){
     prevSetX = setX;
     setX --;
     }
     if (setY < mouseY){
     prevSetY = setY;
     setY ++;
     }
     if (setY > mouseY){
     prevSetY = setY;
     setY --;
     }
    }
    //End of word not at edge
    //If the word goes to the edge, it will keep going along the edge
    //for x
    if(setX == 1){
     if(setX > mouseX){
      prevSetX = setX;
      setX = 2;
     }
     if(setX < mouseX){
      prevSetX = setX;
      setX++;
     }
    }
    if(setX == 433){
     if(setX < mouseX){
      prevSetX = setX;
      setX = 432;
     }
    if(setX > mouseX){
     prevSetX = setX;
     setX--;
    } 
    }
    //for y
     if(setY == 30){
     if(setY > mouseY){
      prevSetY = setY;
      setY = 31;
     }
     if(setY < mouseY){
      prevSetY = setY;
      setY++;
     }
     }
    if(setY == 498){
     if(setY < mouseY){
      prevSetY = setY;
      setY = 497;
     }
    if(setY > mouseY){
     prevSetY = setY;
     setY--;
    } 
  }
  }
  //end of complete if statement for moving mouse

//If the mouse has stopped within the buffer zone (30px),
//but the word has not yet reached it,
//the same loop as above should run, without need for statements about the edge
 if((pmouseX == mouseX && pmouseY == mouseY) && (mouseX > 30 && mouseX < 403) && (mouseY > 60 && mouseY < 468) && ((setX != mouseX) || (setY != mouseY))) {
  
  //Word follows the mouse
  
     if (setX < mouseX){
     prevSetX = setX;
     setX++;
     }
     if(setX > mouseX){
     prevSetX = setX;
     setX--;
     }
     if (setY < mouseY){
     prevSetY = setY;
     setY++;
     }
     if (setY > mouseY){
     prevSetY = setY;
     setY--;
     }
  }
//end of complete if statement for word chasing stopped mouse within buffer

//If the mouse stops within the buffer zone and the word reaches it,
//the word bounces
if((pmouseX == mouseX) && (pmouseY == mouseY) && (mouseX > 30) && (mouseX < 403) && (mouseY > 60) && (mouseY < 468) && (setX == mouseX) && (setY == mouseY)) {
//BOUNCING CODE FOR MIDDLE OF SCREEN
  //if the word's going right, it will jump left 10 px
  //note that this is acting wonky
  if(prevSetX < setX){
    setX -= 10;
  }
  //if the word's going left, it will jump right 10 px
  if(prevSetX > setX){
    setX += 10;
  }
  //if the word's going down, it will jump up 10 px
  if(prevSetY < setY){
    setY -= 10;
  }
  //if the word's going up, it will jump down 10 px
  if(prevSetY > setY){
    setY += 10;
  }
}
//end of complete if statement for word catching stopped mouse within buffer

//if the mouse stops outside the buffer zone and the word can reach it,
//word will do so and bounce outwards

if(((pmouseX == mouseX) && (pmouseY == mouseY)) && ((mouseX <= 30) || (mouseX >= 403) || (mouseY <= 60) || (mouseY >= 468))){

//if the word hasn't reached the edge, it will follow the mouse
//(same loop as above)
  if(setX > 1 && setX < 433){
    if(setX < mouseX){
      prevSetX = setX;
      setX++;
    }
    if(setX > mouseX){
      prevSetX = setX;
      setX--;
    }
    //when the word reaches the mouse outside the buffer (but within its boundary),
    //it bounces back into the square
    if(setX == mouseX && setX <= 30){
      setX += 10;
    }
    if(setX == mouseX && setX >= 403){
      setX -= 10;
    }      
  }
  if(setY > 30 && setY < 498){
    if(setY < mouseY){
      prevSetY = setY;
      setY++;
    }
    if(setY > mouseY){
      prevSetY = setY;
      setY--;
    }
    if(setY == mouseY && setY <= 60){
      setY += 10;
    }
    if(setY == mouseY && setY >=468){
      setY -=10;
    }
  }
    //if the word reaches the edge and the mouse is out of reach
    //the word will jump back 10 px 
    if(setX == 1 && mouseX <= 1){
      setX = 10;
    }
    if(setX == 433 && mouseX >= 433){
      setX = 423;
    }
    if(setY == 30 && mouseY < 30){
      setY = 40;
    }
    if(setY == 498 && mouseY >= 498){
      setY = 488;
  }
}

//THIS IS FOR THE WORD US
fill(214, 84, 48);
  text("us", usX, usY);
  
  //If the mouse has not stopped
  if(pmouseX != mouseX && pmouseY != mouseY) {
  
  //And if the word is not at the edge, it will simply
  //follow the mouse

    if((usX > 1 && usX < 452) && (usY > 20 && usY < 498)) {
     if (usX < mouseX){
     prevUsX = usX;
     usX += 2;
     }
     if(usX > mouseX){
     prevUsX = usX;
     usX -= 2;
     }
     if (usY < mouseY){
     prevUsY = usY;
     usY += 2;
     }
     if (usY > mouseY){
     prevUsY = usY;
     usY -= 2;
     }
    }
    //End of word not at edge
    //If the word goes to the edge, it will keep going along the edge
    //for x
    if(usX <= 1){
     if(usX > mouseX){
      prevUsX = usX;
      usX = 3;
     }
     if(usX < mouseX){
      prevUsX = usX;
      usX += 2;
     }
    }
    if(usX >= 452){
     if(usX < mouseX){
      prevUsX = usX;
      usX = 450;
     }
    if(usX > mouseX){
     prevUsX = usX;
     usX -= 2;
    } 
    }
    //for y
     if(usY <= 20){
     if(usY > mouseY){
      prevUsY = usY;
      usY = 22;
     }
     if(usY < mouseY){
      prevUsY = usY;
      usY += 2;
     }
     }
    if(usY >= 498){
     if(usY < mouseY){
      prevUsY = usY;
      usY = 496;
     }
    if(usY > mouseY){
     prevUsY = usY;
     usY -= 2;
    } 
  }
  }
  //end of complete if statement for moving mouse

//If the mouse has stopped within the buffer zone (30px),
//but the word has not yet reached it,
//the same loop as above should run, without need for statements about the edge
 if((pmouseX == mouseX && pmouseY == mouseY) && (mouseX > 30 && mouseX < 422) && (mouseY > 50 && mouseY < 468) && ((usX != mouseX) || (usY != mouseY))) {
  
  //Word follows the mouse
  
     if (usX < mouseX){
     prevUsX = usX;
     usX++;
     }
     if(usX > mouseX){
     prevUsX = usX;
     usX--;
     }
     if (usY < mouseY){
     prevUsY = usY;
     usY++;
     }
     if (usY > mouseY){
     prevUsY = usY;
     usY--;
     }
  }
//end of complete if statement for word chasing stopped mouse within buffer

//If the mouse stops within the buffer zone and the word reaches it,
//the word bounces
if((pmouseX == mouseX) && (pmouseY == mouseY) && (mouseX > 30) && (mouseX < 422) && (mouseY > 50) && (mouseY < 468) && (usX == mouseX) && (usY == mouseY)) {
//BOUNCING CODE FOR MIDDLE OF SCREEN
  //this code still acting wonky
  //if the word's going right, it will jump left 15 px
  if(prevUsX < usX){
    usX -= 15;
  }
  //if the word's going left, it will jump right 15 px
  if(prevUsX > usX){
    usX += 15;
  }
  //if the word's going down, it will jump up 15 px
  if(prevUsY < usY){
    usY -= 15;
  }
  //if the word's going up, it will jump down 15 px
  if(prevUsY > usY){
    usY += 15;
  }
}
//end of complete if statement for word catching stopped mouse within buffer

//if the mouse stops outside the buffer zone and the word can reach it,
//word will do so and bounce outwards

if(((pmouseX == mouseX) && (pmouseY == mouseY)) && ((mouseX <= 30) || (mouseX >= 422) || (mouseY <= 50) || (mouseY >= 468))){

//if the word hasn't reached the edge, it will follow the mouse
//(same loop as above)
  if(usX > 1 && usX < 452){
    if(usX < mouseX){
      prevUsX = usX;
      usX++;
    }
    if(usX > mouseX){
      prevUsX = usX;
      usX--;
    }
    //when the word reaches the mouse outside the buffer (but within its boundary),
    //it bounces back into the square
    if(usX == mouseX && usX <= 30){
      usX += 15;
    }
    if(usX == mouseX && usX >= 422){
      usX -= 15;
    }      
  }
  if(usY > 20 && usY < 498){
    if(usY < mouseY){
      prevUsY = usY;
      usY++;
    }
    if(usY > mouseY){
      prevUsY = usY;
      usY--;
    }
    if(usY == mouseY && usY <= 50){
      usY += 15;
    }
    if(usY == mouseY && usY >=468){
      usY -=15;
    }
  }
    //if the word reaches the edge and the mouse is out of reach
    //the word will jump back 15 px 
    if(usX == 1 && mouseX <= 1){
      usX = 15;
    }
    if(usX == 452 && mouseX >= 452){
      usX = 437;
    }
    if(usY == 20 && mouseY < 20){
      usY = 35;
    }
    if(usY == 498 && mouseY >= 498){
      usY = 483;
  }
}
//THIS IS FOR THE WORD FREE
  textFont(fontLucida);
  fill(137, 167, 61);
  text("free!", freeX, freeY);
  
  //If the mouse has not stopped
  if(pmouseX != mouseX || pmouseY != mouseY) {
  
  //And if the word is not at the edge, it will simply
  //follow the mouse

    if((freeX > 1 && freeX < 415) && (freeY > 32 && freeY < 490)) {
     if (freeX < mouseX){
     prevFreeX = freeX;
     freeX += 3;
     }
     if(freeX > mouseX){
     prevFreeX = freeX;
     freeX -= 3;
     }
     if (freeY < mouseY){
     prevFreeY = freeY;
     freeY += 3;
     }
     if (freeY > mouseY){
     prevFreeY = freeY;
     freeY -= 3;
     }
    }
    //End of word not at edge
    //If the word goes to the edge, it will keep going along the edge
    //for x
    if(freeX <= 1){
     if(freeX > mouseX){
      prevFreeX = freeX;
      freeX = 4;
     }
     if(freeX < mouseX){
      prevFreeX = freeX;
      freeX += 3;
     }
    }
    if(freeX >= 415){
     if(freeX < mouseX){
      prevFreeX = freeX;
      freeX = 412;
     }
    if(freeX > mouseX){
     prevFreeX = freeX;
     freeX -= 3;
    } 
    }
    //for y
     if(freeY <= 32){
     if(freeY > mouseY){
      prevFreeY = freeY;
      freeY = 35;
     }
     if(freeY < mouseY){
      prevFreeY = freeY;
      freeY += 3;
     }
     }
    if(freeY >= 490){
     if(freeY < mouseY){
      prevFreeY = freeY;
      freeY = 487;
     }
    if(freeY > mouseY){
     prevFreeY = freeY;
     freeY -= 3;
    } 
  }
  }
  //end of complete if statement for moving mouse

//If the mouse has stopped within the buffer zone (30px),
//but the word has not yet reached it,
//the same loop as above should run, without need for statements about the edge
 if((pmouseX == mouseX && pmouseY == mouseY) && (mouseX > 30 && mouseX < 385) && (mouseY > 62 && mouseY < 460) && ((freeX != mouseX) || (freeY != mouseY))) {
  
  //Word follows the mouse
  
     if (freeX < mouseX){
     prevFreeX = freeX;
     freeX++;
     }
     if(freeX > mouseX){
     prevFreeX = freeX;
     freeX--;
     }
     if (freeY < mouseY){
     prevFreeY = freeY;
     freeY++;
     }
     if (freeY > mouseY){
     prevFreeY = freeY;
     freeY--;
     }
  }
//end of complete if statement for word chasing stopped mouse within buffer

//If the mouse stops within the buffer zone and the word reaches it,
//the word bounces
if((pmouseX == mouseX) && (pmouseY == mouseY) && (mouseX > 30) && (mouseX < 385) && (mouseY > 62) && (mouseY < 460) && (freeX == mouseX) && (freeY == mouseY)) {
//BOUNCING CODE FOR MIDDLE OF SCREEN
  //this code still acting wonky
  //if the word's going right, it will jump left 13 px
  if(prevFreeX < freeX){
    freeX -= 13;
  }
  //if the word's going left, it will jump right 13 px
  if(prevFreeX > freeX){
    freeX += 13;
  }
  //if the word's going down, it will jump up 13 px
  if(prevFreeY < freeY){
    freeY -= 13;
  }
  //if the word's going up, it will jump down 13 px
  if(prevFreeY > freeY){
    freeY += 13;
  }
}
//end of complete if statement for word catching stopped mouse within buffer

//if the mouse stops outside the buffer zone and the word can reach it,
//word will do so and bounce outwards

if(((pmouseX == mouseX) && (pmouseY == mouseY)) && ((mouseX <= 30) || (mouseX >= 385) || (mouseY <= 62) || (mouseY >= 460))){

//if the word hasn't reached the edge, it will follow the mouse
//(same loop as above)
  if(freeX > 1 && freeX < 415){
    if(freeX < mouseX){
      prevFreeX = freeX;
      freeX++;
    }
    if(freeX > mouseX){
      prevFreeX = freeX;
      freeX--;
    }
    //when the word reaches the mouse outside the buffer (but within its boundary),
    //it bounces back into the square
    if(freeX == mouseX && freeX <= 30){
      freeX += 13;
    }
    if(freeX == mouseX && freeX >= 385){
      freeX -= 13;
    }      
  }
  if(freeY > 32 && freeY < 490){
    if(freeY < mouseY){
      prevFreeY = freeY;
      freeY++;
    }
    if(freeY > mouseY){
      prevFreeY = freeY;
      freeY--;
    }
    if(freeY == mouseY && freeY <= 62){
      freeY += 13;
    }
    if(freeY == mouseY && freeY >=460){
      freeY -= 13;
    }
  }
    //if the word reaches the edge and the mouse is out of reach
    //the word will jump back 13 px 
    if(freeX <= 1 && mouseX <= 1){
      freeX = 13;
    }
    if(freeX >= 415 && mouseX >= 415){
      freeX = 402;
    }
    if(freeY <= 32 && mouseY <= 32){
      freeY = 45;
    }
    if(freeY >= 490 && mouseY >= 490){
      freeY = 477;
  }
}

//closing bracket for void draw statement
}



