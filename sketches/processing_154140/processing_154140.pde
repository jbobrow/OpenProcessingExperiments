
class Marioneta{//class puppet

  
    
  String     dir;      //Directorio de la Imagen de la marioneta ---- Dir Image puppet 
  PImage     img,imgC; //Imagenes de la marioneta ---- Image puppet
  float      x;        //Pocicion en X ---- X pocicion
  float      y;        //Pocicion en Y ---- Y pocicion
  PVector    vel;      //Velocidad ---- speed
  float      ang;      //Angulo de rotacion  ---- rotational angle
  
  //Variables de la libreria Ani
  de.looksgood.ani.easing.Easing   aniCons; //variable para el tipo de movimiento ---- variable for the type of movement
  AniSequence                      seq;//varaiable para definir secuencias de movimiento ---- varaiable for motion sequences

  
  
  Marioneta(String dir,float x,float y,PVector vel){
  
    this.dir = dir;
    this.x = x;
    this.y = y;
    this.vel = vel;
    
    aniCons = Ani.LINEAR;//por default el movimiento es lineal(librerias Ani) ---- by default the movement is linear (libraries Ani)

    ang = 0;
    
    
    //Se crean dos imagenes de la marioneta para en el caso de aplicar una transformacion de la
    //imagen se tenga la original sin modificar
    //-------------------------------------------------------------------------------------
    //Two images are created puppet, in the case of applying a transformation to have the 
    //image without changing the original
    img = loadImage(dir);

    imgC = createImage(img.width,img.height,ARGB);
    imgC.loadPixels();
    img.loadPixels();
    for (int i = 0; i < imgC.pixels.length; i++) {
      imgC.pixels[i] = img.pixels[i]; 
    }
    imgC.updatePixels();
    img.updatePixels();
    
  }
  
  //funcion para redimensionar la marioneta
  //----------------------------------------------------------
  //function to resize the puppet
  void ResizeM(float rX,float rY){
    img.resize(int(img.width*(rX/100)),int(img.height*(rY/100)));
    imgC.resize(int(imgC.width*(rX/100)),int(imgC.height*(rY/100)));
  }
  
  //funcion para aplicar movimiento con la libreria Ani a la marioneta
  //-------------------------------------------------------------------------
  //function to apply movement, with Ani librari, the puppet
  void posi(int xN,int yN){
    //Se calcula la distancia del punto de origen al punto de destino para que la velocidad de 
    //movimiento sea constante
    //---------------------------------------------------------------------------------------
    //The distance from point of origin to the destination calculated, 
    //so that the speed is constant
    float dista = dist(x,y,xN,yN);
    Ani.to(this, dista/vel.x, "x", xN,aniCons);
    Ani.to(this, dista/vel.y, "y", yN,aniCons);
  }
  
  //funcion que coloca la marioneta en un punto determinado
  //------------------------------------------------------------
  //function that sets the puppet at a given point
  void posT(int xN,int yN){
    x = xN;
    y = yN;
  }
  
  void rot(float rot){
    ang = rot;
  }
  
  /*
  void layD(int[][] _sD1,PImage Fond){
      
    for (int i = 0; i < img.width; i++ ) {
      for (int j = 0; j < img.height; j++ ) {
  
        if(_sD1[constrain(i + int(x),0,Fond.width - 1)]
                 [constrain(j + int(y),0,Fond.height - 1)] == 1){
         
          imgC.set(i,j,color(0,0));
        }else{
   
          imgC.set(i,j, img.get(i,j));
        }
      }
    }   
    
  }*/
  
  //Funcion que crea una secuencia de movimientos con la libreria Ani en pasos rectos
  //---------------------------------------------------------------------------
  //Function that creates a sequence of movements with the right steps in Ani library
  void secuencia1(float _x,float _y,int n){//punto final y numero de pasos para llegar ahi ---- endpoint and number of steps to get there
  
    float     distancia;//variables de distancia entre puntos ---- variables of distance between points
    float[][] puntos;//coordenadas de cada paso ---- coordinates of each step
    //int       y11;
    String    puntS;//cadena para ingresar las coordenadas en la funcion de movimiento
                    // de la libreria Ani 
                    //-----------------------------------------------------------------------------
                    // String to enter the coordinates in the function library movement Ani
  
    //y11 = 10;
    
    //se inicializa la variable "puntS"
    //--------------------------------------------------------------------
    //initializes the variable "puntS"
    puntS = "x:" + x + ",y:" + y;
  
    //Se calcula la distancia entre el punto de origen y el final
    //-----------------------------------------------------------------------
    //It calculates the distance between the point of origin and final
    distancia  = dist(x,y,_x,_y);
  
    //Se inicaliza la variable "puntos" y se calculan las cordenadas de cada paso
    //-----------------------------------------------------------------------------
    //The variable "points" inicaliza and the coordinates of each step are calculated
    puntos = new float[2][n];
  
    for(int i = 0 ; i < n - 1;i++){
    
      puntos[0][i] = ((i+1)*(_x - x)/n) + x;
      puntos[1][i] = ((i+1)*(_y - y)/n) + y;
    }
  
    //Se colocan las coordenadas del punto final que es el mismo que el punto de destino
    //-----------------------------------------------------------------------------------
    //The coordinates of the end point is the same place that the destination
    puntos[0][n-1] = _x;
    puntos[1][n-1] = _y;
  
  
    //Se crea la secuencia
    //------------------------------------------------------------------------------------
    //Sequence is created
    seq.beginSequence();
  
    //se agregan cada paso a la secuencia
    //----------------------------------------------------------------------------------------
    //each step are added to the sequence
    for(int i = 0 ; i < n ;i++){
      puntS = "x:" + puntos[0][i] + ",y:" + puntos[1][i];
      seq.add(Ani.to(this, distancia/vel.x, puntS));
       println(distancia/vel.x);
    }
   
 
    seq.endSequence();

  //Iniciar la secuencia completa
  //----------------------------------------------------------------------------------------
  // start the whole sequence
    seq.start();
  }
  
  void draw(){
      //se rota y dibuja la marioneta sin modificar lo demas
      //-------------------------------------------------------------------------------------
      //rotates and draws puppet without modifying the rest
      pushMatrix();
      translate(x + imgC.width/2,y + imgC.height/2);
      rotate(radians(ang));
      image(imgC,-imgC.width/2,-imgC.height/2);
      popMatrix();

  }
}

