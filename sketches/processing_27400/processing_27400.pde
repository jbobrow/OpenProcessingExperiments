
void setup(){size(600,400);background(-1);}void draw(){filter(DILATE);loadPixels();for(int i=0;i<240000;i++){pixels[i]+=2048;}updatePixels();}void mouseDragged(){rect(mouseX,mouseY,60,60);}
                
                
