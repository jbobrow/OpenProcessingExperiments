
float ciblee;
float radiansBleue,radiansRouge,radiansBlanche,vitesseBlanche;

void setup() {
  size(400,400);
  ciblee = random(PI*2);

  radiansBleue = random(PI*2);
  radiansRouge = random(PI*2);
  radiansBlanche = random(PI*2);
  vitesseBlanche = 0;

  background(0);
  smooth();
  
}


void draw() {

  background(0);
  
  // Les trois orbites
  noFill();
  stroke(10,100,200);
  ellipse(width/2,height/2,100,100);
  stroke(255);
  ellipse(width/2,height/2,200,200);
  stroke(206,15,15);
  ellipse(width/2,height/2,300,300);
  
  noStroke();
  
  if ( mousePressed) {
    ciblee = atan2(mouseY-height/2,mouseX-width/2);
  }


  // BLEUE
  float vitesse = 0.03;
  
  if ( ciblee > radiansBleue ) {
    radiansBleue = min(ciblee - radiansBleue, vitesse) + radiansBleue;
  } 
  else {
    radiansBleue = max(ciblee - radiansBleue, -vitesse) + radiansBleue;
  }
  
  
  fill(10,100,200);
  pushMatrix();
  translate(width/2,height/2);
  
  rotate(radiansBleue);
  translate(50,0);
  ellipse(0, 0,20,20);
  popMatrix();

// BLANCHE
  float k = 0.04;
  float d = 0.9;
 
  vitesseBlanche = d * (vitesseBlanche + (k * (ciblee - radiansBlanche)));        
  radiansBlanche = radiansBlanche + vitesseBlanche;        

  fill(255);
  pushMatrix();
  translate(width/2,height/2);
  rotate(radiansBlanche);
  translate(100,0);
  ellipse(0, 0,20,20);
  popMatrix();

 
  // ROUGE
  float ratio = 0.05;

  radiansRouge = (ciblee - radiansRouge) * ratio + radiansRouge;

  fill(206,15,15);
  pushMatrix();
  translate(width/2,height/2);
  rotate(radiansRouge);
  translate(150,0);
  ellipse(0, 0,20,20);
  popMatrix();


  

}




                                                
