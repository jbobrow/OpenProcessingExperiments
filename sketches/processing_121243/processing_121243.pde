
int nieve = 800; //Cantidad de nieve
float[] x = new float[nieve];
float[] y = new float[nieve];
float[] velocidad = new float[nieve]; 
//He entendido lo k significa y para k sirve el float x = new float para hacer este processing
//gracies a estas paginas: 
//http://www.learningprocessing.com/examples/chapter-4/example-4-7/ 
//http://www.myskillportal.com/question/java-core-concepts-float-interger

void setup() {
  size(800, 400);
  background(#27916E);
  noStroke();
  smooth();

  int i = 0;
  while (i<nieve) {
    x[i] = random(0, width); //esto es para determinar de donde sale la nieve en las x
    y[i] =random(0, height); //esto lo mismo pero en las y (la posicion)
    velocidad[i] = random(1,5);//Anchura de la nieve
    i=i+1;
  }
}
 
void draw() { 
   background(#27916E);
  //background(0);
  fill(0,15);
  rect(0,0,width, height);
  //Tierra.
    fill(#673609);
    rect(0,375,800,30); 
  //Coche.
   fill(#3509B9);
   rect(200,275,400,70);
   rect(270,230,300,70); 
   fill(0);
   ellipse(300,350,50,50); 
   fill(0);
   ellipse(500,350,50,50);
    
  int i = 0;
  while (i < nieve) { //
    fill(1000*velocidad[i]);
    ellipse(x[i], y[i],velocidad[i],velocidad[i]);
    y[i] += velocidad[i]/2; // issac esto sirve para graduar la velocidad  
    if (y[i] > height) { //lo he puesto al 2 para k simule una tormenta de nieve
      y[i] = 0;
    } 
     
    i=i+1;
  }
}




