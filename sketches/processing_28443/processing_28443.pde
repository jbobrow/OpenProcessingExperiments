
int a =0;

void setup () {
  
  size (400, 400);
  noStroke ();
  smooth ();
  }

void draw () {
  
  background (255);

  if (mousePressed){
  
  for (int x = 0; x < width; x = x+1){

    stroke (0, random (200));
    strokeWeight (1.3);    
    line (x,0,x,height); 
  }
  
  for (int y = 0; y < height; y = y+1){
     stroke (0, random (200));
     strokeWeight (1.3);
     line (0,y,width,y);      
  }
  }else{ 
      for (float x = 0; x < width; x = x+2){

    stroke (0);
    strokeWeight (1);    
    line (x,0,x,height); 
  }
  
  for (float y = 0; y < height; y = y+2){
     stroke (0);
     strokeWeight (1);
     line (0,y,width,y);      
  }
}
}

