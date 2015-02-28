
// PARTÍCULAS 1

//VARIABLES
float angulo;
float tamano;
float ruido= 0.00928;
float variacion;



//SETUP
void setup() {
   size(800,600);
   smooth();
   noCursor();
   background (15,15,15);
}

//DIBUJO

void draw () {
  
  fill(15,15,15, random (10));
  rect(0,0, width, height);
  
  translate (mouseX, mouseY);  
  rotate(radians (angulo));
  
  variacion+= ruido;
  tamano = noise (variacion)*50;
  angulo = noise (variacion)*1260;
  
//if ( mousePressed) {
   
   
    fill (255);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(90) , random(50) , tamano/2, tamano/2);
    
    
    fill (255);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(150) , random(250) , tamano/5, tamano/5);
    
    
    fill (255);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(200) , random(60) , tamano/7, tamano/7);
      
    angulo++;     
 
// } 
}



                                                
