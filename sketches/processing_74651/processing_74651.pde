
void setup(){
  size(400, 400, P2D);
  smooth();
}

void draw(){
  background(0);

  for(int y = 0; y <= height; y = y + 50){
    for(int x = 0; x <= width; x = x + 50){

        noFill();
     stroke(150, 80);
     ellipse(0, 0, x, y);
     
     ellipse(width, 0, x, y);

     ellipse(0, height, x, y);

     ellipse(width, height, x, y);
     
     stroke(255);
     ellipse(width/2, height/2, x, y);
      }
     
    }
 }
