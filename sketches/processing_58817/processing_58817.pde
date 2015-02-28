

import ddf.minim.*;

float angle = 0;

//int MapaSonido = 200;

int cuantos = 1000;


float[]x = new float[cuantos];
float[]y = new float[cuantos];
float[]z = new float[cuantos];
float[]x1 = new float [cuantos];
float[]y1 = new float [cuantos];
float[]z1 = new float [cuantos];


AudioPlayer sonido1;
AudioPlayer sonido2;
AudioPlayer sonido3;
Minim minim;

void setup()
{
  size(800, 600, P3D);

  minim = new Minim(this);

  sonido1 = minim.loadFile("this.mp3", 2048);
  sonido2 = minim.loadFile("Bus1.mp3", 2048);
  sonido3 = minim.loadFile("Birds1.mp3", 2048);
  sonido1.play();
  sonido2.play();
  sonido3.play();


  smooth();
}

void draw()
{
  background(0);
  stroke(0,255,255);
  lights();

  //values = new int[sonido1.left][sonido2.right];

  x[x.length - 1] = sonido1.left.get(0);
  y[y.length - 1] = sonido2.right.get(0);
  z[z.length - 1] = sonido1.right.get(0);

//println(sonido1.left.get(0));
  pushMatrix ();
  translate(300,300,0);
  x[cuantos-1]= sonido1.left.get(0);
  y[cuantos-1]= sonido2.right.get(0);
  z[cuantos-1]= sonido3.left.get(0);
  
  x1[cuantos-1]= sonido1.right.get(0);
  y1[cuantos-1]= sonido2.left.get(0);
  z1[cuantos-1]= sonido3.right.get(0);
  
  for (int i = 0;i<cuantos-1;i++) {
    x[i]= x[i+1];
    y[i]= y[i+1];
    z[i]= z[i+1];
     point (x[i]*100, y[i]*100, z[i]*100);
     //line (x[i]*100, y[i]*100, z[i]*100, x1[i]*50, y1[i]*50, z1[i]*50);
       }
  //float cameraY = height/2.0;
  //float fov = mouseX/float(width) * PI/2;
  //float cameraZ = cameraY / tan(fov / 2.0);
  //float aspect = float(width)/float(height);
  //perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  if (mousePressed) {
  camera(pmouseX, pmouseY, 0.0,
  0.0, 0.0, 0.0,
  0.0, 1.0, 0.0);
  }
  
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  translate(0, 0, -50);
    popMatrix ();
  
}
//sphere (10);


void stop()
{

  sonido1.close();
  sonido2.close();
  sonido3.close();
  minim.stop();

  super.stop();
}


/*pushMatrix ();
 translate (x[i], y[i], z[i]);
 sphere (10);
 popMatrix ();*/


