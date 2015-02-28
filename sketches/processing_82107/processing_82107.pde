
float angulo=1;

void setup() {
  size(800,800);
  smooth();
  noStroke();
}

void draw (){
  fill(255,4);
  rect(0,0,width,height); //este rect en el fondo
  
  fill(245,7,23,30);
  angulo=angulo + 3; // original: + 0.05
  translate(400,400);
  rotate(angulo);
  rect(0,0,100,100);
  
  translate (150,100);
  fill(181,22,245,40);
  rotate(12);
  rect(0,0,100,100);
} 
  

