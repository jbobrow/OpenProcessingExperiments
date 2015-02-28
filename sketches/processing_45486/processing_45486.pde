
/*por Eduardo H Obieta
hackpact de arte generativo
www.artegenerativo.laad.com.mx
*/

//rutas
float px[];
float py[];
float pz[];
float rad[];
float incx[];
float incy[];
float incz[];

int q = 10;

void setup() {
  size(800, 400, P3D);
  background(0);
  smooth();
  noStroke();
  //posiciones
  px = new float[q];
  py = new float[q];
  pz = new float[q];
  //tamaño
  rad = new float[q];
  //incremento
  incx = new float[q];
  incy = new float[q];
  incz = new float[q];

  for (int i=0; i<q ; i++) {
    //posiciones iniciales
    px[i]=random(height*0.75);
    py[i]=random(height*0.75);
    pz[i]=random(height*0.75);
    //tamaño
    rad[i]=random(2, 4);
    //incrementos
    incx[i]=random(7.5);
    incy[i]=random(7.5);
    incz[i]=random(7.5);
  }
}

void draw() {
  translate((height), 0, -height*0.40);
  rotateX(-0.5);
  rotateY(0.05*millis()*0.05);

  stroke(255, 50);
  strokeWeight(0.15);
  line(0, 0, 0, height*0.75, 0, 0);
  line(0, 0, 0, 0, height*0.75, 0);
  line(0, 0, 0, 0, 0, height*0.75);
  line(0, 0, height*0.75, 0, height*0.75, height*0.75);
  line(0, height*0.75, 0, 0, height*0.75, height*0.75);
  line(0, height*0.75, 0, height*0.75, height*0.75, 0);
  line(0, height*0.75, height*0.75, height*0.75, height*0.75, height*0.75);
  line(0, 0, height*0.75, height*0.75, 0, height*0.75);  
  line(height*0.75, 0, height*0.75, height*0.75, 0, 0);
  line(height*0.75, height*0.75, 0, height*0.75, 0, 0);
  line(height*0.75, 0, height*0.75, height*0.75, height*0.75, height*0.75);
  line(height*0.75, height*0.75, 0, height*0.75, height*0.75, height*0.75);

  noStroke();
  fill(random(255));
  for (int p=0; p<q; p++) {

    pushMatrix();
    translate(px[p], py[p], pz[p]);
    sphere(rad[p]);
    popMatrix();

    px[p]+=incx[p];
    py[p]+=incy[p];
    pz[p]+=incz[p];

    if ((px[p] > height*0.75) || (px[p] < 0)) {
      incx[p]= incx[p] * -1;
    }
    if ((py[p] > height*0.75) || (py[p] < 0)) {
      incy[p]= incy[p] * -1;
    }
    if ((pz[p] > height*0.75) || (pz[p] < 0)) {
      incz[p]= incz[p] * -1;
    }
  }
}


