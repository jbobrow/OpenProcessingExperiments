
void setup()
{
  smooth();
  size(400, 400);
}

void draw() {
  noStroke();
  
  


  fill(255, 80);
  rect(0, 0, width, height);

  for (int x = 20; x<= 400; x = x + 25)
  { 
    for (int y = 20; y<= 400; y = y + 25) {
      
      
      if ((dist(x, y, mouseX, mouseY)) < 40) {
        if(mouseX>=0 && mouseX<=200){
    fill(255,0,0);}
         if(mouseX>=200 && mouseX<=400){
    fill(0,0,255);}
        
      }
      else {
        fill(230);
      }

      rect(x-20, y-20,20,20);
      
      
    }
  }
}


