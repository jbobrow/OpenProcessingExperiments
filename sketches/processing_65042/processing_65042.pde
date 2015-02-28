
import peasy.*; // bibleoteca peasy pentru controlul camerei 3D
PeasyCam cam;  

PImage[] texmap =new PImage[15];  // creare vector textura-imagini planete


float[] u=new float[10]; // vector viteza
float[] c=new float[11];  // contor


void setup() {
  
  
  size(800, 600, P3D); // marimea proiectului // P3D - render folosit in special pentru web
  //scade din calitatea imaginii obiectelor pentru o desenare 3d mai rapida(optimizata).
 
  lights(); 
 
  cam = new PeasyCam(this, 10000); // initializare ,pozitia camerei de start.  
  cam.setMinimumDistance(1000); // valoarea minima de zoom-in.
  cam.setMaximumDistance(12000); // valoarea maxima de zoom-out.

  setup2(); // apelez functia din fisierul stele ,pentru a afisa stelele in fisierul main.
  initializeSphere(sDetail); // functia din fisierul texturi_planete pentru a initializa o sfera.
  
  noStroke();
  
  // incarc texturile pentru fiecare planeta .
  texmap[1] = loadImage("soarele.jpg");
  texmap[2]= loadImage("world32k.jpg");
  texmap[3] = loadImage("luna.jpg");  
  texmap[4] = loadImage("uranus.jpg");
  texmap[5] = loadImage("jupiter.jpg");
  texmap[6] = loadImage("venus.jpg");
  texmap[7] = loadImage("sat1.jpg");
  texmap[8] = loadImage("sat2.jpg");
  texmap[9] = loadImage("sat3.jpg");

  //declarare viteza / cu cat TWO_PI/x , x este mai mare viteza scade.
  
  u[1]=TWO_PI/1000;  //Pamantul// valoare viteza 
  u[2]=TWO_PI/1500;  //Luna
  u[3]=TWO_PI/5000;   //Uranus
  u[4]=TWO_PI/2000;   //Jupiter
  u[5]=TWO_PI/4000;      //Venus
  u[6]=TWO_PI/2050;      //Satelit 1 
  u[7]=TWO_PI/1000;      //Satelit 2  
  u[8]=TWO_PI/500;      //Satelit 3
  
}

void draw() {    
  
  background(0);            
  println(frameRate); // afiseaza cadrele per secunda.
  
 
  stele3(); // import functia de desenare din fisierul stele.
 
  
  ///Am creat un vector de contoare pt fiecare planeta un contor
 
  for (int i=1;i<10;i++)
  {  
    if (c[i]==TWO_PI)
      c[i]=0;
    else
      c[i]+=u[i];
  }



  // Soarele
  pushMatrix(); // Este o functie care salveaza coordonatele curente ale sistemului in stive.
  noStroke();
  texturedSphere(5000, texmap[1]); // creez sfera/diametru/textura
   
  // Pamant
  pushMatrix();
 orbite(3000, 2600);   // orbita pe axa X , Y .
  elipsa(3000, 2600, c[1]);  // elipa pe axa X , Y ,  orbita si elipsa trebuie sa coincida pentru a fi reprezentate corect./ contor viteza
  texturedSphere(800, texmap[2]);
  
  // luna
  pushMatrix();
 
  orbite(500, 550);
  elipsa(500, 550, c[2]);
 
  texturedSphere(50, texmap[3]); 


  popMatrix(); // Este o functia care restabileste sistemul de coordonate anterior.
  popMatrix();

  // A doua planeta (uranus)
  pushMatrix();

  orbite(4000, 3500);
  elipsa(4000, 3500, c[3]);

  texturedSphere(350, texmap[4]);

  popMatrix();

  // A treia planeta 
  pushMatrix();

  orbite(5000, 4500);
  elipsa(5000, 4500, c[4]);

  texturedSphere(1000, texmap[5]);

  popMatrix();


  // A patra planeta 
  pushMatrix();
 
  orbite(7000, 6500);
  elipsa(7000, 6500, c[5]);
  texturedSphere(2000, texmap[6]);

  //sat 1
  pushMatrix();
  
  orbite(1200, 1300);
  elipsa(1200, 1300, c[6]);
  texturedSphere(120, texmap[7]); 

 popMatrix(); 

  //sat 2

  pushMatrix();
  
  orbite(1400, 1600);
  elipsa(1400, 1600, c[7]);
  texturedSphere(100, texmap[8]); 

  popMatrix();

  //sat 3

  pushMatrix();
  
  orbite(900, 1000);
  elipsa(900, 1000, c[8]);
  texturedSphere(150, texmap[9]); 

  popMatrix();
  popMatrix();



  popMatrix();
  
}
///orbite///
void orbite(float d1, float d2) {
 
  pushMatrix();
  rotateY(radians(90));  // rotatie axa Y , unghiul
  noFill(); // fara umplere
  stroke(255, 150, 255); // culoare orbita
  strokeWeight(1.5); // grosimea elipsei
  ellipse(0, 0, 2*d1, 2*d2); // marimea elipsei
  noStroke(); // 
  strokeWeight(0.5); // marime stele 
  popMatrix();
  
}

//Creaza rotatia de elipsa
void elipsa(float d1, float d2, float co) {
  float x, y;
  
  rotateY(radians(90)); 
  x=d1*sin(co);
  y=d2*cos(co); 
  translate(x, y);
  
}



