
int x;

void setup (){
  size (600, 400);
}

void draw (){
  background (255);
    
  for (int i =0; i <width; i = i + 30){
    for ( int j = 0; j <height; j = j +30){
    if (mousePressed){
    fill (random(0,255), random (0, 255), random (0, 255));
    }
      rect (i, j , 30, 30);
    }}
    
    
    for (int i =0; i <width; i = i + 30){
    for ( int j = 0; j <height; j = j +30){
       if (mousePressed){
 
    line (i, j, mouseX, mouseY);
    line (i*2, j*2, mouseX, mouseY);
    stroke (random(0,255), random (0, 255), random (0, 255));
       }
  
  }
}
}


