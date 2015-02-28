
float huePrincipal = random(165);

void setup(){
  size(600,600);
  colorMode(HSB);
  smooth();
  
  background(255);
}

void draw(){
//translate(width,height);  
  stroke(huePrincipal+random(60), 100+random(100), 100+random(50), 10);
  strokeWeight(2 + random(10));
  
  float altura = random(height);
  line(0,altura,600,altura);
}1

