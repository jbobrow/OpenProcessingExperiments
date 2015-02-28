
            
int x;
int y;

int directionx;
int directiony;


void setup(){
  size(800,450);
  x=0;
  y=0;
  directionx=1;
  directiony=1;

}

void draw(){
  background(mouseX);
  x += directionx;
  y += directiony;

  if(y>450){
    fill(random(300), random(3), random(255));
    directiony=-1;

  }
  
  if(x>800){
    directionx=-1;
    
  }
 
  if(y<0){
    directiony=1;
    
  }
  
  
  if(x<0){
    directionx=1;
    
  }
   
ellipse(mouseX,mouseY,10,10);


  
rect(140,140,170,170);
fill(204);
rect(150,150, 170, 170);
fill(153);
rect(160,160,180,180);
fill(102);
rect(170, 170, 180, 180);

}
                
