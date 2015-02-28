
  
  
  void setup() {
    size(500,500);
    smooth();
    ellipseMode(CENTER);
  
  }
  
  void draw () {
  background (#11151F);
  randomSeed(mouseX);
  
  
  //Variablen
  int kreis1 =20;
  int kreis2 = 20;
  
  //Schleifen
    for(int j = 1; j<kreis1; j++) {
       

  
  //Form      
        kreis2 (random(500),random(0),random(150),random(255));
        kreis1 (random(25),random(0),random(255),random(255));
        
        }
      }

  
  
  
  //Funktion
    void kreis1(float x,float rot, float gruen, float blau) {
     fill(rot,gruen,blau);
     noStroke();
     rect (random(0,500),random(0,500),x,x);
     
     
    }


    void kreis2(float x,float rot, float gruen, float blau) {
     fill(rot,gruen,blau,100);
     noStroke();
     rect (random(-500,500),random(-500,500),x,x);
  
 
    }

