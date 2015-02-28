
    
    
    void setup() {
      size(640,400);
      smooth();
      ellipseMode(CENTER);
    
    }
    
    void draw () {
    background (#11151F);
    randomSeed(mouseX);
    
    
    //Variablen
    int kreis1 = 32;
    int kreis2 = 20;
    int kreis3 = 18;
    
    
    //Schleifen
      for(int j = 1; j<kreis1; j++) {
      for(int i = 1; i<kreis2; i++) {
    
    //Form      
          kreis2 (width/kreis1*j,height/kreis2*i,i,random(255),random(100),random(255));
          kreis1 (width/kreis1*j,height/kreis2*i,j,random(255),random(155),random(255));
          kreis3 (width/kreis1*j,height/kreis2*i,j,random(255),random(155),random(255));
          }
        }
      }
    
    
    
    //Funktion
      void kreis1(float x, float y,float r,float rot, float gruen, float blau) {
  
        //stroke(#11151F, 255);
        fill(rot,gruen,blau);
        ellipse(x,y,6,6);
       
      }
  
  
      void kreis2(float x, float y,float r,float rot, float gruen, float blau) {
        
        
        fill(rot,gruen,blau);
        ellipse(x,y,18,18);
         
      }
      
      
            void kreis3(float x, float y,float r,float rot, float gruen, float blau) {
        
        noStroke();

        fill(rot,gruen,blau,30);
        ellipse(x,y,40,40);
         
      }

