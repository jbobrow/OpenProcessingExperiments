
ClasePosIntera PosInteract;
//EsferaC esfera1;
PImage[] img = new PImage[8];
PImage[] img2 = new PImage[8];
PersonajeP rana;
int i;

void setup() {
  size(500,500);//Tamaño de la ventana
  smooth();
  background(255,126,0);//color del fondo
  
  //img2 = loadImage("2.png");//Imagen quietea
  
  // inicializar area de interaccion
  PosInteract = new ClasePosIntera(round(width*0),round(height*0),false); 
  
  //Inicializa objeot o imagen que estara en movimiento
  //esfera1 = new EsferaC(PosInteract.posX,PosInteract.posY,PosInteract.finX,height/2 + img.height/4,width/2,height/2,img.width/2,img.height/2);
  ImagenPersonaje();
  rana = new PersonajeP(width/2,height/2,img,img2);
}

void ImagenPersonaje(){
  for( i = 0 ; i < 2;i++){
    img[i] = loadImage("1.png");
  }
  for( i = 2 ; i < 4;i++){
    img[i] = loadImage("2.png");
  }
  for( i = 4 ; i < 6;i++){
    img[i] = loadImage("3.png");
  }
  for( i = 6 ; i < 8;i++){
    img[i] = loadImage("4.png");//Imagen en movimiento
  }
  
  for( i = 0 ; i < 2;i++){
    img2[i] = loadImage("correr/1.png");
  }
  for( i = 2 ; i < 4;i++){
    img2[i] = loadImage("correr/2.png");
  }
  for( i = 4 ; i < 6;i++){
    img2[i] = loadImage("correr/3.png");
  }
  for( i = 6 ; i < 8;i++){
    img2[i] = loadImage("correr/2.png");
  }
  /*for( i = 8 ; i < 10;i++){
    img2[i] = loadImage("correr/1.png");
  }
  for( i = 10 ; i < 12;i++){
    img2[i] = loadImage("correr/2.png");
  }
  for( i = 12 ; i < 12;i++){
    img2[i] = loadImage("correr/3.png");
  }*/
  
}

void draw(){
  //color de fondo y cuadro para borrar todo cada farme 
  fill(255,126,0);
  rect(0,0,width,height);
  
  //dibuja la zona interactiva si esta avilitada
  PosInteract.dibujar();
  
  fill(0);
  //comprueba si el mouse esta dentro de la zona interactiva
  if ((mouseX > PosInteract.posX) && (mouseX <(PosInteract.finX)) && ((mouseY > PosInteract.posY) && (mouseY <(PosInteract.finY)) ) ){
    //actualiza la nueva pocicion del objeto o imagen
    //esfera1.actualizar();
    //detecta si la siguente pocicion del objeto/imagen no se encuentra fuera 
    //de los limites establecidos, estos limites no son necesariamente iguales
    //a los limites de la zona interactiva
    //esfera1.detectarLimt();
    rana.Mover();
    //rana.dibujar();
      
  }//else{
    //cuando el mouse se encuenta fuera de la zona interactiva el objeto/imagen
    //regresa a la pocicion original
    //esfera1.Regreso();
    //rana.DibjEstatico();
  //}
  //dibuja el objeto/imagen en su nueva pocicion
  //esfera1.Mostrar();
  //dibuja la imagen estatica y hasta el frente
  //image(img2,width/2 - img2.width/4,PosInteract.finY - img2.height/2,img2.width/2,img2.height/2);
}

//clase que crea la zona interactiva
class ClasePosIntera{
  int posX,finX;//limites en el eje x de la zona interactiva
  int posY,finY;//limites en el eje y de la zona interactiva
  boolean DibujarA;//condicion de mostrar la zona interactiva, solo con fines para desarrollo

  //inicializacion de la sona interactiva, siempre es un cuadrado
  ClasePosIntera(int _x, int _y, boolean _Dib){
    DibujarA  = _Dib;
    posX = _x;
    posY = _y;
    finX = width - posX;
    finY = height - posY;
    
  }
  //dibuja la zona interactiva
  void dibujar(){
    if (DibujarA){  
      fill(255);
      stroke(0);
      rect(posX,posY,finX - posX,finY - posY);
    }
  }
  
}//fin de la clase pos intera

//clase del objeto/imagen en movimiento
/*class EsferaC{
  PVector Pocicion;//vector de pocicion
  PVector Velocidad;//vector de velocidad para cambiar la pocicion
  int limtX1,limtX2,limtY1,limtY2;//variables de los limites de movimiento del objeto/imagen
  int x,y;//variables de la pocicion inicial del objeto/imagen
  int ancho,alto;//alto y ancho del objeto/imagen sirve tambien para escalar la imagen
  
  //inicializador del objeto/imagen
  EsferaC(int _l1,int _l2,int _l3,int _l4,int _x,int _y,int _anch,int _alT){
    Pocicion = new PVector(_x,_y);
    Velocidad = new PVector(random(-1,1),random(-1,0));//la velocidad se escoje alatoriamente
    limtX1 = _l1;
    limtY1 = _l2;
    limtX2 = _l3;
    limtY2 = _l4;
    x = _x;
    y = _y;
    ancho = _anch;
    alto = _alT;
  }
  
  //actualiza la pocicion sumandole la velocidad actual
  void actualizar(){
    Pocicion.add(Velocidad);
  }
  
  //dibuja el objeto en su nueva pocicion
  void Mostrar(){
    stroke(0);
    fill(0);
    //El dibujo puede ser una figura (elipse, cuadrado,etc) o una imagen
    //ellipse(Pocicion.x,Pocicion.y,ancho,alto);
    image(img,Pocicion.x - (ancho/2),Pocicion.y -(alto/2) ,ancho,alto);

  }
  
  //deteccion de los limites donde se mueve el objeto/imagen, si detecta
  //que se sale de los limites cambia la direccion de la velocidad y con 
  //esto la direccion de movimiento, creando efecto como si "rebotara"
  void detectarLimt(){
    if ( (Pocicion.x + ancho/2) > limtX2 || (Pocicion.x - ancho/2) < limtX1 ){
      Velocidad.x = -Velocidad.x;
    } 
    
    if ( (Pocicion.y + alto/2) > limtY2 || (Pocicion.y - alto/2) < limtY1){
      Velocidad.y = -Velocidad.y;
    } 
  }
  
  //cuando el mouse se sale de la sona interactiva esta función sirve para regresar a su
  //pocicion original al objeto/imagen, se calcula la magnitud del origen al punto actual
  //del objeto/imagen, el vector resultante se normaliza y se actualiza (con una suma)
  //el vector de Pocicion con estos nuevos datos de velocidad. La velocidad resultante
  //sera de 1, si se quiere aumentar o disminuir antes de actualizar la pocicion se multiplica
  //por algun numero el vector normalizado.
  void Regreso(){
    if (Pocicion.x != x || Pocicion.y != y){
    PVector dir = new PVector(x - Pocicion.x,y - Pocicion.y);
      if( abs(x - Pocicion.x) > 1 || abs(y - Pocicion.y) > 1){
        dir.normalize();
      }
      //dir.mult(5);
      Pocicion.add(dir);
    }else{
       Velocidad.x = random(-1,1);
       Velocidad.y = -1;
    }
    
  }


}//fin de la clase EsferaC*/

class PersonajeP{

  int TotalFarm;
  //PImage FarmA[];
  PImage CaminarFram[],CorrerFram[];
  int x,y;
  int k;
  PVector Pocicion;
  PVector Velocidad;
  
  PersonajeP(int _x,int _y,PImage _direc[],PImage _direcCorrer[]){
    //FarmA = _direc;
    FotogramaCaminar(_direc);
    FotogramaCorrer(_direcCorrer);
    x = _x;
    y = _y;
    //TotalFarm = FarmA.length;
    
    Pocicion = new PVector(_x,_y);
    //Velocidad = new PVector(random(-1,1),random(-1,0));//la velocidad se escoje alatoriamente
  }
  
  void FotogramaCaminar(PImage _direc[]){
   
  CaminarFram = _direc;  
  
  }
  
  void FotogramaCorrer(PImage _direc[]){
    CorrerFram = _direc;
  }
  
  void Mover(){
    
    
    if (Pocicion.x != mouseX || Pocicion.y != mouseY){
    PVector Velocidad = new PVector(mouseX - Pocicion.x,mouseY - Pocicion.y);
      if( abs(mouseX - Pocicion.x) > 1 || abs(mouseY - Pocicion.y) > 1 ){
        Velocidad.normalize();
        if (mousePressed == false){
          Velocidad.mult(2);
        }else{
           Velocidad.mult(5);
        }
        
      }
      
      //Pocicion.add(dir);
      Pocicion.add(Velocidad);
      dibujar();
    }else{
       //Velocidad.x = random(-1,1);
       //Velocidad.y = -1;
       DibjEstatico();
    }
    
    
    
  }
  
  void dibujar(){
   if (mousePressed == false){
     k = (k+1) % CaminarFram.length;
   
     image(CaminarFram[k],Pocicion.x,Pocicion.y);
   
   }else{
      k = (k+1) % CorrerFram.length;
   
     image(CorrerFram[k],Pocicion.x,Pocicion.y);
   
   }
  }
  
  void DibjEstatico(){
    image(CaminarFram[1],Pocicion.x,Pocicion.y);
  }

}

