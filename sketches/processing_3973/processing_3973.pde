
/** <strong> Particulas Abisales </strong><br />
 * <br />
 * por Paula Quintriqueo <br />
 * Proyecto final Lenguaje Computacional Cero <br />
 * Diseño. e[ad]. PUCV <br />
 * Martes 25 de Agosto 2009 <br />
 * Partículas Abisales - Basado en "Worms" por Gabe Graham <br /> 
 *      (http://www.rmx.cz/monsters/2009-08/worms/index.html)<br />

 * Las Particulas en un principio dispersadas, se concentran y
 * siguen al mouse, pero al mantener el mouse presionado se forman
 * espirales y remolinos, los cuales adquieren diversas formas
 * a medida que éste se mueve.
 * Una de las funciones clave es "atan2", la cual orienta a las
 * partículas de acuerdo a la posición actual del cursor.
 * Los colores cambian constantemente simulando las luces de
 * los peces abisales en medio de la oscuridad total
 */

Particula[] Particula;  //Arreglo de Particulas
int nParticulas = 5200; //número de Particulas

void setup() {
  size(800,600,P2D);
  noSmooth();
  frameRate(40);
  //inicialización del objeto y sus características
  Particula = new Particula[nParticulas];
  for(int i=0; i<nParticulas; i++){
    Particula[i] = new Particula(random(0.5,2),random(-.1,.1));
  }
}

void draw() {
  colorMode(HSB);   // modo de color HSB (Hue-Saturation-Brightness)
  float n = 0.01;
  n++;
  float col = noise(n)* millis()%255;

 fill(col,50,255,22); //color de las partículas
  noStroke();
  background(0);      //fondo negro
  for(int i=0; i<nParticulas; i++){
    Particula[i].update();
    Particula[i].draw();
  }
} 

class Particula {   // condiciones del objeto
  float xtarget;    //posición x del objetivo
  float ytarget;
  float speed;      //velocidad 
  int nvinculos=1;  //número de vinculos
  float[] x= new float[nvinculos]; //coordenada x de la Particula
  float[] y= new float[nvinculos]; 
  float dsteer; //Dirección de Partículas
  float angle;  //movimiento de Particulas
  
  Particula(float _speed, float _dsteer) {
    //al principio posiciona las partículas aleatoriamente  
    x[0]=random(0,width);
    y[0]=random(0,height); 
    
    for(int i=0; i<nvinculos; i++){
      x[i]=x[0];
      y[i]=y[0];
     }
    speed=11;
    dsteer=_dsteer;
  }
  
  void update() {
    xtarget=mouseX;   //Condiciones que lo hacen interactivo
    ytarget=mouseY;   //  con el mouse
    
    for(int i=nvinculos-1; i>0; i--){
      x[i]=x[i]-1;
      y[i]=y[i]-1; 
    }
    /* orientación del conjunto de partículas de acuerdo a la
       posición del cursor*/
    angle=atan2((ytarget-y[0]),(xtarget-x[0]))+ dsteer; 
    //si el mouse es presionado se forman espirales
    if (mousePressed==true) angle=11+angle ;
    x[0]+=speed*cos(angle);
    y[0]+=speed*sin(angle);
  }
  
  //dibuja la Particula  
  void draw() { 
   for(int i=0; i<nvinculos; i++){
   ellipse (x[i],y[i],10,10);
    }    
  }
}

