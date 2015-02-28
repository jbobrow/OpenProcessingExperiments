
void setup(){
size(320,480);
frameRate(1);
background(255);
}

float x = random(width);
float y = random(height);
int r = 10;
int d = 30;


public void draw(){

r=10;
fill(0);
ellipse(x,y,r,r);
noLoop();

}


public void mousePressed() {
 
if(mouseX-d< x && x < mouseX+d && mouseY-d < y && y < mouseY+d)
{
   
    background(255);
    
    x = random(width);
    y = random(height);
    
    redraw();
    

}
noFill();
ellipse(mouseX,mouseY,d,d);
   
}

   
