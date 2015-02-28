
float ruidoT = 0.400;
float variacionT;
float tamano;
float angulo;

void setup() {

  size(800, 800);

  
  smooth();
}
void draw() {

   background(40, 40, 40);
  
  tamano = noise(variacionT)*mouseX;
  
  
  
  
  stroke(0, mouseY, mouseX,100);
  noFill();
  ellipse(100, 100, tamano, tamano);
  
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(300, 100, tamano, tamano);

   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(500, 100, tamano, tamano);

 stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(700, 100, tamano, tamano);
  
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(100, 300, tamano, tamano);
  
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(300, 300, tamano, tamano);

   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(500, 300, tamano, tamano);

 stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(700, 300, tamano, tamano);
  
  
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(100, 500, tamano, tamano);
  
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(300, 500, tamano, tamano);

   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(500, 500, tamano, tamano);

 stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(700, 500, tamano, tamano);
  
  
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(100, 700, tamano, tamano);
  
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(300, 700, tamano, tamano);

   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(500, 700, tamano, tamano);

 stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(700, 700, tamano, tamano);
  
  
  
  


stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(400, 0, tamano, tamano);

  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(0,400, tamano, tamano);


 stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(400, 400, tamano, tamano);
   
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(400,800, tamano, tamano);
  
  stroke(0, mouseY, mouseX,100);
  noFill();
  ellipse(400, 200, tamano, tamano);
   
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(400,600, tamano, tamano);

   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(800,400, tamano, tamano);
  
    stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(800,200, tamano, tamano);
    
        stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(800,600, tamano, tamano);
  
     stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(800,400, tamano, tamano);
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(0,0, tamano, tamano);
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(800,800, tamano, tamano);
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(800,0, tamano, tamano);
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(0,800, tamano, tamano);
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(0,200, tamano, tamano);
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(0,600, tamano, tamano);
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(200,0, tamano, tamano);
  
  stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(200,200, tamano, tamano);
  
     stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(200,400, tamano, tamano);
    
    stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(200,600, tamano, tamano);

    stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(200,800, tamano, tamano);
  

  
     stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(600,0, tamano, tamano);
  
     stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(600,200, tamano, tamano);
  
     stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(600,400, tamano, tamano);
  
     stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(600,600, tamano, tamano);
  
   stroke(0, mouseY, mouseX, 100);
  noFill();
  ellipse(600,800, tamano, tamano);


 
 frameRate(30);
 
}


