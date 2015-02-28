
  
  
  void setup() {
    size(500,500);
    smooth();
    ellipseMode(CENTER);
  
  }
  
  void draw () {
  background (#11151F);
  randomSeed(mouseX);
  
  
  //Variablen
  int kreis1 =4;
  int kreis2 = 9;
  
  //Schleifen
    for(int j = 1; j<kreis1; j++) {
    for(int i = 7; i<kreis2; i++) {
  
  //Form      
        kreis2 (width/kreis1*j,height/kreis1*i,random(300),random(150),random(0),random(255));
        kreis1 (width/kreis2*i,height/kreis2*i,random(25),random(0),random(255),random(255));
        
        }
      }
    }
  
  
  
  //Funktion
    void kreis1(float x, float y,float r,float rot, float gruen, float blau) {
     fill(rot,gruen,blau);
     noStroke();
     ellipse (random(0,500),random(0,500),r,r);
     
     
    }


    void kreis2(float x, float y,float r,float rot, float gruen, float blau) {
     fill(rot,gruen,blau,100);
     noStroke();
     ellipse (random(0,500),random(0,500),r,r);
  
 
    }

