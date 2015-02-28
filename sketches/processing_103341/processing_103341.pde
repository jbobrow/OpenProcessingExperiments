
// Credit: Ren Ervin Bettendorf 

void setup(){
  size(600,500); // sets size
  background(0); // sets background color 
  frameRate(60); // sets how many balls are seen per second
}

int dx = 2; // speed
int dy = 3; // speed

int x = 50; // bounces off edge
int y = 50; // bounces off edge

void draw(){
    fill(255);
    ellipse (x,y,25,25);
  
    x = x + dx;
    y = y + dy;
    
    if ( x< 0 || x > 475){
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){
       dy = -1 * dy;  
    }
    if (mousePressed == true){
  
    x = mouseX + dx;
    y = mouseY + dy;
  size(600,500); // sets size  
  background(0); // sets background color
  frameRate(60); // sets how many balls are seen per second


x = x + dx;
y = y + dy;
    
    if ( x< 0 || x > 475){
       dx = mouseX * dx;
    }
    
    if ( y < 0 || y > 475){
       dy = mouseY * dy;
    
}
}
}
