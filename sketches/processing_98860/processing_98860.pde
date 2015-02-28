
String str[] = {"Ernesto", "Aplicaciones", "Multimedia", "Práctica","Cabrera", "Solis","Yasmin", "Computación", "BUAP","Fuentes","Imagenes","Videos","Sonido","Lineal","Espiral","Tarea","Sabritas","Laptop","Netito","Mochila"};
int MAX_X = 700;
int MAX_Y = 400;
float[] x,y,size;
float z;
int speed;
int SIZE = 100;
float FAR_Z = -500.0;
float NEAR_Z = 100;
int num_pal = 20;
void setup() {
  x = new float[20];
  y = new float[20];
  size = new float[20];
  size(MAX_X, MAX_Y, P3D);
  camera(0, 0, -90, 0, 0, -100, 0, 1, 0);
  float cameraZ = ((width/2.0) / tan(PI*60.0/360.0));
  perspective(PI/4.0, float(width)/height, cameraZ/10.0, cameraZ*10.0);
  noStroke();
  shininess(.0020);
  iniciar();
}

void draw() {
  background(0);
  directionalLight(220, 220, 180, 1, 1, -1);
  directionalLight(50, 80, 120, -1, -1, -1);
   
  for(int i=0; i<num_pal; i++)
    dibuja(i);
  
  try{Thread.sleep(200);}catch(Exception e){}  
}

   
void dibuja(int n) {
      z+=1;
      if(z>NEAR_Z) {
        iniciar();
      } else {
        pushMatrix();
        translate(x[n], y[n], z*2);
        fill( 255,constrain(abs(FAR_Z-z), 0, 255));
        text(str[n],size[n],size[n]); 
        popMatrix();
      }
}
   
  void iniciar() {
    for(int i = 0;i<20;i++){
        float dist = random(SIZE+SIZE/2, abs(FAR_Z)/3);
        float deg = random(PI*2);
        x[i] = sin(deg)*dist;
        y[i] = cos(deg)*dist;
        z = FAR_Z;
        size[i]=random(SIZE/4, SIZE);
    }
  }
