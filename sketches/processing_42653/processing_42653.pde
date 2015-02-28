
  PImage b;
  
  void setup(){
    size(700,350);
    loadImage ("paris.jpg");
  }
  
  void draw(){
    b = loadImage ("paris.jpg");
    tint (150,100,63);
    image (b,0,0);
    noTint ();
    image (b,350,0);
    
  }
                
                
