
void setup (){


  size (800, 500); 
  background (255);  
  noStroke(); 





}

void draw(){

  boolean flipflop = false;

  int z = 5; 

  for ( int i = 0; i <= width-width/8; i+= width/8)
  {

    // line (i, 0, i, height);  
    for (int x = 0;   x< height; x+= height/100)
    {

      if (flipflop)
        fill(0); 
      else
        fill(255); 
      pushMatrix(); 
      translate (i, 0); 
      rect(0, random(0,20)+x, width/8-5, random(0, 10)+x); 
      popMatrix(); 
      flipflop = !flipflop; 
    }
  }

  noLoop(); 
}



