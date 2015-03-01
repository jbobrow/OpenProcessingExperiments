
void setup(){
  size(480, 120);
  smooth(); 
}

void draw(){
  color clicked = color(204, 102, 0);
  color noClick = color(153, 51, 0);
  if(mousePressed){
      fill(clicked);
      
   } 
   else{
      fill(noClick); 
   }
   ellipse(mouseX, mouseY, 80, 80);
}


