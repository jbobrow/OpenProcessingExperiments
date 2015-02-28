
//Conjunto de Mandelbrot y Multibrots
//Es una serie definida en el espacio de los numeros complejos
//Un numero complejo es de la forma c=a+bi donde i^2=-1
//El conjunto esta definido por una sucecion Z
//Z=z^2+c, i.e.
//Z(0)=0
//Z(1)=0*0+c
//Z(2)=c*c+c
//Z(3)=(c*c+c)*(c*c+c)+c
//etc.
//c*c=(a+bi)*(a+bi)=a^2-b^2+2abi
//a=posicion en x
//b=posicion en y
//Establecemos el rango de nuestras variables complejas
//de manera que |z^n|<=2^n
//Si damos valores muy pequeños en wh podemos hacer zoom y ver los fractales
//Si aumentamos el valor en x0 movemos el fractal hacia la derecha
//Si aumentamos el valor en y0 movemos el fractal hacia abajo 
//Para el mandelbrot completo
double x0=-2.5; double y0=-2; double wh=4;

boolean aumentar=false; boolean disminuir=false; boolean derecha= false; boolean izquierda=false; boolean arriba= false; boolean abajo= false;
boolean g2= true; boolean g3= false; boolean g5= false;

void setup(){
  size(400,400,P2D);
  smooth();
}

void draw(){
  if (aumentar){
    if (wh>1){
      wh-=.1;
    }
    if (wh>.1){
      wh-=.01;
    }
    if (wh>.01){
      wh-=.001;
    }
    if (wh>.001){
      wh-=.0001;
    }
    if (wh>.0001){
      wh-=.00001;
    }
    if (wh>.00001){
      wh-=.000001;
    }
    if (wh<.000001){
      wh=0.000001;
      aumentar= false;
    }
  }
  if (disminuir){
    if (wh<1){
      wh+=.1;
    }
    if (wh<.1){
      wh+=.01;
    }
    if (wh<.01){
      wh+=.001;
    }
    if (wh<.001){
      wh+=.0001;
    }
    if (wh<.0001){
      wh+=.00001;
    }
    if (wh<.00001){
      wh+=.000001;
    }
  }
  if (derecha){
   if (wh>1){
      x0+=.1;
    }
    if (wh>.1){
      x0+=.01;
    }
    if (wh>.01){
      x0+=.001;
    }
    if (wh>.001){
      x0+=.0001;
    }
    if (wh>.0001){
      x0+=.00001;
    }
    if (wh>.00001){
      x0+=.000001;
    }
    if (wh==.000001){
      x0+=0.0000001;
    }
  } 
  if (izquierda){
    if (wh>1){
      x0-=.1;
    }
    if (wh>.1){
      x0-=.01;
    }
    if (wh>.01){
      x0-=.001;
    }
    if (wh>.001){
      x0-=.0001;
    }
    if (wh>.0001){
      x0-=.00001;
    }
    if (wh>.00001){
      x0-=.000001;
    }
    if (wh==.000001){
      x0-=0.0000001;
    }
  }
  if (arriba){
    if (wh>1){
      y0-=.1;
    }
    if (wh>.1){
      y0-=.01;
    }
    if (wh>.01){
      y0-=.001;
    }
    if (wh>.001){
      y0-=.0001;
    }
    if (wh>.0001){
      y0-=.00001;
    }
    if (wh>.00001){
      y0-=.000001;
    }
    if (wh==.000001){
      y0-=0.000001;
    }
  }
  if (abajo){
    if (wh>1){
      y0+=.1;
    }
    if (wh>.1){
      y0+=.01;
    }
    if (wh>.01){
      y0+=.001;
    }
    if (wh>.001){
      y0+=.0001;
    }
    if (wh>.0001){
      y0+=.00001;
    }
    if (wh>.00001){
      y0+=.000001;
    }
    if (wh==.000001){
      y0+=0.000001;
    }
  }  
  loadPixels();
  //ponemos un numero maximo de recursion
  int iteracionMax=200;
  //x ira de x0 a xmax
  double xmax=x0+wh;
  //y ira de y0 a ymax
  double ymax=y0+wh;
  //Calculamos el incremento de x,y para cada pixel
  double dx=(xmax-x0) / (width);
  double dy=(ymax-y0) / (height);
  //Arrancamos y
  double y=y0;
  for (int j=0; j<height;j++){
    //Arrancamos x
    double x=x0;
    for (int i=0;i<width;i++){
      double a=x;
      double b=y;
      //Definimos un termino para correr las iteraciones
      int n=0;
      while(n<iteracionMax){
        //Grado 2
        if (g2){
          double aa=a*a;
          double bb=b*b;
          double dosab=2.0*a*b;
          a=aa-bb+x;
          b=dosab+y;
        }
        //Grado 3
        if (g3){
          double aaa=a*a*a;
          double bbb=b*b*b;
          double tresabb=3*a*b*b;
          double tresaab=3*a*a*b;
          a=aaa-tresabb+x;
          b=tresaab-bbb+y;
        }
        //grado 5
        if (g5){
          double a5=a*a*a*a*a;
          double b5=b*b*b*b*b;
          double a310b2=10*a*a*a*b*b;
          double a5b4=5*a*b*b*b*b;
          double a45b=5*a*a*a*a*b;
          double a210b3=10*a*a*b*b*b;
          a=a5-a310b2+a5b4+x;
          b=a45b-a210b3+b5+y;
        }
        //Consideramos un punto limite, ya que el conjunto de Mandelbrot es infinito
        //Para z^2+c usamos 
        if(a*a+b*b>16f) {
          break;
        }
        n++;
      }
      //Ahora coloreamos los pixeles segun el tiempo que les toma llegar hasta el limite de la sucesion
      //En existe una funcion con la que se pueden obtener colores muy agradables
      //En este caso lo haremos en escala de grises, que dependera de las iteraciones
      if (n==iteracionMax) pixels [i+j*width]=color(0);
      else pixels[i+j*width]=color ((10*n-log(log(n*16%255)/log(n)))%255,(3*n-log(log(n*5%255)/log(1.4)))%255,(20*n-log(log(n*5%255)/log(4)))%255);
      //else pixels[i+j*width]=color(n*10%255);
      x+=dx;
    }
    y+=dy;
  }
  updatePixels();
}

void keyPressed(){
  if (key=='s'){
    save ("mandelbrot10.jpeg");
  }
  if (key=='+'){
    aumentar= !aumentar;
    disminuir= false;
    derecha= false;
    izquierda= false;
    arriba= false;
    abajo= false;
  }
  if (key=='-'){
    aumentar= false;
    disminuir= !disminuir;
    derecha= false;
    izquierda= false;
    arriba= false;
    abajo= false;
  }
  if (key=='6'){
    aumentar= false;
    disminuir= false;
    derecha= !derecha;
    izquierda= false;
    arriba= false;
    abajo= false;
  }
  if (key=='4'){
    aumentar= false;
    disminuir= false;
    derecha= false;
    izquierda= !izquierda;
    arriba= false;
    abajo= false;
  }
  if (key=='8'){
    aumentar= false;
    disminuir= false;
    derecha= false;
    izquierda= false;
    arriba= !arriba;
    abajo= false;
  }
  if (key=='2'){
    aumentar= false;
    disminuir= false;
    derecha= false;
    izquierda= false;
    arriba= false;
    abajo= !abajo;
  }
  if (key=='7'||key=='9'){
    aumentar= false;
    disminuir= false;
    derecha= false;
    izquierda= false;
    arriba= false;
    abajo= false;
  }
  if (key=='1'){
    g2= true;
    g3= false;
    g5= false;
  }
  if (key=='3'){
    g2= false;
    g3= true;
    g5= false;
  }
  if (key=='5'){
    g2= false;
    g3= false;
    g5= true;
  }
  if (key=='r'){
    x0=-2.5;
    y0=-2;
    wh=4;
  }
}

