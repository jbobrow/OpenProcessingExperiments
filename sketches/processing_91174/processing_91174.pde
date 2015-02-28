
float chomp = 1;
float start = 0.785;
float stop = 5.497;
float incr= 0.03 * chomp;
int xPos = 1;
int xCount = 3;
int yCount = 3;
int yPos = 50;


void setup(){
  size (800,600);
  noStroke();
  fill(255,255,0);
}


void draw(){ //pacman(float chomp)
  background(0);
    arc(xPos,yPos,80,80,start,stop);
    start = start - incr;
    stop = stop + incr;
    if(start <= 0 || start >=0.786){
      incr= incr*-1;
    }
      
      
      
      if( keyPressed == true){ //press a key for pacman to lower vertically 
      xPos = xPos;
      yPos = yPos + yCount; 
    if(yPos >= 600) {
    yPos = 0;
    } 
  }
       else{
       xPos = xPos + xCount; //makes pac man move
    if(xPos >= 840) {
    xPos = 0;
    }
       }
        if( mousePressed == true){ //press a key for pacman to lower vertically 
      xPos = xPos;
      yPos = yPos - yCount; 
    if(yPos <= 0) {
    yPos = 600;
    } 
  else{
      
 
     /* if( keyPressed == true){ //press a key for pacman to lower vertically 
      xPos = xPos;
      yPos = yPos + yCount; 
    if(yPos >= 600) {
    yPos = 0;
    } 
  }*/
  }
        }
}
