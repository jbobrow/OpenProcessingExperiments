
int x = 0;
void setup (){
  size (300, 300);
  smooth ();

  
}

void draw (){
  frameRate (10);
  background (0);
  if ((keyPressed == true) && (key ==49)){
    for (int i= 0; i <300; i++) {
      float r = random (100.0);
      stroke (random (162), random (204), random (229), 25);
      strokeWeight (r);
      float offset = r * 5.10;
      line (i+20, 300, i + offset, 0);
    
    }
    
  
} else {
  background (0);
  for (int k = 0; k< width; k ++){
   float s = random (100.0);
   stroke (200, 25);
   strokeWeight (s);
   float offset = s * 5.10;
   line (k-20, 300, k -offset, 0);
    
  
}


}
}




