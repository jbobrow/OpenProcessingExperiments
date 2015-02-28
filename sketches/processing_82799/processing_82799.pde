
void setup(){
size(320,480);
frameRate(1);
background(255);

}







public void draw(){



noLoop();

}

 public void mouseMoved() {
 

    background(255);
 
    
    for(i=0;i<mouseY;i++){ 
    x = random(width);
    y = random(height);

    text(y,x,y+10)
　      line(mouseX,mouseY,x,y);
    }

   
}

   
