
// PARTÍCULAS 2

//VARIABLES
float angulo;
float tamano;
float ruido= 0.00928;
float variacion;



//SETUP
void setup() {
   size(800,600);
   smooth();
   cursor (CROSS);
   background (255);
   frameRate (20);
}

//DIBUJO

void draw () {
  fill(255,255,255, random (85));
  rect(0,0, width, height);
  
  translate (mouseX, mouseY);  
  rotate(radians (angulo));
  
  variacion+= ruido;
  tamano = noise (variacion)*50;
  angulo = noise (variacion)*1260;
  
  
  
  fill(15);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(90) , random(50) , tamano*mouseY*0.00022, tamano*mouseY*0.00022);
    
     fill(15);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(150) , random(250) , tamano*mouseY*0.00091, tamano*mouseY*0.00091);
    
     fill(15);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(800) , random(60) , tamano*mouseY*0.0017, tamano*mouseY*0.0017);   
    
     fill(15);
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(200) , random(60) , tamano*mouseY*0.00087, tamano*mouseY*0.00087);   
    angulo++;     
  
  
  
  
  
  //interacción
  
if ( mousePressed) {
   background(15);
   fill(random(222));
 
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(90) , random(50) , tamano*mouseY*0.0022, tamano*mouseY*0.0022);
    
     fill(random(222));
 
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(150) , random(250) , tamano*mouseY*0.005, tamano*mouseY*0.005);
    
      fill(random(222));
   
    noStroke();
    ellipseMode(CENTER);
    ellipse (random(800) , random(60) , tamano*mouseY*0.0007, tamano*mouseY*0.0007);   
    
     fill(random(222));

    noStroke();
    ellipseMode(CENTER);
    ellipse (random(200) , random(60) , tamano*mouseY*0.017, tamano*mouseY*0.017);   
    angulo++;     
 
 } 
}


                
