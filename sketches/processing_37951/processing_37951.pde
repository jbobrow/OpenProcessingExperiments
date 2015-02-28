
 void setup(){
size(400,400);
background(255);
noStroke();
smooth();
strokeWeight(0.5);
}

void draw(){
  for(int i=0;i<100;i++){
    drawX(int(random(255)),int(random(width)),int(random(height)));
}
}


void drawX(int gray,int x,int y){
fill(gray,100);
ellipse(x,y,20,20);
}
           
                
