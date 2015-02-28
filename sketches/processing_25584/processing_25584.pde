

/* @pjs preload='data/canica_roja.png,data/canica_verde.png,data/canica_negra.png,data/canica_azul.png,data/canica_amarilla.png,data/canica_marron.png,data/canica_morada.png,data/cuadro.png,data/explosion0.png,data/explosion1.png,data/explosion2.png'; */


Boolean en_juego=false;

float alfa;

int no_mapa=0;
int mx=-2;
int my=-2;
int posicion;

int nivel=0;
int no_canicas=3;
int total_canicas=7;
int max_no_canicas=7;

int cantidad_a_sumar=10;
int puntos=0;
int limite_puntos=5000;
int temporizador_puntaje=0;
Boolean activar_temporizador=false;


int width=600;
int height=600;

PFont font;
PFont fuente_mediana;

PImage[] img_canicas=new PImage[total_canicas];
PImage[] img_explosion=new PImage[7];
PImage image_cuadro;

Operaciones op;
ArrayList canicas;
ArrayList columna;
ArrayList explosiones;

Cuadro cuadro;
int huecos=99;

String s="";

int[] tmp1=new int[4];
int[] tmpx=new int[4];
int[] tmpy=new int[4];

//  SETUP



void setup(){

  canicas=new ArrayList();
  columna=new ArrayList();
  explosiones=new ArrayList();

  img_canicas[0]=loadImage("data/canica_roja.png");
  img_canicas[1]=loadImage("data/canica_verde.png");
  img_canicas[2]=loadImage("data/canica_marron.png");
  img_canicas[3]=loadImage("data/canica_morada.png");
  img_canicas[4]=loadImage("data/canica_azul.png");
  img_canicas[5]=loadImage("data/canica_amarilla.png");
  img_canicas[6]=loadImage("data/canica_negra.png");

  image_cuadro=loadImage("data/cuadro.png");

  img_explosion[0]=loadImage("data/explosion0.png");
  img_explosion[1]=loadImage("data/explosion1.png");
  img_explosion[2]=loadImage("data/explosion2.png");

 fuente_mediana=loadFont("AmericanTypewriter-24.vlw");
 font=loadFont("TheSans-Plain-12.vlw");
 textFont(font);

  /*
  fuente_grande=loadFont("Ziggurat-HTF-Black-32.vlw");
  textFont(fuente_grande);
*/

  cuadro=new Cuadro();
  op=new Operaciones();


  cuadro.Iniciar_cuadro(no_mapa);

  int tmpx=520;
  int tmpy=200;

   for(int i=0;i<4;i++){
    Canica Ica=new Canica();
    int tipo=int(random(no_canicas));
    Ica.Asignar_valores(0,tipo,tmpx,tmpy,img_canicas[tipo]);
    tmpy-=50;
    columna.add(Ica);
  }

  //cursor(CROSS);
 
  size(width,height);

}


//  DRAW

void draw() {
  
  if(en_juego){

  background(255,200,0);

  //fill(255,255,255);
  //text(s,50,50);

  fill(255,50,0);
  textFont(font);
  text("PUNTOS",20,80);
  text(puntos,20,100);


  if(activar_temporizador){
    textFont(fuente_mediana);
    text("LEVEL UP",230,60);
    temporizador_puntaje--;
    if(temporizador_puntaje<=0){
      activar_temporizador=false;
    }
  }

  cuadro.Dibujar_cuadro();

   for(int i=0;i<columna.size();i++){
      Canica Ica=(Canica)columna.get(i);
      Ica.Dibujar_canica();
  }

    for(int i=0;i<canicas.size();i++){
      Canica Ica=(Canica)canicas.get(i);
      Ica.Dibujar_canica();
    }

    for(int i=0;i<explosiones.size();i++){
      Explosion Sion=(Explosion)explosiones.get(i);
      image(img_explosion[Sion.frame],Sion.ex,Sion.ey);
      Sion.Animar();
      if(Sion.fin_explosion){
        explosiones.remove(i);
      }
    }

    //String h=(huecos);
    //text(h,50,100);

   /* 
    for(int j=0;j<canicas.size();j++){
      Canica Ica=(Canica)canicas.get(j);
      String s=(Ica.posicion);
      text(s,Ica.cx,Ica.cy);
      String ss=(cuadro.estado[Ica.posicion]+" "+cuadro.marcar_eliminar[Ica.posicion]);
      text(ss,Ica.cx,Ica.cy+20);
        }

    int linea;
    for(int i=0;i<cuadro.dimension;i++){
      for(int j=0;j<cuadro.dimension;j++){
       if(i>=1){
        linea=i*10;
      }
        String s=(linea+j);
        text(s,cuadro.cuadrante[linea+j][0],cuadro.cuadrante[linea+j][1]+20);//50 original
      }
    }
    */
  }

  if(!en_juego){

    fill(0,0,0);
    textFont(font);
    text("I found this game in the internet some years ago",20,20);
    text("but due to the impossibility to find it again",20,40);
    text("I decided to make it on my own.",20,60);
    text("If you are the original author and you want to",20,80);
    text("figure in the credits, or you want to remove",20,100);
    text("this version from que internet, please contact",20,120);
    text("me at \"bask3rbill@gmail.com\"",20,140);
    
    fill(255,0,0);
    text("CLICK TO START",230,400);

    fill(0,0,0);
    text("How to play:",20,220);
    text("Obtain a line of 4 equal balls",20,240);
    text("horizontally, vertically or in diagonal",20,260);
 

  }
   
} 



void mousePressed(){

  if(en_juego){

  s=(mouseX+" "+mouseY);
 
  
  //  A�adimos canica nueva al cuadrante con los datos de la �ltima de la columna
  //  y bajamos un puesto las de la columna

  if(mouseX>100&&mouseX<500&&mouseY>100&&mouseY<500){

  Canica Col=(Canica)columna.get(0);
  int tipo_activo=Col.tipo;

  Encontrar_cuadrante(tipo_activo);
 
  if(mx!=-2&&my!=-2){

  Canica Ica=new Canica();
  Ica.Asignar_valores(posicion,tipo_activo,mx,my,img_canicas[tipo_activo]);
  canicas.add(Ica);
  huecos--;

  columna.remove(0);  

  for(int i=0;i<columna.size();i++){
    Canica Col1=(Canica)columna.get(i);
    Col1.cy+=50;
  }

  Canica Nueva=new Canica();
    int tipo=int(random(no_canicas));
    Nueva.Asignar_valores(0,tipo,520,40,img_canicas[tipo]);
    columna.add(Nueva);


     Boolean poner_mas_canicas=Comprobar_como_para();

     if(poner_mas_canicas){

      Poner_canicas_aleatoriamente();
      Actualizar();

       }

     }

    }//if mouseX y mouseY dentro del cuadro

     Boolean nulo=Comprobar_como_para();
      Actualizar();


  }

  if(!en_juego){
    en_juego=true;
  }


  }// MousePressed




  void Poner_canicas_aleatoriamente(){

    for(int i=0;i<3;i++){

    Boolean ok=false;

    while(!ok){

      int lugar=int(random(99));

		if(cuadro.estado[lugar]==-1){
			
			Canica Nueva=new Canica();
			int tipo=int(random(no_canicas));

			Nueva.Asignar_valores(lugar,tipo,cuadro.cuadrante[lugar][0],cuadro.cuadrante[lugar][1],img_canicas[tipo]);
			cuadro.estado[lugar]=tipo;

			canicas.add(Nueva);	

			ok=true;
			huecos--;
			if(huecos<=3){
			   fin_de_juego();
			    }
	    	}
	   }
	  
	}


}


void Encontrar_cuadrante(int Tipo){
		

	for(int i=0;i<cuadro.dimension*cuadro.dimension;i++){
		
		if(mouseX>cuadro.cuadrante[i][0]&&mouseX<cuadro.cuadrante[i][0]+40){

			if(mouseY>cuadro.cuadrante[i][1]&&mouseY<cuadro.cuadrante[i][1]+40){

				mx=-2;
				my=-2;

				if(cuadro.estado[i]==-1) {
					mx=cuadro.cuadrante[i][0];
					my=cuadro.cuadrante[i][1];
					cuadro.estado[i]=Tipo;
					posicion=i;
	      }
			}
		}

	}

}



// Aqu� llega cuando lo matan

Boolean Comprobar_como_para(){

  cuadro.Comprobar();
  Boolean devolver_falso=false;


    for(int j=0;j<canicas.size();j++){
      Canica Ica=(Canica)canicas.get(j);

      if(cuadro.marcar_eliminar[Ica.posicion]==1){
        
        cuadro.estado[Ica.posicion]=-1; 
        cuadro.marcar_eliminar[Ica.posicion]=-1;
        canicas.remove(j);
      //  devolver_falso=true;
        Explosion Sion=new Explosion();
        Sion.Iniciar_explosion(cuadro.cuadrante[Ica.posicion][0],cuadro.cuadrante[Ica.posicion][1]);
        explosiones.add(Sion);
        puntos+=cantidad_a_sumar;
        Comprueba_puntos();
        huecos++;
        devolver_falso=true;
    
      }
    }

if(devolver_falso){
  return false;
}

return true;

}

void Actualizar(){

 cuadro.Comprobar();

 for(int j=0;j<canicas.size();j++){
      Canica Ica=(Canica)canicas.get(j);

      if(cuadro.marcar_eliminar[Ica.posicion]==1){
         
        cuadro.estado[Ica.posicion]=-1; 
        cuadro.marcar_eliminar[Ica.posicion]=-1;
        canicas.remove(j);
      //  devolver_falso=true;
        Explosion Sion=new Explosion();
        Sion.Iniciar_explosion(cuadro.cuadrante[Ica.posicion][0],cuadro.cuadrante[Ica.posicion][1]);
        explosiones.add(Sion);
        puntos+=cantidad_a_sumar;
        Comprueba_puntos();
        huecos++;

      }
    }

}



void fin_de_juego(){

  Limpiar_cuadro();

  puntos=0;
  no_canicas=3;

  for(int i=0;i<columna.size();i++){
    columna.remove(i);
  }

  int tmpx=520;
  int tmpy=200;

   for(int i=0;i<4;i++){
    Canica Ica=(Canica)columna.get(i);
    int tipo=int(random(no_canicas));
    Ica.Asignar_valores(0,tipo,Ica.cx,Ica.cy,img_canicas[tipo]);
    tmpy-=50;
    if(i>1){
    columna.add(Ica);
    }
  }

   //en_juego=false;

}


void Comprueba_puntos(){

 if(puntos==limite_puntos){

    Limpiar_cuadrante();

    limite_puntos+=5000-no_canicas*1000;//1000;
    activar_temporizador=true;
    temporizador_puntaje=100;
    cantidad_a_sumar+=0;//10
    no_canicas++;
    if(no_canicas>max_no_canicas){
      no_canicas=3;
      limite_puntos=1000;
      cantidad_a_sumar=10;
    }
  }

}


void Limpiar_cuadrante(){

  Limpiar_cuadro();

 for(int i=0;i<canicas.size();i++){
    Canica Ica=(Canica)canicas.get(i);
    canicas.remove(i);
  }

}

void Limpiar_cuadro(){

  for(int i=0;i<cuadro.dimension*cuadro.dimension;i++){
    cuadro.estado[i]=-1;
    cuadro.marcar_eliminar[i]=1;
      Comprobar_como_para();
  }

  for(int i=0;i<cuadro.dimension*cuadro.dimension;i++){
    cuadro.marcar_eliminar[i]=-1;
  }

}



//  Fin de Clase Principal
//End Class "koul.pde"



 
//Class "Cuadro.pde"

class Cuadro{

  int dimension;
  int[] estado;
  int[] marcar_eliminar;

  int[][] cuadrante;

  // estado:  -1 -> vacio
  //          0 -> c      roja
  //          1 ->        verde
  //          2 ->        negra

  void Iniciar_cuadro(int n){
    switch(n){
      case 0:
        dimension=10;
            break;

      default:
            break;
    }

    estado=new int[dimension*dimension];
    for(int i=0;i<dimension*dimension;i++){
          estado[i]=-1;
    }
    marcar_eliminar=new int[dimension*dimension];
    for(int i=0;i<dimension*dimension;i++){
      marcar_eliminar[i]=-1;
    }

    n=0;
    int incremento_x=100;
    int incremento_y=100;
    cuadrante=new int[dimension*dimension][2];

    for(int i=0;i<dimension;i++){
      for(int j=0;j<dimension;j++){
          cuadrante[n][0]=incremento_x;
          cuadrante[n][1]=incremento_y;
          n++;
          incremento_x+=40;
      }
      incremento_x=100;
      incremento_y+=40;
  }

 }



  void Dibujar_cuadro(){
    
        int cx=100;
        int cy=100;  

        int incremento_x=0;
        int incremento_y=0;

        int n=0;

        for(int i=0;i<dimension;i++){
          for(int j=0;j<dimension;j++){
              image(image_cuadro, cx+incremento_x, cy+incremento_y);
              incremento_x+=40;
              n++;
          }
          incremento_x=0;
          incremento_y+=40;

        }

  }




  //He aquí el meollo de la question

  void Comprobar(){


  // Horizontales
  int linea=0;

	for(int i=0;i<dimension;i++){
    if(i>=1){linea=i*10;}

		for(int j=0;j<dimension-3;j++){ //dimension-2

    if(estado[linea+j]!=-1){

    if(estado[linea+j]==estado[linea+j+1]&&estado[linea+j]==estado[linea+j+2]&&estado[linea+j]==estado[linea+j+3]){

                marcar_eliminar[linea+j]=1;
                marcar_eliminar[linea+j+1]=1;
                marcar_eliminar[linea+j+2]=1;
                marcar_eliminar[linea+j+3]=1;

              }

            }

          }//j
    }//i


  //Verticales
  linea=0;

  for(int i=0;i<dimension;i++){
    
        for(int j=0;j<dimension-3;j++){
          linea=j;
          if(j>=1){linea=j*10;}

          int tmp=int(linea+i);

          if(estado[tmp]!=-1){

          if(estado[tmp]==estado[tmp+10]&&estado[tmp]==estado[tmp+20]&&estado[tmp]==estado[tmp+30]){

                marcar_eliminar[tmp]=1;
                marcar_eliminar[tmp+10]=1;
                marcar_eliminar[tmp+20]=1;
                marcar_eliminar[tmp+30]=1;

                }
               }
              }//j
            }//i

  //  diagonal derecha 
  
  
  int limite=0;
  int j;

  for(int n=6;n>-7;n--){  //n>-1
    
    if(limite<7){
    limite++;
    }

    for(int i=0;i<limite;i++){

    j=(n+i)*10;

  if((j+i)>=0 && (j+30+i+3)<100){

    if(estado[j+i]!=-1&&j>=0){
    if(estado[j+i]==estado[j+10+i+1]&&estado[j+i]==estado[j+20+i+2]&&estado[j+i]==estado[j+30+i+3]){
      marcar_eliminar[j+i]=1;
      marcar_eliminar[j+10+i+1]=1;
      marcar_eliminar[j+20+i+2]=1;
      marcar_eliminar[j+30+i+3]=1;
      }
    }

    }
   }//j+i>0
    
  }//n


// diagonal izquierda

  limite=9;

  for(int n=6;n>=-6;n--){

    if(limite>3){
       limite--;
       }

      for(int i=9;i>limite-6;i--){

      j=(n)*10;



      if((j+i)>=0 && (j+i)<100 && (j+30+i-3)>0 && (j+30+i-3)<100){
          
       if(estado[j+i]!=-1){
        
        if(estado[j+i]==estado[j+10+i-1]&&estado[i+j]==estado[j+20+i-2]&&estado[i+j]==estado[j+30+i-3]){

          marcar_eliminar[j+i]=1;
          marcar_eliminar[j+10+i-1]=1;
          marcar_eliminar[j+20+i-2]=1;
          marcar_eliminar[j+30+i-3]=1;

                }
                
        }//j+i>0
      }
    }
  }


  }


  void Eliminar_cuadro(){

  }

  Cuadro(){

  }


}
// End Class "Cuadro.pde"

//Class "Canica.pde"

class Canica{

  int cx;
  int cy;

  int tipo;
  int posicion;

  PImage img_canica_activa;

  void Iniciar_canica(){

    //se inician los valores de modo aleatorio aqui

    //tipo canica  1 -> roja
    //             2 -> verde
    //             3 -> negra

  }

  void Asignar_valores(int Posicion,int Tipo, int Cx, int Cy,PImage Image){

    img_canica_activa=Image;

    posicion=Posicion;
    cx=Cx;
    cy=Cy;
    tipo=Tipo;

  }

  void Dibujar_canica(){
    
    image(img_canica_activa,cx,cy);

  }

  void Eliminar_canica(){

  }

  Canica(){

  }

}

// End Class "Canica.pde"

//Class "Explosion.pde"
  

class Explosion{


  int ex;
  int ey;

  int frame;
  int count;

  Boolean fin_explosion=false;

  void Iniciar_explosion(int Ex,int Ey){

    ex=Ex;
    ey=Ey;
    count=0;
    frame=0;

  }


  void Animar(){
    
   count++;

   if(count >=10){
    count=0;
    frame++;
    if(frame>2){
      fin_explosion=true;
      } 
   }

  }


  Explosion(){
  }

}
  
  
//End Class "Explosion.pde"  
//Class "Operaciones.pde"
//                          OPERACIONES

class Operaciones{


  float Distancia_puntos(float a, float b, float a1, float b1){

    float dist=sqrt((a1-a)*(a1-a)+(b1-b)*(b1-b));

    return dist;
  }


  Boolean Se_cruzan(float xi, float yi, float xf, float yf, float ai, float bi, float af, float bf){
  
      float vx=xf-xi;
      float vy=yf-yi;
      
      float v2x=af-ai;
      float v2y=bf-bi;

      if(v2x-vx==0){
        return false;
      }
      if(v2y-vy==0){
        return true;//false;
      }
      
      return false;//true;
  }

  Operaciones(){
  }

}

//End Class "Operaciones.pde"



