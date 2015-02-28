
/* @pjs preload="fondo.gif,muteoff.png,muteon.png,offico.png,onico.png"; */

PImage fondo, muteoff,muteon,onico,offico;
boolean live=false,live2=false,mute=false,on=true,explode=false,explode2=false;
int t,t2,score=0,i=0,j=100,pmax=300, d=0, c=0,m=0, dm=0, cm=0;
float [] xen,yen;
float distan= 0,distanx = 0,distany = 0,distanxo = 0,distanyo = 0,kp=0.05,kd=0.09,x = 200,y = 200, k=0, radi=0, radi2=0;

//Plop plop;
//AudioPlayer player;

void setup() 
{
  fondo=loadImage("fondo.gif");
  muteoff=loadImage("muteoff.png");
  muteon=loadImage("muteon.png");
  onico=loadImage("onico.png");
  offico=loadImage("offico.png");
  imageMode(CORNER);
  image(fondo,0,0,height,width*0.82);
  
  size(500, 500);
  background(255);
  imageMode(CORNER);
  noLoop();  // draw() will not loop // 
  
//TRABAJAMOS CON EL AUDIO 
//plop=new Plop(this);
//player=plop.loadFile("plop.flac");
//player.setLoop(false);
  
//INICIALIZAMOS LAS VARIABLES REFERENTES A LAS POSICIONES DE LOS ENEMIGOS    
    float mx1 = 0.01*height , my1 = 0.01*width,mx2 = height*0.99,my2 = height*0.805; 
    xen= new float[pmax];
    yen= new float[pmax];
    
//CREAMOS UN GRILL DE PUNTOS RANDOM QUE SERAN LAS POSICIONES DE LOS ENEMIGOS
            for(int i=0;i<pmax;i++){xen[i]=random(mx1+10,mx2-10);}
            for(int j=0;j<pmax;j++){yen[j]=random(my1+10,my2-10);}
}
   


void draw() {
float mx1 = 0.01*height,my1 = 0.01*width, mx2 = height*0.99,my2 = height*0.805;

//CONTROL DE VELOCIDAD
      distan= dist(x,y,pmouseX,pmouseY);
      distanx= pmouseX-x;
      distany= pmouseY-y;
  
        if(distan>0){
          x=x+kp*distanx+kd*(distanx-distanxo);
          y=y+kp*distany+kd*(distany-distanyo);
          distanyo=distany;
          distanxo=distanx;
              
//OBJETOS QUE DIBUJAMOS
                  strokeWeight(2);
                  background(255);
//FUERA DEL RECTANGULO BORRAMOS NUESTRO PROTOZOO 
                   if(x<mx1||x>mx2 ||y<my1||y>my2){stroke(255,255,255,0);fill(255,255,255,0);}
                   else{stroke(0); }
//BOTON PAUSA                 
                       if(on){image(onico,0.035*height,0.82*width,0.15*height,0.15*width);} 
                       else{image(offico,0.035*height,0.82*width,0.15*height,0.15*width);}
//BOTON MUTE
                       if(mute){image(muteon,0.18*height,0.815*width-5,0.20*height,0.20*width);} 
                       else{image(muteoff,0.18*height,0.815*width-5,0.20*height,0.20*width);}
                       
//DIBUJAMOS NUESTRO PROTOZOO                     
                       ellipse(x,y,10,10); 
                       image(fondo,0,0,height,width*0.82);
//PRINT SCORE                       
                       textSize(width/16);  
                       fill(0);
                       text(score,0.87*height,0.90*width);
                       text(d,0.83*height,0.90*width);
                       text(c,0.79*height,0.90*width);
                       text(m,0.75*height,0.90*width);
                       text(dm,0.71*height,0.90*width);
                       text(cm,0.67*height,0.90*width);
                       if(score>9){fill(0);score=0; d=d+1;}
                       if(d>9){fill(0);d=0; c=c+1;}
                       if(c>9){fill(0);c=0; m=m+1;}
                       if(m>9){fill(0);m=0; dm=dm+1;}
                       if(dm>9){fill(0);dm=0; cm=cm+1;}
                       noStroke();
                       noFill();
//DIBUJAMOS LA BARRA DE HAMBRE 
                       stroke(100);
                       float vida=0.68*height+k;                       
                       if(random(0,100)>97 ){ k = k+1.5;} //El HAMBRE CRECE RANDOM
                       if( k>=(0.90*height-0.68*height)){k=0.90*height-0.68*height;}
                       
                       strokeWeight(1);
                       rectMode(CORNERS);
                       rect(vida,0.92*width, 0.90*height,0.95*width);
                       noStroke();
//CURSOR PEQUEÑO
                       stroke(0); 
                       point(pmouseX,pmouseY);
                       noStroke();
                       
} 
        
    
//CREAMOS Y ANIQUILAMOS ENEMIGOS EN ORDEN 
    
//ENEMIGO/ALIMENTO 1
      if(!live & random(0,100)>95 ){live=!live; t= second();} //REVIVIMOS
      if(live & random(0,100)>97 & second()-t>1.5){live=!live;i=i+1;} //MATAMOS
      if(i>pmax-2){i=0;}; //REINICIAMOS EL ARRAY PARA NO SALIRNOS
      
      if (live){
        stroke(0);
        strokeWeight(2);
         xen[i]=xen[i]+random(-0.5,0.5); //MOV BROWNIANO DE LOS OBJET
         yen[i]=yen[i]+random(-0.5,0.5);
         xen[i]= constrain(xen[i],mx1,mx2); //LOS CONTENEMOS EN LA PANTALLA
         yen[i]= constrain(yen[i],my1,my2);
         
      ellipse(xen[i],yen[i],4,4); //ENEMIGOS CIRCULITOS
       noStroke();

      
      
          if(dist(x,y,xen[i],yen[i])<10){ //MATAMOS A LOS ENEMIGOS POR PROXIMIDAD
            explode=!explode;
            live=!live;
            i=i+1; score=score+1; 
            if(k>0){k=k-3;}} //SI LOS MATAMOS DESAPARECEN SALTAMOS AL SIG Y LA BARRA DE HAMBRE disminuye
      }
      
              if(explode){stroke(0,0,0,map(radi,0,40,255,0)); //HACEMOS QUE EXPLOTEN CON UN CIRCULO MOLONGO
              ellipse(xen[i-1],yen[i-1],radi,radi);
              radi=radi+2;}
              if(radi>40){radi=0; explode=!explode;}
      
//ENEMIGO/ALIMENTO 2      
       if(!live2 & random(0,100)>99.5 ){live2=!live2; t2=second();} //REVIVIMOS
       if(live2 & random(0,100)>95 & second()-t2>1.5 ){live2=!live2;j=j+1;} //MATAMOS
       if(j>pmax-2){j=0;}; //REINICIAMOS EL ARRAY PARA NO SALIRNOS
      
      if (live2){
        stroke(0);
        strokeWeight(2);  
         xen[j]=xen[j]+random(-0.5,0.5); //MOV BROWNIANO DE LOS OBJET
         yen[j]=yen[j]+random(-0.5,0.5);
         xen[j]= constrain(xen[j],mx1,mx2); //LOS CONTENEMOS EN LA PANTALLA
         yen[j]= constrain(yen[j],my1,my2);
      ellipse(xen[j],yen[j],4,4); //ENEMIGOS CIRCULITOS
      noStroke();
      
          if(dist(x,y,xen[j],yen[j])<10){  //MATAMOS A LOS ENEMIGOS POR PROXIMIDAD
            explode2=!explode2;
            live2=! live2;
            j=j+1; score=score+1; 
            if(k>0){k=k-3;}} //SI LOS MATAMOS DESAPARECEN SALTAMOS AL SIG Y LA BARRA DE HAMBRE disminuye
      }
               if(explode2){stroke(0,0,0,map(radi2,0,40,255,0)); //HACEMOS QUE EXPLOTEN CON UN CIRCULO MOLONGO
               ellipse(xen[j-1],yen[j-1],radi2,radi2);
               radi2=radi2+2;}
               if(radi2>40){radi2=0; explode2=!explode2;}
       
}  
 

void mousePressed() {
 
  if(dist(mouseX,mouseY,(0.05*height)+100,(0.82*width)+50)<40){mute=!mute;}
  loop();  // Holding down the mouse activates looping 

}

void keyPressed() {
  
  if(key==' '){ }
//  if(!on){noLoop();}
 
}


