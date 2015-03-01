

int y = 0;




void setup (){
  size (300, 300);
  smooth ();
  noStroke ();
  noLoop ();

  
}

void draw (){
  background (0);
  for (int i = 0; i < width; i+= 5){
    fill (123, 65, 201, random (45));
    ellipse (i, i +5 , 150, 150);
    fill (234, 240, 179, random (45));
    ellipse (width-i, i-5, 150, 150);
    
    
  }
  PImage cross = get (0, 0, 20, 20);
  for (int j = 0; j < 250; j += 10){
  set (20+j, 20+j, cross);
  }
  
}



