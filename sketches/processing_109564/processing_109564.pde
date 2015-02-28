
float centrox; 
float centroy; 
// float é paa numero decimal


void setup() {
  size (800, 600);
  background (255, 255, 255);
  centrox=width/2;// width= largura dp sketch, centrox/2 vale como a metade horizontal
  centroy=height/2;// height= altura do sketch, centrox/2, centro vertical
  
  
  
  println(centrox); // para mostrar os números em baixo
}

void draw() {
fill(255, 255, 255); 
noStroke();
ellipse ( centrox, centroy, 50, 50);  
stroke(0);
fill( random(255), 0 ,0);
ellipse ( centrox+random(-200,200), centroy+random(-200,200), 5, 5);
line (centrox, centroy, centrox+random(-200,200), centroy+random(-200,200));

}
