
void setup() {
  size (1024, 760);
}


void draw () {
  background (0, 0, 0);
  fill (65, 65, 65);

  int nLines=37;

  for (int x=0; x<=width; x=x+15) {

    for (int y=1; y<=nLines; y=y+1) {

      if (mouseX<512) {




        float col= map (y, 1, nLines, 0, 255);


        fill (col);
      }
      else { 
        

      float col3 = random(0, 255);
      float rred3 = random(0, 255);
      float rgreen3 = random(0, 255);
      float rblue3 = random(0, 255);
      float opac3= random (0, 255);
     
     
     fill (rred3, rgreen3, rblue3, opac3);
        
        
      } 

      rect (x, y*20, 10, 10);


      
      
    }
  }
}                       
