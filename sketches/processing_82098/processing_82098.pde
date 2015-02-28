
Gota[] gotas= new Gota[1000]; //declaracion de variable TIPO arreglo o array
//q se llama gotas y contiene 1000 elementos tipo gota
int totalgotas=0; 
//nueva variable para saber cuantas gotas han salido

void setup (){
  size (1000,800);
  smooth();
 background(0);
} 


void draw (){
  fill(0,40);
  rect(0,0,width,height); //estela de las gotas
  
  //iniciar las gotas
  gotas[totalgotas]=new Gota();
  //sumar el numero de gotas: esto equivale a la frase:
  // totalgotas= totalgotas+1
  totalgotas++;
  //si llegamos al fonal delas gotas...
  if (totalgotas >= gotas.length){
    totalgotas=0; //empezar de nuevo
 } 
  
  //hacer llover y mostrar
  for (int i=0; i < totalgotas; i++){
    //for loop para el verbo llover y mostrar a todas las gotas
    //y a cada una por una...
    gotas[i].llover();
    gotas[i].mostrar();
    gotas[i].rebotar();
  }
}  
    

