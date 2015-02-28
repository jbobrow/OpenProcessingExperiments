
PImage buildPhoto1; // declares image
PImage aptPict1; // declares image
int xPict, yPict, border, pictWidth, pictHeight;  //declares x and y of picture, and border thickness variables
float xButton1, yButton1, buttonWidth, buttonHeight;
boolean button_pressed;


void setup() {
  size (600,480); // sets the size of the screen
  imageMode(CENTER); // sets the image to read from the center
  yPict = height/2;
  xPict = width/2;
  pictWidth = 3000;
  pictHeight = 1200;
  border = 50;
  buttonWidth = 50;
  buttonHeight = 50;
  xButton1 = 300 - buttonWidth/2;
  yButton1 = 600 - buttonHeight/2;
  buildPhoto1 = loadImage("panorama.jpg");
   aptPict1 = loadImage("drunk.png"); // loads the image from data folder
}

void draw() {
  
  image(buildPhoto1,xPict,yPict); //places image with variable x and y
   stroke(255,0,0);
   if ( button_pressed ){
    image(aptPict1,xButton1,yButton1);
  } else { 
    noFill();
  }
  rect(xButton1, yButton1, buttonWidth, buttonHeight,10,10,10,10);
  
  if ( !button_pressed ){
    fill(255,0,0);
  } else { 
    noFill();
  }
  
  //starts the image scroll both up and down
  if (mouseX< border){ //if mouse is in the border move image 3 right
   xPict = xPict+3;
   xButton1 = xButton1+3;
   }
   if (mouseX > width-border){//if mouse is in the border move image 3 left
   xPict = xPict-3;
   xButton1 = xButton1-3;
   } 
   if (mouseY< border){ //if mouse is in the border move image 3 down
   yPict = yPict+3;
   yButton1 = yButton1+3;
   }
   if (mouseY> height-border){ //if mouse is in the border move image 3 up
   yPict = yPict-3;
   yButton1 = yButton1-3;
   }
   //stops the scroll a the end of file
   if (xPict < -900){ //right of the image
    xPict = -900;
   }
   if (xPict > pictWidth/2){ // left limit of the image
    xPict = pictWidth/2;
   }
   if (yPict < -100){ //top of the image
   yPict = -100;
   }
   if (yPict > pictHeight/2){ // top limit of the image
    yPict = pictHeight/2;
   }
   //border
   stroke (0);
   fill (0);
   rect (0,0,width, border);//top
   rect (0,0, border, width);//right
   rect (width-border,0,height-border, width);//left
   rect (0,height-border, width, border);//bottom
   
   //println (xPict); //line for testing x and y limits

}

void mousePressed(){
  println("Mouse have been Pressed");
  if ( (mouseX > xButton1) && (mouseX < xButton1+buttonWidth) &&
      (mouseY > yButton1) && (mouseY < yButton1+buttonHeight)) {
        button_pressed = !button_pressed;
    }
}

//void mouseDragged(){
  //if ( (mouseX > xButton1) && (mouseX < xButton1+buttonWidth) &&
    //  (mouseY > yButton1) && (mouseY < yButton1+buttonHeight)) {
        
      //  xButton1 = mouseX - buttonWidth*0.5;
      //  yButton1 = mouseY - buttonHeight*0.5;
 //  }
//}






