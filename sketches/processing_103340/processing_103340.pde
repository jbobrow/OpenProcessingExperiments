
//



void setup(){
  size(500,500); 
  background(0);
  frameRate(60);
}

int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

void draw(){
    fill(255);
    ellipse(x,y,25,25);
  
    x = x + dx;
    y = y + dy;
    
    if ( x< 0 || x > 475){
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){
       dy = -1 * dy;  
    }
    
    if (mousePressed==true)
   { x=mouseX;
     y=mouseY;
     background (0);}

}
