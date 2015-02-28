
//inspirado por el trabajo de (Marius Watz)  http://www.unlekker.net/
int x = 0; 
int y = 0;
int stepLeft = 20; 
int stepDown = 22; 
 
void setup() {
    //background(255);
    size(800, 400); 
    smooth();
    frameRate(1000);
    strokeWeight(stepLeft);
    strokeCap(PROJECT);
} 
 
void draw() {
   stroke(random(50), random(255), random(255), 80);
   
   line(x, y, x, (y+stepDown));
   x+=stepLeft;//step to left
   
   //limit
   if(x>width){
       x=0;
       y+=stepDown;//step down
   }
   
   if(y>height){
       y=0;
   }
}
 
//change strokeCap mode
bool style = false;
void mousePressed(){
    background(255);
    style=!style;
    x = y =0;
    
    if(style){
        strokeCap(SQUARE);
    }else{
        strokeCap(PROJECT);
    }
}
