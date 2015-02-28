
float z = 0;

ArrayList fractals;

void setup(){
  size(600, 600, P3D);
  fractals = new ArrayList();
  fractals.add(new Fractal(80.0, 20.0, random(10, 90), 1.1));
}

void draw(){

  if (mousePressed){
    z += 4;  
  }
  else{
    z -= 0.5;
  }
  
  z = constrain(z, 0, 500);
  translate(width/2, height/2, z);
  float camy = map(radians(mouseX), 0, 14, 0, TWO_PI);
  float camx = map(radians(mouseY), 0, 14, 0, TWO_PI);

  rotateX(camx*2);
  rotateY(camy);
  background(0, 0, 25);
  stroke(155, 100, 255, 155);

  for (int i=fractals.size()-1; i>=0; i--){
    Fractal fractal = (Fractal) fractals.get(i);
    fractal.draw();
    if (keyPressed == true){
      fractals.remove(i);
      fractals.add(new Fractal(70.0, 20.0, random(10, 90), random(0.2, 1.1)));
    }
  }
}


