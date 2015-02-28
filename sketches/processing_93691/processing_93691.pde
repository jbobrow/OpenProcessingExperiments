
void setup (){
  size(200,200);
  background (185,6,27);
} 
  void draw (){
        stroke (46,240,44);
    fill (7,26,7);
    strokeWeight (5);
   {
     for (int mouseX=0; mouseX<200; mouseX=mouseX+20)
       for (int mouseY=0; mouseY<200; mouseY=mouseY+20)
  point (mouseX+mouseY, mouseY+mouseX);
  }
  
  }
