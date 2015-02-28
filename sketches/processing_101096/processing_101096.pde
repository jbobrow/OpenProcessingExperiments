
/*
  Andri Rafn
   16.06.13
*/

int maxSnow;
int screenSizeX; 
int SizeY;
Snow[] snow1;
Snow[] snow2;
Snow[] snow3;

void setup(){
  maxSnow = 200;
  screenSizeX = 800; //Resolution variables set below.
  screenSizeY = 600;
  //Pretty much everything is dynamically set below, you can change the values above for fun.
  size(800,600);
  
  
  snow1 = new Snow[maxSnow];      //Tiny "snow".
  snow2 = new Snow[maxSnow];      //Not so tiny "snow".
  snow3 = new Snow[maxSnow / 8];  //Slightly too large "snow".  
  
  for(int i = 0; i < maxSnow; i++){
    snow1[i] = new Snow(1);
    snow2[i] = new Snow(2);    
  }  
  for(int i = 0; i < maxSnow / 8; i++)
    snow3[i] = new Snow(3);
}

void draw(){
  background(0); //Background is set to black.  
  //Renders the "snow".
  for(int i = 0; i < maxSnow; i++){
    snow1[i].render();
    snow2[i].render();
  }
  for(int i = 0; i < maxSnow / 8; i++)
    snow3[i].render();
  
  //Renders the color picker menu.
  fill(0,0,0,200);
  stroke(50);  
  rect(0, height*0.9, width, height * 0.1);
  fill(255,0,0,255);
  rect(width*0.05, height*0.925, width*0.1, height * 0.05);
  fill(0,255,0,255);
  rect(width*0.25, height*0.925, width*0.1, height * 0.05);
  fill(0,0,255,255);
  rect(width*0.45, height*0.925, width*0.1, height * 0.05);
  fill(0,255,255,255);
  rect(width*0.65, height*0.925, width*0.1, height * 0.05);
  fill(255,255,0,255);
  rect(width*0.85, height*0.925, width*0.1, height * 0.05);
  noStroke();
  
  colorSelection(); //Checks for mouse interaction with the menu.
}

void colorSelection(){
  
  //Checking if the mouse is within the boundaries of each "button", and changes the color accordingly.
  if(mouseX > width*0.05 && mouseX < width*0.05 + width*0.1 && mouseY > height*0.925 && mouseY < height*0.925 + height * 0.05) {
    for(int i = 0; i < maxSnow; i++) {
      snow1[i].changeColor(color(255,0,0,180), color(255,0,0,90));
      snow2[i].changeColor(color(255,0,0,180), color(255,0,0,90));      
    } 
    for(int i = 0; i < maxSnow / 8; i++) {
      snow3[i].changeColor(color(255,0,0,180), color(255,0,0,90)); 
    }
  }
  
  //
  if(mouseX > width*0.25 && mouseX < width*0.25 + width*0.1 && mouseY > height*0.925 && mouseY < height*0.925 + height * 0.05) {
    for(int i = 0; i < maxSnow; i++) {
      snow1[i].changeColor(color(0,255,0,180), color(0,255,0,90));
      snow2[i].changeColor(color(0,255,0,180), color(0,255,0,90));      
    } 
    for(int i = 0; i < maxSnow / 8; i++) {
      snow3[i].changeColor(color(0,255,0,180), color(0,255,0,90)); 
    }
  }
  
  //
  if(mouseX > width*0.45 && mouseX < width*0.45 + width*0.1 && mouseY > height*0.925 && mouseY < height*0.925 + height * 0.05) {
    for(int i = 0; i < maxSnow; i++) {
      snow1[i].changeColor(color(0,0,255,180), color(0,0,255,90));
      snow2[i].changeColor(color(0,0,255,180), color(0,0,255,90));      
    } 
    for(int i = 0; i < maxSnow / 8; i++) {
      snow3[i].changeColor(color(0,0,255,180), color(0,0,255,90)); 
    }
  }
  
  //
  if(mouseX > width*0.65 && mouseX < width*0.65 + width*0.1 && mouseY > height*0.925 && mouseY < height*0.925 + height * 0.05) {
    for(int i = 0; i < maxSnow; i++) {
      snow1[i].changeColor(color(0,255,255,180), color(0,255,255,90));
      snow2[i].changeColor(color(0,255,255,180), color(0,255,255,90));      
    } 
    for(int i = 0; i < maxSnow / 8; i++) {
      snow3[i].changeColor(color(0,255,255,180), color(0,255,255,90)); 
    }
  }
  
  //
  if(mouseX > width*0.85 && mouseX < width*0.85 + width*0.1 && mouseY > height*0.925 && mouseY < height*0.925 + height * 0.05) {
    for(int i = 0; i < maxSnow; i++) {
      snow1[i].changeColor(color(255,255,0,180), color(255,255,0,90));
      snow2[i].changeColor(color(255,255,0,180), color(255,255,0,90));      
    } 
    for(int i = 0; i < maxSnow / 8; i++) {
      snow3[i].changeColor(color(255,255,0,180), color(255,255,0,90)); 
    }
  }
}

//Hello OOP.
class Snow{
  //Oh so private!
  float posX, posY, sizeX, sizeY, type;
  color col;  
  color colShade;
  color mouseOverCol;
  color mouseOverColShade;
  
  Snow(int newType){ //Hello constructor.
    posX = random(0,800);
    posY = random(screenSizeY*(-0.2),screenSizeY);        
    col = color(255,255,255,180);    
    colShade = color(255,255,255, 90);
    mouseOverCol = col;
    mouseOverColShade = colShade;
    type = newType;
    
    //Default value
    sizeX = sizeY = 5;    
    
    if(type == 3) {
      sizeX = sizeY = 30;
    }
  }
  
  void move(){
    
    if(type == 3){
      posX += random(12,20);
      posY += random(5,8);
      sizeX -= 0.3;
      sizeY -= 0.3;
    } 
    else {   
      posX += random(3,4);
      posY += random(0.5,0.8);
      sizeX += 0.1;
      sizeY += 0.1;
    }
    
    if(posY > screenSizeY + sizeY || posX > screenSizeX + sizeX) {
       posY = random(screenSizeY *(-0.2),screenSizeY );
       posX = -sizeX;
       if(type == 3) {
         sizeX = sizeY = 30;         
       }
       else {
         sizeX = sizeY = 5;
       }
     }   
  }
  
  void touch(){
    if(mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY){
            col = mouseOverCol;   
            colShade = mouseOverColShade;
    } 
  }
  
  //Public functions below.
  void changeColor(color newMouseOverCol, color newMouseOverColShade){
    mouseOverCol =  newMouseOverCol;
    mouseOverColShade = newMouseOverColShade;
  }
  
  void render(){
    move();
    touch();
    if(type != 1) {
      fill(colShade);
      rect(posX-sizeX, posY-sizeY, sizeX*2 , sizeY*2);
    }
    
    fill(col);
    rect(posX, posY, sizeX , sizeY);
  }
}
