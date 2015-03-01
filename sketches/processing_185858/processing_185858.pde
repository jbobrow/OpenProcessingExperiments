
float radio = 360;
float grados;
float rot = radians(360);
ArrayList <Integer> ptosx, ptosy;
ArrayList <Integer> mntosx, mntosy;
ArrayList <Integer> htosx, htosy;
float diam = 0;
float t = -1;
float n = 255;
float circ = random(1,10);


int h, m, s;
int dia, mes, anno;
int old_s, old_ds, old_m, old_h;

void setup() {
  size(1024, 768);
  smooth();
  frameRate(70 );

  ptosx = new ArrayList();
  ptosy = new ArrayList();

  mntosx = new ArrayList();
  mntosy = new ArrayList();

  htosx = new ArrayList();
  htosy = new ArrayList();


  s = second();  // valores entre 0 - 59
  m = minute();  // valores entre 0 - 59
  h = hour();    // valores entre 0 – 23
  
  
  old_h = h;
  old_m = m;
  old_s = s;

  // carga de datos
  // add ptos (coordenadas) en los arraylist 


  for (int i=0; i<h; i++) {
    htosx.add(floor(random(100, 924)));
    htosy.add(floor(random(100, 668)));

    println(i);
  }


  for (int i=0; i<m; i++) {
    mntosx.add(floor(random(100, 924)));
    mntosy.add(floor(random(100, 668)));

    println(i);
  }
}

void draw() {

 background(255);

   fill(255,0,0,n);
   n=n-2;
    textSize(32);
       textAlign(CENTER,BASELINE);
  text("NEW ORGANISM CREATED", width/2 ,height/2);
  


  // accede a Hora, Minutos, Segundos
  s = second();  // valores entre 0 - 59
  m = minute();  // valores entre 0 - 59
  h = hour();    // valores entre 0 – 23
  // la fecha
  dia = day();   // 1 > 31
  mes = month(); // 1 > 12
  anno = year();

  int us = second() % 10;
  int ds = floor(second()/10); 


  rot += radians(15);

  //float radianes = radians(grados);


  // dibujar segundos  
  stroke(0);
  frameRate(10);
  fill(0);
  frameRate(70 );
  strokeWeight(10);

  beginShape(POINTS);

  for (int i=0; i<ptosx.size (); i++) {
    float px = ptosx.get(i);
    float py = ptosy.get(i);
  

    // buscar cercanos
    strokeWeight(0.2);
    for (int j=0; j<ptosx.size (); j++) {
      if (j!=i) {
        float pxj = ptosx.get(j);
        float pyj = ptosy.get(j);
        float d = pow((pxj-px), 2)+pow((pyj-py), 2);
fill(0,2);

 

noStroke();
  ellipse(px,py,circ,circ);
  //circ = circ + 0.000001;
  stroke(0);
  strokeWeight(0.2 );



        if (d<10000)
        //strokeWeight(random(5,10));
          line(px, py, pxj, pyj);
      }
    }

    vertex(px, py);
  }
  endShape(CLOSE);


  //HORAS

  for (int i=0; i<htosx.size (); i++) {
    float px = htosx.get(i);
    float py = htosy.get(i);
    fill(100, 100, 200, 100);
    // ellipse(px,py,5,5);

    // buscar cercanos
    strokeWeight(1);
    stroke (255, 0);
    for (int j=0; j<htosx.size (); j++) {
      if (j!=i) {
        float pxj = htosx.get(j);
        float pyj = htosy.get(j);
        float d = pow((pxj-px), 2)+pow((pyj-py), 2);

        if (d<10000)
          line(px, py, pxj, pyj);
      }
    }
  }




  // dibujar minutos  

  for (int i=0; i<mntosx.size (); i++) {
    float px = mntosx.get(i);
    float py = mntosy.get(i);
    fill (0);
    // ellipse(px,py,5,5);

    // buscar cercanos
    strokeWeight(1);
    stroke (255, 0);
    for (int j=0; j<mntosx.size (); j++) {
      if (j!=i) {
        float pxj = mntosx.get(j);
        float pyj = mntosy.get(j);
        float d = pow((pxj-px), 2)+pow((pyj-py), 2);

        if (d<10000)
          line(px, py, pxj, pyj);
      }
    }
  }





  // Add aleatorio

  // control minutoss  



  // control segundos
  //  if(old_s != s) {
  //    if(key=='r') {
  //      ptosx.clear();
  //      ptosy.clear();
  //    }
  //  }
  //  else {
  //  




  if (old_m != m) {
    int pxi = ptosx.get(0);  
    int pyi = ptosy.get(0); 
    mntosx.add(pxi);
    mntosy.add(pyi);
    //  ptosx.clear();
    //ptosy.clear();
  } else {

    if (ptosx.size()>0) {
      int id = floor (random(ptosx.size()));

      int pxi = ptosx.get(0);  // get(id);
      int pyi = ptosy.get(0);  

      float radio = random (50-random (HALF_PI), 1300-5*random (TWO_PI));
      float angulo = random (TWO_PI);

      ptosx.add(pxi + floor (radio * cos(angulo)));
      ptosy.add(pyi + floor (radio * sin(angulo)));
    } else {
      // NUEVO PUNTO CENTRAL


      ptosx.add(floor(random(100, 924)));
      ptosy.add(floor(random(100, 668)));
    }
  }
  old_s = s;
  old_m = m; 




  fill(255, diam);
  rect(0, 0, 1024, 768);
  if (diam > 254) {
    fill(0);
    textSize(32);
       textAlign(CENTER,BASELINE);
  text("GAME OVER", width/2 ,height/2);
  }
  
  
    fill(255,255);
 rect(0, 0, 1024, t);



}


void mousePressed() {

  strokeWeight(1);
  stroke(0);
  
  beginShape(POINTS);
  for (int i=0; i<ptosx.size (); i++) {
    float px = ptosx.get(i);
    float py = ptosy.get(i);
    vertex(px, py);

    for (int j=0; j<ptosx.size (); j++) {
      if (j!=i) {
        float pxj = ptosx.get(j);
        float pyj = ptosy.get(j);
        float d = pow((pxj-px), 2)+pow((pyj-py), 2);

        if (d<900)
          line(px, py, pxj, pyj);
      }
    }
  }
  endShape(CLOSE);
  ptosx.add(floor(random(mouseX + 10, mouseX-10)));
  ptosy.add(floor(random(mouseY+10, mouseY-10)));

}

void mouseMoved() {
  diam=diam+abs(mouseX-pmouseX)*random(0.01,0.001);
}
