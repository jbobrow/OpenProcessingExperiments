
float r=0;
float g=100;
float b=100;

int opacity;
int dia=50;

boolean eraser= false; //setting boolean for toggling eraser
boolean circles=true; //setting boolean for toggeling squares

void setup(){
  size(800,600);
  background(17,5,52);
  smooth();
}

void draw(){
  erase();
}
void mouseClicked(){
 makeShapes();
}

void keyPressed(){
 if(key=='x'){ // when x key is pressed it switches between drawing circles and squares 
   circles=!circles;
    }
    else if(key=='z'){// when z key is pressed it switches between erasing and not erasing 
      eraser=!eraser;
    }
    else if (key=='s'){// when s key is pressed save drawing 
    saveDrawing();
  }   
    
  else{ // default makes circles 
  makeShapes();
  }
}

 function saveDrawing() {
  saveFrame("images/circles-###.png"); //it should open the image in a new tab on web
 }
 
void makeShapes(){
  callColor();
 if(circles){ // if circles are true draw circles
   makeCircle();
 }
 else{
  makeSquares(); // if circles are false draw squares 
 }
}

void callColor(){
  noStroke(); 
  fill(r,g,b,opacity);
  r=random(50,100);
g=random(20,80);
b=random(100,150);
  opacity=random(50,150);
  dia=random(10,100);  
}

void makeCircle(){
    ellipse(mouseX,mouseY,dia,dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX,mouseY,dia,dia);
  ellipse(width-mouseX, height-mouseY, dia,dia);
}

void makeSquares(){
     rectMode(CENTER);
   rect(mouseX,mouseY,dia,dia);
   rect(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
   rect(width-mouseX,mouseY,dia,dia);
   rect(width-mouseX, height-mouseY, dia,dia);
}

void erase (){
   eraseColor();
 if(eraser){ // if eraser is true, erase 
  drawEraser();
 }
 else{ // if false don't erase 

 }
}

void eraseColor(){
  noStroke ();
  fill(17,5,52,opacity);
   opacity=random(0,100);
  dia=50;
}

void drawEraser(){
  ellipse(mouseX,mouseY,dia,dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX,mouseY,dia,dia);
  ellipse(width-mouseX, height-mouseY, dia,dia);
}




