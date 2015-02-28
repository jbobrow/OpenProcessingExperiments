

int semilla = 1;
boolean fractal = true;
boolean refresh = true;
int contador;
float motion = 0.0001;
float ruido;
float bowie;
int posicionX, posicionY, posicionZ;

void ramita (float x, float y, float length, float angulo, int contador, boolean fractal){
strokeWeight (contador *2);
float ramas =5;
float angulito= 3*PI/6;
if (fractal) length = length + random(-0.5,0.5) * length / 10;
if (fractal) angulo = angulo + random(-0.5,0.5) * angulo /3;

  if (contador > 0){
    float[] startpt = new float[2];
    float[] endpt = new float[2];
    startpt[0] = x;
    startpt[1] = y;
    endpt[0] = x + length * cos(angulo);
    endpt[1] = y + length * sin(angulo);
 
   line(startpt[0], startpt[1], endpt[0], endpt[1]);
    stroke (234, 201, 201, 100);
 
    if(fractal) {
      ramas = random(1) * (ramas - 1) + 2;
    }
    else {
      ramas = ramas;
    }
 
   
    float branch_length_dimin;
    if(fractal) {
      branch_length_dimin = 0.5 + random(1) / 2;
    }
    else {
      branch_length_dimin = 0.7;
    }
 
    for(int I = 0; I < ramas; I++){
      float nuevoLength = length * ramas;
  
      float nuevoAngulo;
      if(fractal) {
        nuevoAngulo = angulo + random(1) * angulo - angulo / 2;
      }
      else {
        nuevoAngulo = angulo - angulo / 2 + angulo * I / (ramas - 1);
      }
   
     ramita(endpt[0], endpt[1], length, nuevoAngulo, contador - 1, fractal);
    }
  } 
}
 

void setup () {
  size (900, 700, P3D);
  background (255);
  frameRate (50000);
  smooth ();
   stroke (234, 201, 201, 100);
  ramita(width/4, height, 100, -PI/2, 5, !fractal);
  
  
}

void draw (){
  pushMatrix();
  trasladar ();
ramita (width/4, height, 100, -PI/2, 5, !fractal);
contador++;
 bowie= noise(ruido)*width;
  ruido+= motion;
randomSeed (semilla);
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
rotateY(PI/3);
ramita(width/4, height, 100, -PI/2, 5, !fractal);
}

void trasladar() {
  popMatrix();
  translate(width, height, width);
  rotateX(radians(contador));
      if(posicionX > width){
    motion = -2;
  }
  if(posicionX < 0){
    motion = 2;
  }
  if(posicionY > height){
   motion = -1;
  }
  if(posicionY < 0){
    motion = 1;
  } 
  if(posicionZ < 0){
  motion= 1;
 }
 if (posicionZ > PI) {
   motion=-1;
 }
}

void keyPressed (){
  if (key =='s') {
  saveFrame("dandelion-####.png");
  }
}

  

