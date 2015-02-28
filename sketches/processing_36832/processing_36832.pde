
float mousex;
float mousey;
int color1=30;
int color2=30;
int color3=30;
int trans=30;
float movex=250;
float movey=250;
int speed = 4;



void setup() {  
  size(700,400);  
  background(255);
  stroke(30,30,30,30);
  strokeWeight(8);
  smooth();
}

void draw() {
  float mousex = mouseX;
  float mousey = mouseY;
  background(255);
  
  ellipse(mousex, mousey, 100, 100);
  
    
    if(movex < 0){
     fill(random(0,200), random(0,200),random(0,200),random(0,200));
    }
    if(movex > width){
     fill(random(0,200), random(0,200),random(0,200),random(0,200));
    }
    if(movey < 0){
     fill(random(0,200), random(0,200),random(0,200),random(0,200));
    }
    if(movey > height-10){
     fill(random(0,200), random(0,200),random(0,200),random(0,200));
    }
    
    
    if(movex < 0){
      movex = 100;
    }
    if(movex > width){
      movex = width - 100;
    }
    if(movey < 0){
      movey = 100;
    }
    if(movey > height - 10){
      movey = height - 100;
    }
    
    
    if (mouseX < movex   && mouseX  > movex - 80){
    movex = movex + speed;
   
    }
    if (mouseX  > movex && mouseX < movex + 80){
    movex = movex - speed;
    }
    if (mouseY < movey   && mouseY  > movey - 80){
    movey = movey + speed;
   
    }
    if (mouseY  > movey && mouseY < movey + 80){
    movey = movey - speed;
    }
    
    
    ellipse(movex, movey, 100, 100);
 if (movey>height){
     movey=0;
      if (movex>width){
     movex=0;
      }
 }
  }


void mousePressed() {
 


 
    background(255);
 
  }



