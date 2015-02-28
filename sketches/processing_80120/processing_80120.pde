
//import processing.video.*;

//MovieMaker circulos;

Gota [] gotas = new Gota [1000];//declaracion de veriable TIPO ARREY (arreglo) que se llama "gotas" y contiene 100 elementos tipo "Gota"

int totalgotas =0; //nueva variable para saber cuantas gotas han salido (porq despues empieza desde 0 gotas hasta las 1000 gotas)

void setup (){
  size (1000,700);
  smooth ();
   background (0);
   
 //  circulos = new MovieMaker (this,width,height,"circulos_re_pop");
}

void draw (){
  
//  circulos.addFrame();
    fill(0,10);//color negro del rectangulo y trasparencia
  rectMode(CORNER);
  rect(0,0,width,height);//rectangulo que cubre todo el fondo,supliendo la recreacion del background,para poder crear las estelas
 
  
  //iniciar las gotas :
  gotas [totalgotas]= new Gota ();
  // sumar al numero de gotas: Esto equivale a la frase:
  // "totalgotas=totalgotas+1;"
  totalgotas++;
  
  
  //si llegamos al final de las gotas.....
  if (totalgotas >= gotas.length){
    totalgotas =0; //empezar de nuevo
  }
  
  
  //llamados a hacer llover y mostrar
  for (int i =0; i< totalgotas; i++){
    
    //for loop para otorgar el verbo "llover" y "mostrar" a todas las gotas y a cada una, una por una...
    gotas[i].llover();
    gotas[i].mostrar();
    gotas[i].quedarsequietas();
  }
}

void keyPressed (){
  if (key == ' '){
  //  circulos.finish();
    exit();
  }
}
  

