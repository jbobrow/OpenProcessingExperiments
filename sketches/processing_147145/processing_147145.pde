
PImage img;
PImage menu;

float r=0;
float g=100;
float b=100;

float opacity;
float dia=50;
int buttonSize=(width/32);

boolean eraser= false;
boolean circles=true;
boolean squares=false;

void setup(){
  size(800,650);
  background(17,5,52);
  smooth();
  menu= loadImage("menu.png");
 
 /*noStroke();
 fill(17,5,52);
  rect(0,800,50,800);
  fill(255,200);
  ellipse(50,50,buttonSize,buttonSize);*/
}

void draw(){
  image(menu,0,0);
  
  
  erase();
}
void mouseClicked(){
  if(mouseX>50 && mouseX<85 && mouseY>10 && mouseY<45){
  // circles=!circles;
  squares=false;
  circles=true;
//  makeCircle();

  
    }
    else if(mouseX>225 && mouseX<260 && mouseY>10 && mouseY<45){
      //eraser=!eraser;
      circles=false;
      squares=true;
     
     //  makeSquares();
      
    }
    else if(mouseY<50){
    opacity=0;
    }
    else if (mouseX>690 && mouseX<750 && mouseY>10 && mouseY<45){
    saveDrawing();
    
  }   
    
  else{
//  makeShapes();
  }

  
  
  makeShapes();
}



void saveDrawing() {
 fill(255);
 noStroke();
 rect(800,500,width,height/16);
 
  saveFrame("images/circles-###.png"); //it should open the image in a new tab on web
 }
 
void makeShapes(){
 

  
  callColor();
 if(circles){
   makeCircle();
 }
 if(squares){
  makeSquares();
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
   rect(mouseX, height-mouseY-50, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
   rect(width-mouseX,mouseY,dia,dia);
   rect(width-mouseX, height-mouseY, dia,dia);
}

void erase (){
   eraseColor();
 if(eraser){
  drawEraser();
 }
 else{

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




