
void setup(){
size(320,480);
frameRate(1);
background(255);

}


float x = random(width/2);
float y = random(height/2);
int r = width;
int c = 0;
int d = 30;




public void draw(){




fill(0);
ellipse(x,y,r,r);
noLoop();

}

//public void mousePressed() {
 public void mouseMoved() {
 
//if(mouseX-d< x && x < mouseX+d && mouseY-d < y && y < mouseY+d)
//{
    background(255);
    c++;
    
    for(i=0;i<c;i++){ 
    
    
    
    x = random(width);
    y = random(height);
    r = r/1.4;
//    redraw();
    text(c,x,y+10)
　  ellipse(x,y,r,r);
    }
//}
   
}

   
