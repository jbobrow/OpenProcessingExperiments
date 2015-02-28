
float space=40;

void setup (){
  background(255);
  size (400,400);
  smooth();
  strokeWeight(15);
}


void draw (){


for (
  float y = 15; 
  y < height; 
  y = y + space
    ){
      for (
      float x = 15; 
      x < width; 
      x = x + space  
          ){

  point (x, y);
  }
}

}

void keyPressed(){
  saveFrame ("punktegitter_enes.png");
}

