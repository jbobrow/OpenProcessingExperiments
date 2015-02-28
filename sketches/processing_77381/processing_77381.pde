

  int h = 700;
  int w = 700;
  int couleurMax = 255;
  
void setup () {

  size (h,w);
  smooth();
  background (0,0);
  
}

void draw (){
// background (0,184,230,0);
  fond (); 

    //----------------------------------------------------------------------------
  
      //poisson bleu
      float bruit = map(mouseX, 0, width, 0, 20);
        for(int x=-2; x<width+80; x+=110) {
          for (int y=150; y<350; y+=65) {
          Bleu (x,y, -0.5, random(-radians(bruit),radians(bruit)) ); 
          }
        }
                     
    //----------------------------------------------------------------------------

      //bulles
    
    pushMatrix(); 
    
      float a=map(mouseX, 0, width, -PI, PI); //rotation
      bulles(mouseX, mouseY, 1, a); 
      
    popMatrix();
    
    //----------------------------------------------------------------------------

      //poisson rouge
        poissonQuiNage();

}

void fond (){
     //dégradé du fond
     h=700;
    for(int i=couleurMax; i>=0; i--){
      strokeWeight(5);
      stroke(0,couleurMax-i,couleurMax-i);
      line(0,h,w,h);
      h-=3;
    }
 }



