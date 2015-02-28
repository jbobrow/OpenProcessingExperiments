
float targetX;
float x1,x2,x3,v3;

void setup() {
  size(400,400);
  targetX = width/2;

  x1 = random(width);
  x2 = random(width);
  x3 = random(width);
  v3 = 0;
  
  frameRate(20);
  smooth();
  background(0);
  
}


void draw() {

  background(0);


 stroke(255);
  if ( mousePressed) {
    targetX = mouseX;
     fill(0,60);
    //background(0);
  } else {
    // LIGNE CIBLE
  
  line(targetX,0,targetX,height);
   fill(0,5);
  }
  
   //rect(0,0,width,height);

  
  

  
  
  // CERCLE BLEU
  float vitesse = 3;
  float xd = targetX - x1;
  if ( xd > 0 ) {
    x1 = min(xd, vitesse) + x1;
  } 
  else {
    x1 = max(xd, -vitesse) + x1;
  }
  fill(10,100,200);
  ellipse(x1,height/4,40,40);

  // CERCLE ROUGE
  float ratio = 0.2;
  x2 = (targetX - x2)* ratio + x2;

  fill(206,15,15);
  ellipse(x2,height/4*2,40,40);


  // CERCLE BLANC
  float k = 0.04;
  float d = 0.9;
  float accel = k * (targetX - x3); 
  v3 = d * (v3 + accel);        
  x3 = x3 + v3;        

  fill(255);
  stroke(0);
  ellipse(x3,height/4*3,40,40);

}



                                
