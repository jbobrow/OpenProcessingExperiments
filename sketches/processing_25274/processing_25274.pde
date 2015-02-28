
int tamanio = 20;
int variable = 0;

float rads = 5; // angle de l'oscillation
float rayon = 400; // longueur du cable du pendule
float rotation = PI/18;
float rotspeed = PI/50;
 
void setup() {
  size(500,500);
  smooth();
  frameRate(30);
  rectMode(CENTER);
}
 
 
void draw() {
 noStroke();
 fill(250,30);
  rect(width/2,height/2,500,500);
 
   
  rads += 0.075; // incrémenter l'angle de l'oscillation
   
  float oscillation = cos(rads) * (PI/4) + (PI/2); // calculer l'oscillation (toujours entre -1 et 1)
   
   
  // convertir les coordonnées polaires en coordonnées cartésiennes
  // et déplacer le point de référence au point 0,width/2
  float y = sin(oscillation) * rayon;
 float x = cos(oscillation) * rayon + width/2;
   
  fill(random(20,180),random(10,60),60,random(90,99));
  stroke(random(20,180),random(10,60),60,random(90,99));
  line(width/2,0,x,y);
  noStroke();
  pushMatrix();
  translate(x,y);
  rotate(rotation);
  translate(-x,-y);
  rect(x,y,tamanio+variable,tamanio+variable);
  popMatrix();
  rotation+=rotspeed;
  variable=variable+1;
  tamanio = tamanio+variable;
  if ((tamanio >= 80) || (tamanio <= 20)) {
  variable = variable*-1;
  
    
  }
  

}



