
 
PImage img;
PImage ing;

 
 void setup() {
    size(664,664);
    img = loadImage("k.jpg"); 
    ing = loadImage("o.jpg");
   
  }
 
  void draw() {
    
   

   if (mousePressed || keyPressed) {
      image(img,0,0);
      
    } else if ( mouseX >= 250 && mouseX < 400 ) {
      background(255,255,255,100);
    } else {
      image(ing,0,0); 
    }
    
    
  }
  
 



