
int x = 5;      
float y = 500.4; 

void setup(){
  size(500,500);
  background(245,255,250);
}
void mousePressed(){
  background(235,235,235);
  fill(255,255,255);
  rect(475,475,15,15);
}
void draw(){
   fill(147,112,219);
   ellipse(mouseX,mouseY,40,40);
   if(keyPressed==true){
     if(key=='5'){
       background(151);
  y = y + 15; 
  fill(255,255,0);
  ellipse(y, height/2, y, height);
   if(y > width) {
    y = 0;
  }
       
   }
   }
}






