
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
float x;
float y;

float py;
float px; // variable globale à déclarer au début du document car on va les utiliser tout le temps

float easing = 0.3; // utiliser dans les effets de retard, de rebon...

void setup (){
  size(480,120);
  smooth();
  stroke(0,102);
  }
  
void draw (){
float targetX = mouseX;
x += (targetX - x) * easing; //définir la valeur de X en la lissant (acceleration ou retard par rapport a la souris)
// x est égal à mouseX moin lui meme multiplié par easing
float targetY = mouseY;
y +=(targetY-y) * easing;

float weight = dist(x, y, px, py); // variable qui définit l'epaisseur du trait distance entre les deux variables
strokeWeight (weight);
line(x, y , px, py);

py = y; // définir les valeur
px = x;

}
                
                
