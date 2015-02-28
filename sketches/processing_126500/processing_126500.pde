
void setup(){
  size(800,500);
}

void draw(){
  background(0,0,255);
  strokeWeight(3);
  stroke(255);
   if (mouseX > width/2 && mouseY >  height/2){
   background(255,0,0);}
   else if(mouseX> width/2 && mouseY < height/2){
     background(255,255,0);
   }
   else if(mouseX < width/2 && mouseY > height/2){
     background(0,255,0);
   }
  line(width/2,0,width/2,height);
  line(0, height/2,width,height/2);

  
}


