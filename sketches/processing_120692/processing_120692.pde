
  
int centerX, centerY, minMaxXY;
Obj obj = new Obj();
boolean completo = false;


ArrayList<Point2D> points;

int sqSize = 15;
boolean first = true, draw = false;
double rot = 0;

double alpha = 0.01;
int iX3D(float x){return Math.round(centerX + x);}
int iY3D(float y){return Math.round(centerY - y);}

int deIX3D(float x){ return Math.round(x - centerX);}
int deIY3D(float y){ return Math.round(y - centerY);}

float iX2D(float x){return x;}
float iY2D(float y){ return height - y; }

Point2D[] test;

void setup(){
    size(800,600);  
    points = new ArrayList<Point2D>();
    minMaxXY = Math.min(width, height);
    centerX = width/2; centerY = height/2;

    test = new Point2D[4];
    test[0] = new Point2D(200, 500);
    test[1] = new Point2D(600, 500);
    test[2] = new Point2D(600, 100);
    test[3] = new Point2D(200, 100);
    obj = new Obj(test, 40F);
    draw = true;
}

void mousePressed(){

  if (completo){ //completo
    if (obj.contador < 6)
      obj.contador++; 
    else{
      completo = false;
      obj.contador = 0;
    }
  }
  else if ( first ){
    background(208);
    points.clear();
    rect( mouseX - sqSize / 2, mouseY - sqSize/2, sqSize, sqSize);
    first = false;
    obj = new Obj();
    draw = false;
    rot = 0;
    points.add(new Point2D( iX2D(mouseX), iY2D(mouseY)));
    
    Point2D p = points.get(points.size() -1);
    println(p);
  }
  else{
    // cuando se completa
    if ( mouseX > iX2D(points.get(0).x) - sqSize/2 && mouseX < iX2D(points.get(0).x) + sqSize/2 && 
          mouseY > iY2D(points.get(0).y) - sqSize/2 && mouseY < iY2D(points.get(0).y) + sqSize/2)
    {
      background(208);
      first = true;
      draw = true;

      Point2D[] losPuntos = new Point2D[points.size()];
      points.toArray(losPuntos);
      obj = new Obj(losPuntos, 40F);
      completo = true;

    }
    else{
      
      Point2D p = points.get(points.size() -1);
      line( iX2D(p.x), iY2D(p.y), mouseX, mouseY);
      points.add(new Point2D( iX2D(mouseX), iY2D(mouseY)));

      p = points.get(points.size() -1);
      println(p);
    }
  }
 

}

void keyPressed(){
    if (keyCode == RIGHT)
        obj.theta += 0.1;
    else if (keyCode == LEFT)
        obj.theta -= 0.1;
    else if (keyCode == UP)
        obj.phi += 0.1;
    else if (keyCode == DOWN)
        obj.phi -= 0.1;
}

void draw(){

  if (draw){ //draw
    background(208);
    //alpha+=0.00001;
    obj.d = obj.rho * minMaxXY / obj.objSize;
    obj.rotateCube(alpha);
    
    obj.eyeAndScreen();

    obj.Dibuja(obj.lasLineas);

  }  
}

void cubeLine(int i, int j)
{  
   Point2D p = obj.vScr[i], q = obj.vScr[j];
   line(iX3D(p.x), iY3D(p.y), iX3D(q.x), iY3D(q.y));
}


class Point2D{
  float x;
  float y;
  Point2D( double x, double y ){
    this.x = (float)x;
    this.y = (float)y;
  }

  public String toString() {
    return "x: " + x + " - y: " + y;
  }
}

class Point3D{
 float x;
 float y;
 float z;
 
 Point3D( double x, double y, double z){
    this.x = (float)x;
    this.y = (float)y;
    this.z = (float)z;
 }

  public String toString() {
    return "x: " + x + " - y: " + y + " - z: " + z;
  }
}

class Obj // Contains 3D object data
{  
  float rho, theta=0F, phi=0F, d, objSize,
         v11, v12, v13, v21, v22, v23, v32, v33, v43;
                    // Elements of viewing matrix V
  Point3D[] w;     // World coordinates
  Point2D[] vScr;   // Screen coordinates
  int contador = 0;
  float ancho = 30;
   
  Point3D centro = new Point3D(0,0,0);
  Point2D centroScr = new Point2D(0,0), 
    ejeXScr = new Point2D(0,0), ejeYScr = new Point2D(0,0), ejeZScr = new Point2D(0,0);

  Point3D ejeX = new Point3D(300,0,0), ejeY = new Point3D(0,300,0), ejeZ = new Point3D(0,0,300);
  
  Point3D centroy1 = new Point3D(0,1,0);
  Point3D centrox1 = new Point3D(1,0,0);
  Point3D centroz1 = new Point3D(0,0,1);
  Point3D centroy2 = new Point3D(0,-1,0);
  Point3D centrox2 = new Point3D(-1,0,0);
  Point3D centroz2 = new Point3D(0,0,-1);

  LineaCubo[] lasLineas;
     
  Obj()
  {  
    w = new Point3D[8];
    vScr = new Point2D[8];
    // Bottom surface:
    w[0] = new Point3D( 500, -500, -500);
    w[1] = new Point3D( 500,   500, -500);
    w[2] = new Point3D(-500,   500, -500);
    w[3] = new Point3D(-500, -500, -500);
    // Top surface:
    w[4] = new Point3D( 500, -500,   500);
    w[5] = new Point3D( 500,   500,   500);
    w[6] = new Point3D(-500,   500,   500);
    w[7] = new Point3D(-500, -500,   500);
    objSize = (float)Math.sqrt ( 5000000F );  //12F);
       // = sqrt(2  * 2 + 2 * 2 + 2 * 2)
       // = distance between two opposite vertices.
    rho = 5 *  objSize; // For reasonable perspective effect
  }

  Obj(Point3D[] wC, LineaCubo[] lc, float ancho)
  {  
    w = wC;
    vScr = new Point2D[w.length];
    objSize = (float)Math.sqrt ( 5000000F );  //12F);
       // = sqrt(2  * 2 + 2 * 2 + 2 * 2)
       // = distance between two opposite vertices.
    rho = 5 *  objSize; // For reasonable perspective effect

    lasLineas = lc;
  }

  Obj(Point2D[] wC, float ancho){
    

    // Point3D[] losPuntos = new Point3D[points.size() * 2];
    // LineaCubo[] lasLineas = new LineaCubo[points.size() * 3];

    int offset = wC.length;
    Point3D[] losPuntos = new Point3D[offset * 2];
    LineaCubo[] lasLineas = new LineaCubo[offset * 3];
    

    for (int i = 0; i < wC.length; i++){
      wC[i] = new Point2D(deIX3D(wC[i].x), deIY3D(wC[i].y));
      Point2D p = wC[i];

      //jtemp iX
      losPuntos[i] = new Point3D(p.x,p.y,obj.ancho );
      losPuntos[offset + i] = new Point3D(p.x,p.y,-obj.ancho);

      if (i != wC.length  - 1){
        lasLineas[i] = new LineaCubo(i, i+1);
        lasLineas[offset + i] = new LineaCubo(offset + i, offset + i + 1);
      }
      else{
        lasLineas[i] = new LineaCubo(i, 0);
        lasLineas[offset + i] = new LineaCubo(offset + i, offset);
      }
      //println(offset * 2 + i);
      lasLineas[offset * 2 + i] = new LineaCubo(i, i + offset);   
    }

    println("===================== Puntos 3D =====================");
    for (int i = 0; i < losPuntos.length; i++){
      println("[" + i + "]: " + losPuntos[i]);
    }

    println("===================== Lineas 3D =====================");
    for (int i = 0; i < lasLineas.length; i++){
      println("[" + i + "]: " +lasLineas[i]);
    }

    w = losPuntos;
    this.lasLineas = lasLineas;

    vScr = new Point2D[w.length];
    objSize = (float)Math.sqrt ( 800000F );  //12F);
       // = sqrt(2  * 2 + 2 * 2 + 2 * 2)
       // = distance between two opposite vertices.
    rho = 5 *  objSize; // For reasonable perspective effect
    centro = calculaCentro(wC);
  }

  Point3D calculaCentro(Point2D[] p){
    float arr = 0, ab = height, izq = width, der = 0;
  
    for(int i=0; i<p.length; i++){
      if ( p[i].x < izq)
        izq = p[i].x;
      if ( p[i].x > der)
        der = p[i].x;
      if ( p[i].y < ab) 
        ab = p[i].y;
      if ( p[i].y > arr)
        arr = p[i].y;     
    }
    
    println( "centro3D: " + new Point3D( iX3D((der+ izq) / 2), iY3D((arr + ab) / 2), 0));
    Point3D centro = new Point3D( (der+ izq) / 2, (arr + ab) / 2, 0);
    println("centro3D sin iX3D: " + centro);
    return centro;
  }


  void initPersp()
  {  
    float costh = (float)Math.cos(theta),
          sinth = (float)Math.sin(theta),
          cosph = (float)Math.cos(phi),
          sinph = (float)Math.sin(phi);
    v11 = -sinth; v12 = -cosph * costh; v13 = sinph * costh;
    v21 = costh;  v22 = -cosph * sinth; v23 = sinph * sinth;
                  v32 = sinph;          v33 = cosph;
                                        v43 = -rho;
  }

  void Dibuja(){
    // Horizontal edges at the bottom:
    cubeLine(0, 1); cubeLine(1, 2); cubeLine(2, 3); cubeLine(3, 0);
    // Horizontal edges at the top:
    cubeLine(4, 5); cubeLine(5, 6); cubeLine(6, 7); cubeLine(7, 4);
    // Vertical edges:
    cubeLine(0, 4); cubeLine(1, 5); cubeLine(2, 6); cubeLine(3, 7);
  }

  void Dibuja(LineaCubo[] lineas){
    for (LineaCubo lc : lineas){
      cubeLine(lc.p1, lc.p2);
    }

    strokeWeight(15);
    // stroke(255,0,0);
    // point(iX2D(centroScr.x), iY2D(centroScr.y));

    // stroke(255,0,255);
    // point(iX2D(0), iY2D(0));

    stroke(0,0,255);
    point(iX3D(centroScr.x), iY3D(centroScr.y));
    
    stroke(255,0,0);
    point(iX3D(0), iY3D(0));

    strokeWeight(1);
    line( iX3D(0), iY3D(0), iX3D(ejeXScr.x), iY3D(ejeXScr.y));
    line( iX3D(0), iY3D(0), iX3D(ejeYScr.x), iY3D(ejeYScr.y));
    line( iX3D(0), iY3D(0), iX3D(ejeZScr.x), iY3D(ejeZScr.y));

    fill(0,120,180);
    textSize(20);
    text("X", iX3D(ejeXScr.x), iY3D(ejeXScr.y));
    text("Y", iX3D(ejeYScr.x), iY3D(ejeYScr.y));
    text("Z", iX3D(ejeZScr.x), iY3D(ejeZScr.y));

    stroke(0);
    fill(255);
    
  }

  void eyeAndScreen()
  { 
    initPersp();
    for (int i=0; i<w.length; i++)
    {  
       Point3D p = w[i];
       float x = v11 * p.x + v21 * p.y,
             y = v12 * p.x + v22 * p.y + v32 * p.z,
             z = v13 * p.x + v23 * p.y + v33 * p.z + v43;
       vScr[i] = new Point2D(-d * x/z, -d * y/z);
    }
    float x = v11 * centro.x + v21 * centro.y,
          y = v12 * centro.x + v22 * centro.y + v32 * centro.z,
          z = v13 * centro.x + v23 * centro.y + v33 * centro.z + v43;
    centroScr = new Point2D(-d * x/z, -d * y/z);

          x = v11 * ejeX.x + v21 * ejeX.y;
          y = v12 * ejeX.x + v22 * ejeX.y + v32 * ejeX.z;
          z = v13 * ejeX.x + v23 * ejeX.y + v33 * ejeX.z + v43;
    ejeXScr = new Point2D(-d * x/z, -d * y/z);

          x = v11 * ejeY.x + v21 * ejeY.y;
          y = v12 * ejeY.x + v22 * ejeY.y + v32 * ejeY.z;
          z = v13 * ejeY.x + v23 * ejeY.y + v33 * ejeY.z + v43;
    ejeYScr = new Point2D(-d * x/z, -d * y/z);

          x = v11 * ejeZ.x + v21 * ejeZ.y;
          y = v12 * ejeZ.x + v22 * ejeZ.y + v32 * ejeZ.z;
          z = v13 * ejeZ.x + v23 * ejeZ.y + v33 * ejeZ.z + v43;
    ejeZScr = new Point2D(-d * x/z, -d * y/z);
  }


  void rotateCube(double alpha)
  {
    
    // println("rotateCube");

    // for (Point3D p : w){
    //   println(p);
    // }

    if(contador==0){
      centroz1 = new Point3D(centro.x, centro.y, centro.z + 1); 
      initRotate(centro, centroz1, alpha);
    }
    else if(contador==1){
      centroz2 = new Point3D(centro.x, centro.y, centro.z - 1); 
      initRotate(centro, centroz2, alpha);
    }
    else if(contador==2){
      centroy1 = new Point3D(centro.x, centro.y + 1, centro.z); 
      initRotate(centro, centroy1, alpha);
    }
    else if(contador==3){
      centroy2 = new Point3D(centro.x, centro.y - 1, centro.z); 
      initRotate(centro, centroy2, alpha);
    }
    else if(contador==4){
      centrox1 = new Point3D(centro.x + 1, centro.y, centro.z); 
      initRotate(centro, centrox1, alpha);
    }
    else if(contador==5){
      centrox2 = new Point3D(centro.x - 1, centro.y, centro.z); 
      initRotate(centro, centrox2, alpha);
    }   
    for (int i=0; i<w.length; i++)
      w[i] = Rotar(w[i]);
  }
}

static double r11, r12, r13, r21, r22, r23, r31, r32, r33, r41, r42, r43;

static void initRotate(Point3D a, Point3D b, double alpha)
{ 
  // println(a);
  // println(b);
  // println(alpha);
  double v1 = b.x - a.x,
         v2 = b.y - a.y,
         v3 = b.z - a.z,
  theta = Math.atan2(v2, v1),
  phi = Math.atan2(Math.sqrt(v1 * v1 + v2 * v2), v3);
  initRotate(a, theta, phi, alpha);
}

  static void initRotate(Point3D a, double theta,
    double phi, double alpha)
  {  
    double cosAlpha, sinAlpha, cosPhi, sinPhi,
    cosTheta, sinTheta, cosPhi2, sinPhi2,
    cosTheta2, sinTheta2, pi, c,
    a1 = a.x, a2 = a.y, a3 = a.z;
    cosPhi = Math.cos(phi); sinPhi = Math.sin(phi);
    cosPhi2 = cosPhi * cosPhi; sinPhi2 = sinPhi * sinPhi;
    cosTheta = Math.cos(theta);
    sinTheta = Math.sin(theta);
    cosTheta2 = cosTheta * cosTheta;
    sinTheta2 = sinTheta * sinTheta;
    cosAlpha = Math.cos(alpha);
    sinAlpha = Math.sin(alpha);
    c = 1.0 - cosAlpha;
    r11 = cosTheta2 * (cosAlpha * cosPhi2 + sinPhi2)
          + cosAlpha * sinTheta2;
    r12 = sinAlpha * cosPhi+c* sinPhi2 * cosTheta * sinTheta;
    r13 = sinPhi * (cosPhi * cosTheta*c- sinAlpha * sinTheta);
    r21 = sinPhi2 * cosTheta * sinTheta*c-sinAlpha * cosPhi;
    r22 = sinTheta2 * (cosAlpha * cosPhi2 + sinPhi2)
          + cosAlpha * cosTheta2;
    r23 = sinPhi * (cosPhi * sinTheta*c+ sinAlpha * cosTheta);
    r31 = sinPhi * (cosPhi * cosTheta*c+ sinAlpha * sinTheta);
    r32 = sinPhi * (cosPhi * sinTheta*c- sinAlpha * cosTheta);
    r33 = cosAlpha * sinPhi2 + cosPhi2;
    r41 = a1 - a1 * r11 - a2 * r21 - a3 * r31;
    r42 = a2 - a1 * r12 - a2 * r22 - a3 * r32;
    r43 = a3 - a1 * r13 - a2 * r23 - a3 * r33;
  }
   
  Point3D Rotar(Point3D p)
  { 
    return new Point3D( p.x * r11 + p.y * r21 + p.z * r31 + r41, 
                        p.x * r12 + p.y * r22 + p.z * r32 + r42, 
                        p.x * r13 + p.y * r23 + p.z * r33 + r43);
  }


class LineaCubo{
  int p1;
  int p2;
  LineaCubo( int p1, int p2 ){
    this.p1 = p1;
    this.p2 = p2;
  }

  public String toString() {
    return "p1: " + p1 + " - p2: " + p2;
  }
}


