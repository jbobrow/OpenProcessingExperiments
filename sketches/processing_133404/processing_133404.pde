
//camara
import peasy.*;

PeasyCam cam;
//objeto vector
PVector v1;

//Cadena para mostrar posición en pantalla
String[] posxyz = new String[3];
float dt=0.02;
float T=4;
float angulo = 0;
float radio =100;
float tetha=0;
float inc=2*PI*dt/T;

void setup(){
    size(500,500,P3D);
    
    //frameRate(30);

    //Camara y Vector v1
    cam= new PeasyCam (this,width/2, height/2,0,400);
    v1 = new PVector(width/2, height/2,0); 
    
}

void draw(){

 background(100);
 ejes();
 
 //INICIO Muestra la posición en la pantalla
 posxyz[0]=nf(v1.x,2,2);
 posxyz[1]=nf(v1.y,2,2);
 posxyz[2]=nf(v1.z,2,2);
 String posicion = join(posxyz, " : ");
 text(posicion,20,50);
 println(frameRate);
 //FIN  Muestra la posición en la pantalla

 //Calculamos la posición x,y,z y hacemnos incremento del angulo
 v1.x = width/2 + (radio * sin(tetha));
 v1.y = height/2 + (radio * cos(tetha));
 v1.z =0;
 tetha=tetha+inc;
  
  //Aislamos la traslación al objeto efera
  pushMatrix();
  translate(v1.x,v1.y,v1.z);
  stroke(#ff0000);
  sphereDetail(20);
  sphere(20);
  //Desapilamos
  popMatrix();
  
  


  
}
void ejes(){
//x
stroke(#ff0000);
line(-width/2,width/2,2*width,width/2);
//y
stroke(#00ff00);
line(width/2,-width/2,width/2,2*width);
}

void keyPressed(){
//Con cualquier tecla reiniciamos la escena al principio
//Reseteamos el angulo e instanciamos al objeto nuevo
tetha=0;
v1 = new PVector(width/2, height/2,0);}


