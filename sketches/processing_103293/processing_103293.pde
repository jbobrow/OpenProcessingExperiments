
// Credit: Ren Ervin Bettendorf 
//Nadav Hardof 
//7/9/13
//project: make the screen saver as said..

/* SCREENSAVERS FER DAYS BROSKIES */
void setup(){
  size(600,500);  
  background(255, 150,0);
  frameRate(60);
}

int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

void draw(){
    fill(0, 0, 200);
    ellipse( x,y,25,25 );
  
    x = x + dx;
    y = y + dy;
    
    if ( x< 0 || x > 475){
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){
       dy = -1 * dy;  
    }


if(mousePressed == true); {
fill(0,200,0); }
}

