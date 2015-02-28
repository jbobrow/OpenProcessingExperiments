
/// Inspiration Kandinsky circles ////////////////////////////////// 
/// par Barbara Kesraoui///////////////////////////////////////////

/// Constructeur de programme
void setup() { 
      size(600, 600);  
      smooth(); 
}
/// Dessine
void draw() {  
      background(255);  // fond blanc
     
/// Boucles pour les cercles infinis
      for (int x = 50; x <= width-50; x += 20) {    
      for (int y = 50; y <= height-50; y+=20) {
        
/// Condition de l'intéractivité pour cercles fond blanc      
      if(mousePressed){ 
      ellipse(x, y, x+5, y+5);   
      }else{
      fill(255); 
      ellipse(x, y, x+5, y+5); 
 } 
      
/// Colore les cercles random après le click   
      if(mousePressed){   
      float r = random(0,255); /// colore random
      float g = random(0,255); /// *            *
      float b = random(0,255); /// *            *
      fill(r,g,b,80);
      ellipse(mouseX,mouseY,40,40);  // cercle qui suit la souris
      stroke (0);
 }
         
   }   
    
     }
  
        } 



