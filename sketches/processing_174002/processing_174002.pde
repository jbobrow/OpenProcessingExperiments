
//paleta de colores
boolean botonrojo=false;
boolean botonverdelimon=false;
boolean botonverdebandera=false;
boolean azul=false;
boolean azulturquesa=false;
boolean cielo=false;
boolean morado=false;
boolean amarillo=false;
boolean anaranjado=false;
boolean negro=false;
boolean blanco=false;
boolean rosa=false;
boolean fiusha=false;
boolean cafe=false;
boolean cafeclaro=false;
boolean dorado=false;
boolean gris=false;
boolean vino=false;

//funciones
boolean lapiz=false;
boolean goma=false;
boolean circulo=false;
boolean cuadrados=false;
boolean nuevo=false;
 
void setup()
{
size(1000,500);
background(255);
smooth();
}

void draw()
 {
   
   //PALETA DE COLORES


//rojo
stroke(#FF0000);
  fill(#FF0000);
  rect(0,0,50,50);
  
//verdelimon
stroke(#26C41C);
fill(#26C41C);
rect(50,0,50,50);

//verdebandera
stroke(#076401);
fill(#076401);
rect(100,0,50,50);

//azul
stroke(#0006FF);
fill(#0006FF);
rect(150,0,50,50);

//azulturquesa
stroke(#30FAE7);
fill(#30FAE7);
rect(200,0,50,50);

//cielo
stroke(#1293FA);
fill(#1293FA);
rect(250,0,50,50);

//morado
stroke(#6B0476);
fill(#6B0476);
rect(300,0,50,50);

//amarillo
stroke(#F6FF00);
fill(#F6FF00);
rect(350,0,50,50);

//anaranjado
stroke(#FF6200);
fill(#FF6200);
rect(400,0,50,50);

//negro
stroke(0);
fill(0);
rect(450,0,50,50);

//blanco
stroke(0);
fill(255);
rect(500,0,50,50);

//rosa
stroke(#FAA2F0);
fill(#FAA2F0);
rect(550,0,50,50);

//fiusha
stroke(#FC08E0);
fill(#FC08E0);
rect(600,0,50,50);

//cafe
stroke(#361F02);
fill(#361F02);
rect(650,0,50,50);

//cafeclaro
stroke(#7C5B00);
fill(#7C5B00);
rect(700,0,50,50);

//dorado
stroke(#C6A444);
fill(#C6A444);
rect(750,0,50,50);

//gris
stroke(#9D9B95);
fill(#9D9B95);
rect(800,0,50,50);

//vino
stroke(#A01B0F);
fill(#A01B0F);
rect(850,0,50,50);

//FUNCIONES

//goma
stroke(0);
strokeWeight(1);
fill(255); 
rect(0,50,50,50);
fill( 255);
rect(15,65,20,20);
 
 //lapiz
 fill(255);
 rect(0,100,50,50);
 line(10,140,40,110);
 
 //circulo
 rect(0,150,50,50);
 ellipse(25,175,30,30);
 
 //cuadrados
 rect(0,200,50,50);
 rect(10,210,30,30);
 
 //nuevo
 stroke(0);
 fill(255);
 rect(900,0,100,50);
 line(910,10,910,40);
 line(910,10,920,40);
 line(920,40,920,10);
 line(930,10,930,40);
 line(930,10,940,10);
 line(930,25,935,25);
 line(930,40,940,40);
 line(950,10,960,40);
 line(960,40,965,20);
 line(965,20,970,40); 
 line(970,40,980,10);

//PALETA DE COLORES
  
  //rojo
  
  if(botonrojo==true){
   stroke(#FF0000);
   fill(#FF0000);
    rect(0,0,50,50);
  }

//verdelimon


if(botonverdelimon==true){
   stroke(#26C41C);
fill(#26C41C);
 

}
  
  //verdebandera
 
 if(botonverdebandera==true){
   stroke(#076401);
fill(#076401);
 }

   //azul
   
   if(azul==true){
     stroke(#0006FF);
     fill(#0006FF);
   
}
       
   //azulturquesa
   
   if(azulturquesa==true){
     stroke(#30FAE7);
     fill(#30FAE7);
     
}

 //cielo
 if(cielo==true){
   stroke(#1293FA);
   fill(#1293FA);
   
}
     
   //morado
 if(morado==true){
 stroke(#6B0476);
fill(#6B0476);
 
}
  
  //amarillo
  if(amarillo==true){
  stroke(#F6FF00);
  fill(#F6FF00);
  
  }
  
 //anaranjado
if(anaranjado==true){
stroke(#FF6200);
fill(#FF6200);
 
}

//negro
if(negro==true){
    stroke(0);
    fill(0);
     
}
  
//blanco
if(blanco==true){
  stroke(255);
  fill(255);
 
}

//rosa
if(rosa==true){
  stroke(#FAA2F0);
  fill(#FAA2F0);
   
}

//fiusha
if(fiusha==true){
  stroke(#FC08E0);
  fill(#FC08E0);
 }

//cafe
if(cafe==true){
  stroke(#361F02);
  fill(#361F02);
   }

//cafeclaro
if(cafeclaro==true){
  stroke(#7C5B00);
  fill(#7C5B00);
   }
 
//dorado
if(dorado==true){
  stroke(#C6A444);
  fill(#C6A444);
  }

//gris
if(gris==true){
  stroke(#9D9B95);
  fill(#9D9B95);
   }

//vino
if(vino==true){
  stroke(#A01B0F);
  fill(#A01B0F);
   }

//FUNCIONES

strokeWeight(3);

//goma
if(goma==true){
  if(mousePressed){
  noStroke();
  fill(255);
  rect(mouseX,mouseY,25,25);
 
}}

 //circulos
 if(circulo==true){
   if(mousePressed){
   ellipse(mouseX,mouseY,30,30);
  
   }
 }
 
 //cuadrados
 if(cuadrados==true){
   if(mousePressed){
     rect(mouseX,mouseY,30,30);
   }}
   
 //lapiz
  if(lapiz==true){
   if(mousePressed){
     line(mouseX,mouseY,pmouseX,pmouseY);}
  }
    
 //nuevo
 if(nuevo==true){
   noStroke();
   fill(255);
   rect(51,51,950,450);
   rect(0,251,51,250);
 
 }

}   
     
      void mousePressed()
 {
   //rojo
   if(mouseX>0 && mouseX<50 && mouseY>0 && mouseY<50){
   botonrojo=!botonrojo;

 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;



   stroke(#FF0000);}
   
   //verdelimon
   if(mouseX>50 && mouseX<100 && mouseY>0 && mouseY<50){

  
botonverdelimon=!botonverdelimon;
 
 botonrojo=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;
 
  }
   
   //verdebandera
   if(mouseX>100 && mouseX<150 && mouseY>0 && mouseY<50){
    
 botonverdebandera=!botonverdebandera;
 
  botonrojo=false;
 botonverdelimon=false;
 
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
 }
   
   //azul
      if(mouseX>150 && mouseX<200 && mouseY>0 && mouseY<50){
        
 azul=!azul;
 
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
}
   
   //azulturquesa
   if(mouseX>200& mouseX<250 && mouseY>0 && mouseY<50){
  
 azulturquesa=!azulturquesa;
 
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
}
   
   //cielo
    if(mouseX>250&&mouseX<300&& mouseY>0 && mouseY<50){
      
   cielo=!cielo;
 
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;
 
}
   
 //morado
if(mouseX>300&&mouseX<350 && mouseY>0 &&mouseY<50){

  morado=!morado;
 
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;

 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
}
  
  //amarillo
  if(mouseX>350&&mouseX<400 &&mouseY>0 && mouseY<50){
     
      amarillo=!amarillo;
 
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;

 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
}

//anaranjado
if(mouseX>400 && mouseY<450 && mouseY>0 && mouseY<50){

  anaranjado=!anaranjado;
  
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
 }

//negro
if(mouseX>450 && mouseX<500 && mouseY>0 && mouseY<50){

 negro=!negro;
 
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;

 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
 }


//blanco
if(mouseX>500 && mouseX<550 && mouseY>0 &&mouseY<50){

blanco=!blanco;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

 
}

//rosa

if(mouseX>550 && mouseX<600 && mouseY>0 &&mouseY<50){

rosa=!rosa;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;

 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;
 
}

//fiusha
if(mouseX>600 && mouseX<650 && mouseY>0 &&mouseY<50){

fiusha=!fiusha;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;

 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;
 
}

//cafe
if(mouseX>650 && mouseX<700 && mouseY>0 &&mouseY<50){

cafe=!cafe;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;

 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;
 
}

//cafeclaro
if(mouseX>700 && mouseX<750 && mouseY>0 &&mouseY<50){

cafeclaro=!cafeclaro;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 
 dorado=false;
 gris=false;
 vino=false;

 
 }
 
 //dorado
 if(mouseX>750 && mouseX<800 && mouseY>0 &&mouseY<50){

 dorado=!dorado;

  botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;

 gris=false;
 vino=false;
 
 
 }
 
 //gris
 if(mouseX>800 && mouseX<850 && mouseY>0 &&mouseY<50){

 gris=!gris;

  botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;

 vino=false;

 
 
 }

//vino
if(mouseX>850 && mouseX<900 && mouseY>0 &&mouseY<50){

vino=!vino;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 

 
 }
 
 //FUNCIONES  
 
   //goma
   if(mouseX>0 &&mouseX<50 && mouseY>50 && mouseY<100){
     goma=!goma;


//funciones
 lapiz=false;
 
 circulo=false;
 nuevo=false;
 cuadrados=false;
 }
 
  //circulos
 if(mouseX>0 && mouseX<50 && mouseY>150 &&mouseY<200){
   circulo=!circulo;



//funciones
 lapiz=false;
 goma=false;

 nuevo=false;
 cuadrados=false;
 }  
   
   //cuadrados
   if(mouseX>0 &&mouseX<50 && mouseY>200&&mouseY<250){
     cuadrados=!cuadrados;
   
   //funciones
   lapiz=false;
 goma=false;
circulo=false;
 nuevo=false;
   }    
 
  //lapiz
 if(mouseX>0 && mouseX<50 && mouseY>100 &&mouseY<150){
 
   lapiz=!lapiz;

 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;
  

//funciones
 
 goma=false;
 circulo=false;
 nuevo=false;
 cuadrados=false;
 
 }
 

 
    //nuevo
    if(mouseX>900 && mouseX<1000 && mouseY>0 && mouseY<50){

       nuevo=!nuevo;
       
//paleta de colores
 botonrojo=false;
 botonverdelimon=false;
 botonverdebandera=false;
 azul=false;
 azulturquesa=false;
 cielo=false;
 morado=false;
 amarillo=false;
 anaranjado=false;
 negro=false;
 blanco=false;
 rosa=false;
 fiusha=false;
 cafe=false;
 cafeclaro=false;
 dorado=false;
 gris=false;
 vino=false;

//funciones
 lapiz=false;
 goma=false;
 circulo=false;

 }


}

