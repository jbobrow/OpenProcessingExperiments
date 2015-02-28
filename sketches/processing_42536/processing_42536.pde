
void setup(){
  size (400,400);
  smooth ();
}

void draw (){
  background (255,201,201);
  
for(int x = 0 ; x <= width; x = x + 5){
    for(int y = 0 ; y <= width; y = y + 5){    
       
    if ((dist(x, y, mouseX, mouseY)) < 60) {
        if(mouseX>=0 && mouseX<=400){
    fill(20,9,126);}
      }
      else {
        fill(255);
      }
      noStroke(); 
      ellipse(x, y, 1, 3);

    }
}
} 
                
                
