
void setup() {  
 size(600,300);
 background(200);
}
void draw() {  
   for(int x=0; x<600;x=x+20){
   for(int y=0; y<600;y=y-10){
drawCross(x,y);

}

}

}

void drawCross(int x, int y){
stroke(200);
  // ellipse(x,y,10,10);
    ellipse(x+10,y,40,40);

}
