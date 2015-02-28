
float x;
float y;
float rayon= 160;
// Fonction qui n'est appelee qu'au demarrage.
void setup() {
  size(400, 400); // La taille de la fenetre.
  frameRate(30); // Le nombre d'images par seconde.
  smooth(); // Lisser les formes dessinees.
  background(0, 0, 0);
  x=width/2;
  y=height/2;
}



void draw() {
  // Int

  background(0, 0, 0);
  stroke(0, 0, 0);
  fill(210, 209, 211);
  ellipse( width/2, height/2, rayon * 2, rayon * 2); 

  //Oeil mouvement        
  float oscOffsetD = 0.75;
  float oscCounterD =0.1 * frameCount;
  float oscCenterD =width/4 + 25;
  float oscRadiusD =width/50;

  float value = cos( oscCounterD + oscOffsetD ) * oscRadiusD + oscCenterD;


  ellipse(value+150, height*.333, 50, 50);  


  // oeil droite deuxième  
  fill(90, 90, 90);
  ellipse(value+150, height*0.333, 95, 220);
  ellipse(value+150, height*0.333, 95, 210);

  fill(201, 201, 201);
  ellipse(value+150, height*0.333, 85, 200);
  ellipse(value+150, height*0.333, 85, 180);

  ellipse(value+150, height*0.333, 70, 170);     
  ellipse(value+150, height*0.333, 70, 160);

  fill(210, 214, 117);
  ellipse(value+150, height*0.333, 60, 150);
  ellipse(value+150, height*0.333, 60, 140);

  fill(5, 5, 5);
  ellipse(value+150, height*0.333, 55, 130);
  ellipse(value+150, height*0.333, 55, 120);

  fill(210, 214, 117);
  ellipse(value+150, height*0.333, 40, 110);
  fill(211, 211, 211);     
  ellipse(value+150, height*0.333, 20, 100);


  //Oeil gauche mouvement   

  ellipse(value, height*.333, 50, 50);        

  //Oeil gauche       
  ellipse(value, height*0.333, 95, 230);
  ellipse(value, height*0.333, 95, 220);

  fill(201, 201, 201);
  ellipse(value, height*0.333, 85, 210);
  ellipse(value, height*0.333, 85, 200);

  ellipse(value, height*0.333, 70, 190);     
  ellipse(value, height*0.333, 70, 180);

  fill(210, 214, 117);
  ellipse(value, height*0.333, 60, 170);
  ellipse(value, height*0.333, 60, 160);
  fill(5, 5, 5);
  ellipse(value, height*0.333, 55, 150);
  ellipse(value, height*0.333, 55, 140);
  fill(210, 214, 117);
  ellipse(value, height*0.333, 40, 130);
  fill(211, 211, 211);     
  ellipse(value, height*0.333, 20, 100);


  // moustache        
  fill(250, 250, 255);


  beginShape();
  curveVertex(2.0, 243.0);
  curveVertex(233.0, 281.0);
  curveVertex(183.0, 310.0);
  curveVertex(202.0, 132.0);
  curveVertex(234.0, 281.0);
  curveVertex(482.0, 99.0);
  endShape();
  strokeWeight(2);
  stroke(235, 87, 2); 
  ;  

  int x =80; 
  while ( x < 330) { 
    line(200, 325, x, 360); 
    x = x + 5;
  }
  stroke(0, 0, 0);

  ellipse(126, 135, 5, 20);
  ellipse(275, 135, 5, 20);
  noFill();
  strokeWeight(3);
  noStroke();

  // Pomette    

    fill(255, 100, 100);
  ellipse(280, 270, 60, 30);
  ellipse(135, 270, 60, 30);


  fill(255, 185, 185);
  ellipse(135, 270, 30, 15);
  ellipse(280, 270, 30, 15);
}



