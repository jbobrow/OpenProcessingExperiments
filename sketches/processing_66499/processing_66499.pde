
int colorCounter = 10;
int squareSize = 200;
int squarePositionX =200;
int squarePositionY=200;

boolean topChanged=false;
boolean bottomChanged=false;
boolean leftChanged=false;
boolean rightChanged=false;
boolean changeable = true;

PFont Font1;
int fontPosY = 300;
int fontPosX = 280;

void setup() {
  
  size(600,600);
  background(255);
  noStroke();
  

}

void draw () {
  background(255);
  fill(0,0,0,colorCounter);
  rect(squarePositionX,squarePositionX,squareSize,squareSize);
// colorCounter=10;
  



if(mouseX>=(width/3) && mouseX<=(2*(width/3)) && mouseY>=height/3 && mouseY<=(2*(height/3))){
  changeable = true;
}
else{
  if(changeable == true){
    changeable = false;
    // code to make changes you want
    if(mouseX>0 && mouseY>0){
    squareSize +=10;
    colorCounter +=10; 
    squarePositionX -=5;
    squarePositionY -=5; 
    
    if(squarePositionX>=0 && squarePositionY>=0){
      Font1 = createFont("Helvetica", 24,true);
      textFont(Font1);
      textAlign(CENTER);
      fill(255);
      text("Hello!",fontPosX,fontPosY);
    }
      
    
    
    }
  }
}



}


//  if(mouseX<=width/3 && changed == false) {  //Leftside
//    changed = true;
//    println("left");
////    changed = true;
////    colorCounter +=10;
////    squareSize +=50;    
//  }
//
//  if(mouseX>=(2*(width/3))) {  //Right side
//      changed = true;
//
//    println("right");
//}
//
//  if(mouseY<=height/3) {  //Top
//      changed = true;
//
//        println("top");
//
//}
//  if(mouseY>=2*(width/3)) {  //Bottom
//      changed = true;
//
//        println("bottom");
//
//}

