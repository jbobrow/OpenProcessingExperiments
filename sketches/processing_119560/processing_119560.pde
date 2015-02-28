
/*
---------------------------
  Created by Jose Gonzalez
  Colombia - 2010
---------------------------
*/

cubo[] cubos = new cubo[1];
cuadrante cuadrantes = new cuadrante();
int j=0;

void setup(){
  size(200,500);  
  cubos[0]= new cubo();
}

void draw(){
  background(0);
  stroke(#ffffff);
  line(40,0,40,500);
  line(80,0,80,500);
  line(120,0,120,500);
  line(160,0,160,500);
  line(0,250,200,250);
  
  if(cuadrantes.perdiste==true){println("Perdiste!!!!!!!!!");}
  
  for(int i=0; i<cubos.length; i++){
     if(i%2==0){fill(#119B12);
    } else if(i%3==0){fill(#2335A0);
  }else{fill(#B40909);}
  
    cubos[i].displayCubo();
    cubos[i].moverCubo();
    cuadrantes.CompCuadrantes();
    crearCubo();
  }
  
 
  }  


void crearCubo(){
if((cubos[j].y==cubos[j].Fondo1)||
   (cubos[j].y==cubos[j].Fondo2)||
   (cubos[j].y==cubos[j].Fondo3)||
   (cubos[j].y==cubos[j].Fondo4)||
   (cubos[j].y==cubos[j].Fondo5)){
    cubo N= new cubo();
    cubos=(cubo[]) append(cubos, N);
    j=j+1;
}
//hace que caigan hasta la fila 1//
if (cuadrantes.cuadrante1==true)
{cubos[(cubos.length)-1].Fondo1=420;}
if (cuadrantes.cuadrante2==true)
{cubos[(cubos.length)-1].Fondo2=420;}
if (cuadrantes.cuadrante3==true)
{cubos[(cubos.length)-1].Fondo3=420;}
if (cuadrantes.cuadrante4==true)
{cubos[(cubos.length)-1].Fondo4=420;}
if (cuadrantes.cuadrante5==true)
{cubos[(cubos.length)-1].Fondo5=420;}

//hace que caiga hasta la fila 2//
  if(cuadrantes.linea1==true)
  {cubos[(cubos.length)-1].Fondo1=380;}
  if(cuadrantes.linea2==true)
  {cubos[(cubos.length)-1].Fondo2=380;}
  if(cuadrantes.linea3==true)
  {cubos[(cubos.length)-1].Fondo3=380;}
  if(cuadrantes.linea4==true)
  {cubos[(cubos.length)-1].Fondo4=380;}
  if(cuadrantes.linea5==true)
  {cubos[(cubos.length)-1].Fondo5=380;}

//hace que caiga hasta la fila 3//

if(cuadrantes.linea12==true)
  {cubos[(cubos.length)-1].Fondo1=340;}
  if(cuadrantes.linea22==true)
  {cubos[(cubos.length)-1].Fondo2=340;}
  if(cuadrantes.linea32==true)
  {cubos[(cubos.length)-1].Fondo3=340;}
  if(cuadrantes.linea42==true)
  {cubos[(cubos.length)-1].Fondo4=340;}
  if(cuadrantes.linea52==true)
  {cubos[(cubos.length)-1].Fondo5=340;}
  
  //hace que caiga hasta la fila 4//

if(cuadrantes.linea13==true)
  {cubos[(cubos.length)-1].Fondo1=300;}
  if(cuadrantes.linea23==true)
  {cubos[(cubos.length)-1].Fondo2=300;}
  if(cuadrantes.linea33==true)
  {cubos[(cubos.length)-1].Fondo3=300;}
  if(cuadrantes.linea43==true)
  {cubos[(cubos.length)-1].Fondo4=300;}
  if(cuadrantes.linea53==true)
  {cubos[(cubos.length)-1].Fondo5=300;}


}
class cuadrante{
  boolean cuadrante1;
  boolean cuadrante2;
  boolean cuadrante3;
  boolean cuadrante4;
  boolean cuadrante5;
  
  boolean linea1;
  boolean linea2;
  boolean linea3;
  boolean linea4;
  boolean linea5;
  
  boolean linea12;
  boolean linea22;
  boolean linea32;
  boolean linea42;
  boolean linea52;
  
  boolean linea13;
  boolean linea23;
  boolean linea33;
  boolean linea43;
  boolean linea53;
  
  boolean perdiste;
  
  cuadrante(){
    cuadrante1=false;
    cuadrante2=false;
    cuadrante3=false;
    cuadrante4=false;
    cuadrante5=false;
    
    linea1=false;
    linea2=false;
    linea3=false;
    linea4=false;
    linea5=false;
    
    linea12=false;
    linea22=false;
    linea32=false;
    linea42=false;
    linea52=false;
    
    linea13=false;
    linea23=false;
    linea33=false;
    linea43=false;
    linea53=false;
    
    perdiste=false;
  }
  void CompCuadrantes(){
     //---------linea 0 completa----------//
    if ((cuadrante1==true)&&(cuadrante2==true)&&
        (cuadrante3==true)&&(cuadrante4==true)&&
        (cuadrante5==true)){
         
           cuadrante1=false;cuadrante2=false;
           cuadrante3=false;cuadrante4=false;
           cuadrante5=false;
           
           linea1=false;linea2=false;linea3=false;
           linea4=false;linea5=false;
           
           linea12=false;linea22=false;linea32=false;
           linea42=false;linea52=false;
           
           linea13=false;linea23=false;linea33=false;
           linea43=false;linea53=false;
           
          for(int i=0; i<(cubos.length); i++){
        
        //Para eliminar solo los de la ultima linea//
        if(cubos[i].y==460){
        cubos[i].Lcompleta();}
        //Para bajar los de arriba//
        else{
        //Baja linea 1// 
          if(cubos[i].y==420){
             cubos[i].Fondo1=460;cubos[i].Fondo2=460;
             cubos[i].Fondo3=460;cubos[i].Fondo4=460;
             cubos[i].Fondo5=460;}
        //Baja linea 2// 
          if(cubos[i].y==380){cubos[i].Fondo1=420;cubos[i].Fondo2=420;
             cubos[i].Fondo3=420;cubos[i].Fondo4=420;
             cubos[i].Fondo5=420;}
        //baja linea 3//
          if(cubos[i].y==340){cubos[i].Fondo1=380;cubos[i].Fondo2=380;
             cubos[i].Fondo3=380;cubos[i].Fondo4=380;
             cubos[i].Fondo5=380;}
        //baja linea 4//
          if(cubos[i].y==300){cubos[i].Fondo1=340;cubos[i].Fondo2=340;
             cubos[i].Fondo3=340;cubos[i].Fondo4=340;
             cubos[i].Fondo5=340;}
        
      }
  }
  }
  
  
}}
class cubo{
  float x;
  float y;
  float Fondo1;
  float Fondo2;
  float Fondo3;
  float Fondo4;
  float Fondo5;

  cubo(){
    x=80;
    y=-30;
    Fondo1=460;
    Fondo2=460;
    Fondo3=460;
    Fondo4=460;
    Fondo5=460;
  }
  
void  displayCubo(){
  
  rect(x,y,40,40);
  }
  
//--------------------------------------// 
  void moverCubo(){
    
 //antes de la mitad
 
 if(y<=250){
      y=y+2;
    if ((mouseX>=0)&&(mouseX<40)&&(mousePressed)) {
      x=0;
    } if ((mouseX>=40)&&(mouseX<80)&&(mousePressed)) {
      x=40;}
    if (keyCode == DOWN){
     y=y+1;
   } if ((mouseX>=80)&&(mouseX<120)&&(mousePressed)){
     x=80;
   } if ((mouseX>=120)&&(mouseX<160)&&(mousePressed)){
     x=120;
   }
   if ((mouseX>=160)&&(mousePressed)){
     x=160;
   }
   
   //-----quieto desp de la mitad-----//
   
      } else{
        if((x<40)&&(x>=0)){
        y=Fondo1;
        x=0;
        cuadrantes.cuadrante1=true;
        if(y==420){cuadrantes.linea1=true;}
        if(y==380){cuadrantes.linea12=true;}
        if(y==340){cuadrantes.linea13=true;}
        if(y==300){cuadrantes.perdiste=true;}
      } if((x>=40)&&(x<80)){
        y=Fondo2;
        x=40;
        cuadrantes.cuadrante2=true;
        if(y==420){cuadrantes.linea2=true;}
        if(y==380){cuadrantes.linea22=true;}
        if(y==340){cuadrantes.linea23=true;}
        if(y==300){cuadrantes.perdiste=true;}
      }  if((x>=80)&&(x<120)){
        y=Fondo3;
        x=80;
        cuadrantes.cuadrante3=true;
        if(y==420){cuadrantes.linea3=true;}
        if(y==380){cuadrantes.linea32=true;}
        if(y==340){cuadrantes.linea33=true;}
        if(y==300){cuadrantes.perdiste=true;}
      } if((x>=120)&&(x<160)){
        y=Fondo4;
        x=120;
        cuadrantes.cuadrante4=true;
        if(y==420){cuadrantes.linea4=true;}
        if(y==380){cuadrantes.linea42=true;}
        if(y==340){cuadrantes.linea43=true;}
        if(y==300){cuadrantes.perdiste=true;}
      }  if((x>=160)&&(x<200)){
        y=Fondo5;
        x=160;
        cuadrantes.cuadrante5=true;
        if(y==420){cuadrantes.linea5=true;}
        if(y==380){cuadrantes.linea52=true;}
        if(y==340){cuadrantes.linea53=true;}
        if(y==300){cuadrantes.perdiste=true;}
      }
         if(x<0){
        y=460;
        x=-40;
      }
} 
 
  
}

void Lcompleta(){
  x=-40;
  y=460;

}



}


