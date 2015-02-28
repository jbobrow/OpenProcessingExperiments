
void setup(){
  size (600,600);
  smooth();
  
  
}

void draw(){
   background(0);
   stroke(255);
  for(int X = 0; X < width; X+=10){
    for(int Y = 0; Y < height; Y+=10){
      if((X%20) == 0){
        line(X,Y,X+6, Y-6);
      } else {
        line(X,Y,X+6,Y+6);
        
        triangle(X,100,100,Y,0,1000);
        fill(255,64,0);
        ellipse(100,200,X,Y);
        noFill();
        stroke(random(20,200),random (500),random(600));
      }
    }
  }
}

