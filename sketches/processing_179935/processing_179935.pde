
String lines[];
estrella[] estrellas;
float radio = 250;
float rx = 0;
float ry =0;
float maxm =5.5;
float maxt =5.5;
int cuenta=0;
void setup() {
  size(800, 800, P3D);
  ortho();
  background(255, 0, 0);
  text("cargando", 20, 20);

  String lineas[] = loadStrings("http://david.laveneno.org/docs/db.txt");
 // String lineas[] = loadStrings("db.txt");

  estrellas = new estrella[lineas.length];
  for (int i=0; i < lineas.length; i++) {
    String[] props = split(lineas[i], ',');
    estrellas[i] = new estrella(float(props[0]), float(props[1]), float(props[2]));
  }
  noStroke();
}

void draw() {
  background(255, 250, 250);
  translate(width/2, height/2, 0);
  fill(255);
  sphereDetail(32);
  if (!mousePressed) {
    sphere(radio);
  }

  float rxp = ((mouseX-(width/2))*0.007);
  float ryp = ((mouseY-(height/2))*0.007);
  rx = (rx*0.9)+(rxp*0.1);
  ry = (ry*0.9)+(ryp*0.1);
  rotateY(rx);
  rotateX(ry);
  fill(0);
  sphereDetail(10);
  for (int i=0; i < estrellas.length; i++) {
    estrellas[i].brillar();
  }
  cuenta=0;
}

class estrella { 
  float lat, lon, mg, d, r; 
  float x, y, z;
  estrella (float ra, float de, float m) {  
    d=de;
    r=ra;
    lat = radians(de); 
    lon = radians(ra*15);
    mg=m;
    x = radio*cos(lat)*cos(lon);
    y = radio*cos(lat)*sin(lon);
    z = radio*sin(lat);
  } 
  void brillar() { 
    if (mg<maxm&&mg>-5) {
      pushMatrix();
      translate(x, y, z);
      sphere(((maxt-mg)*3.2)+1.5);
      popMatrix();
      cuenta++;
    }
  }
}

