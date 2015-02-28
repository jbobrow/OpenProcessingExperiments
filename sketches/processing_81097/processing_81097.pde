
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer ganaste;  
AudioPlayer fondomusical;  
AudioPlayer perdiste;
PImage fondo,zombie1,zombie2,zombie3,zombie4;
PFont tnivel,tfinal;
int nivel=4;
int mostrar=0;
int cont_aciertos=0;
int contador=0;
int presion=0;
int pausa=0;
int aux=0;
int k=0;
int tiempo_mos=0;
int click=-1;
int puntaje=0;
int tiempo=0;
int clickx,clicky;
int inicio=0;
int acierto=0;
int[][] coord_nivel1={
                        {250,124},{310,124},{370,124},
                        {250,184},{310,184},{370,184},
                        {250,244},{310,244},{370,244}
                      };
int[][] coord_nivel2={
                          {220,94},{280,94},{340,94},{400,94},
                          {220,154},{280,154},{340,154},{400,154},
                          {220,214},{280,214},{340,214},{400,214},
                          {220,274},{280,274},{340,274},{400,274}
                      };  
int[][] coord_nivel3={
                          {190,64},{250,64},{310,64},{370,64},{430,64},
                          {190,124},{250,124},{310,124},{370,124},{430,124},
                          {190,184},{250,184},{310,184},{370,184},{430,184},
                          {190,244},{250,244},{310,244},{370,244},{430,244},
                          {190,304},{250,304},{310,304},{370,304},{430,304}
                      };
int[][] coord_nivel4={
                          {160,64},{220,64},{280,64},{340,64},{400,64},{460,64},
                          {160,124},{220,124},{280,124},{340,124},{400,124},{460,124},
                          {160,184},{220,184},{280,184},{340,184},{400,184},{460,184},
                          {160,244},{220,244},{280,244},{340,244},{400,244},{460,244},
                          {160,304},{220,304},{280,304},{340,304},{400,304},{460,304}
                      };
int[] posiciones_z={0,0,0,0,0,0,0,0};
int[] aciertos_z={0,0,0,0,0,0,0,0};

void setup()
{
    size(680,428);
    fondo=loadImage("fondo.png");
    zombie1=loadImage("zombie1.jpg");
    zombie2=loadImage("zombie2.jpg");
    zombie3=loadImage("zombie3.jpg");
    zombie4=loadImage("zombie4.jpg");
    tnivel=loadFont("HighTowerText-Italic-48.vlw");
    tfinal=loadFont("Verdana-48.vlw");
    minim=new Minim(this); 
    fondomusical=minim.loadFile("fondomusical.mp3",2048);  
    fondomusical.loop();  
    smooth();
    frameRate(20);
}

void draw()
{
  println(cont_aciertos+"-"+nivel);
  if(inicio==1)
  {
    if(floor(tiempo/20)<60)
    {
      image(fondo,0,0,680,428);
      juego();
      tiempo+=1;
      tiempo_mos+=1;
      fill(255);
      textFont(tfinal,20);
      text(60-floor(tiempo/20),15,30);  
      textFont(tfinal,15);
      text("Puntuacion: "+puntaje,520,30);   
    }
    else
    {
     inicio=2; 
    }
  }
  else if(inicio==2)
  {
     image(fondo,0,0,680,428);
     textFont(tfinal,35);
     fill(255);
     text("El tiempo se ha terminado",120,height/2); 
     textFont(tfinal,25);
     text("PUNTUACION FINAL",220,height/2+40);
     text(puntaje,width/2-30,height/2+80);//3 clicks
     textFont(tnivel,15);
     text("PARA CONTINUAR 3 CLICKS POR FAVOR",190,390);
  }
  else if(inicio==3)
  {
     image(fondo,0,0,680,428);
     textFont(tfinal,35);
     fill(255);
     text("El tiempo se ha terminado",120,height/2); 
     textFont(tfinal,25);
     text("PUNTUACION FINAL",220,height/2+40);
     text(puntaje,width/2-30,height/2+80);//2 clics
     textFont(tnivel,15);
     text("PARA CONTINUAR 2 CLICKS POR FAVOR",190,390);
  }
  else if(inicio==4)
  {
     image(fondo,0,0,680,428);
     textFont(tfinal,35);
     fill(255);
     text("El tiempo se ha terminado",120,height/2); 
     textFont(tfinal,25);
     text("PUNTUACION FINAL",220,height/2+40);
     text(puntaje,width/2-30,height/2+80);//1 click
     textFont(tnivel,15);
     text("PARA CONTINUAR 1 CLICKS POR FAVOR",190,390);
  }
  else
  {  
      textFont(tfinal,35);
      image(fondo,0,0,680,428);
      fill(255);
      text("Para iniciar da un click",150,height/2);   
  }
}


void mousePressed()
{
  if(inicio==0)
  {
    cont_aciertos=0;
    inicio=1;
    nivel=4;
    acierto=0;
    puntaje=0;
    tiempo_mos=0;
    click=-1;
    if(nivel==1)
    {
      posiciones(3,9);
    }
    else if(nivel==2)
    {
      posiciones(5,16);
    }
    else if(nivel==3)
    {
      posiciones(7,25);
    }
    else if(nivel==4)
    {
      posiciones(8,30); 
    }
  }
  else if(inicio==1)
  {
    clickx=mouseX;
    clicky=mouseY;
    if(nivel==1 &&mouseX>250&&mouseX<430&&mouseY>124&&mouseY<304)
    {  
          for(int i=0;i<9;i++)
          {
            if(clickx<coord_nivel1[i][0]+60&&clickx>coord_nivel1[i][0]&&clicky<coord_nivel1[i][1]+60&&clicky>coord_nivel1[i][1])
            {
              presion=i;
            }
          }
          for(int i=0;i<3;i++)
          {
            if(presion==posiciones_z[i])
            {
              acierto+=1;
              aciertos_z[i]=1;
            }  
          }
          click+=1;
          if(click!=acierto)
          {
            pausa=0;
            posiciones(3,9);
            click=0;
            acierto=0;   
            tiempo_mos=0;
            for(int i=0;i<8;i++)
           {
             aciertos_z[i]=0;
           }     
           if(cont_aciertos>1)
           {
             cont_aciertos-=1;
           }
          }
          if(click==3&&acierto==3)
          {
            puntaje=puntaje+30;
            pausa=0;
            posiciones(3,9);
            click=0;
            acierto=0;
            tiempo_mos=0;
            cont_aciertos+=1;
            for(int i=0;i<8;i++)
           {
             aciertos_z[i]=0;
           } 
          }
          fill(255,255,255);
          rect(coord_nivel1[presion][0],coord_nivel1[presion][1], 60, 60); 
          noFill();
    }
    else if(nivel==2 &&mouseX>220&&mouseX<460&&mouseY>94&&mouseY<334)
    {
          for(int i=0;i<16;i++)
          {
            if(clickx<coord_nivel2[i][0]+60&&clickx>coord_nivel2[i][0]&&clicky<coord_nivel2[i][1]+60&&clicky>coord_nivel2[i][1])
            {
              presion=i;
            }
          }
          
          for(int i=0;i<5;i++)
          {
            if(presion==posiciones_z[i])
            {
              acierto+=1;
              aciertos_z[i]=1;
            }  
          }
          click+=1;
          if(click!=acierto)
          {
            pausa=0;
            posiciones(5,16);
            click=0;
            acierto=0;  
            for(int i=0;i<8;i++)
           {
             aciertos_z[i]=0;
           }           
           tiempo_mos=0;
           if(cont_aciertos>1)
           {
             cont_aciertos-=1;
           }
           
          }
          if(click==5&&acierto==5)
          {
            puntaje=puntaje+60;
            pausa=0;
            posiciones(5,16);
            click=0;
            acierto=0;
            cont_aciertos+=1;
            
            for(int i=0;i<8;i++)
           {
             aciertos_z[i]=0;
           } 
           tiempo_mos=0;
          }
          
          fill(255,255,255);
          rect(coord_nivel2[presion][0],coord_nivel2[presion][1], 60, 60); 
          noFill();    
    }
    else if(nivel==3 &&mouseX>190&&mouseX<490&&mouseY>64&&mouseY<364)
    {
          for(int i=0;i<25;i++)
          {
            if(clickx<coord_nivel3[i][0]+60&&clickx>coord_nivel3[i][0]&&clicky<coord_nivel3[i][1]+60&&clicky>coord_nivel3[i][1])
            {
              presion=i;
            }
          }
          
          for(int i=0;i<7;i++)
          {
            if(presion==posiciones_z[i])
            {
              acierto+=1;
              aciertos_z[i]=1;
            }  
          }
          click+=1;
          if(click!=acierto)
          {
            pausa=0;
            posiciones(7,25);
            click=0;
            acierto=0;            
            for(int i=0;i<8;i++)
            {
             aciertos_z[i]=0;
            } 
            tiempo_mos=0;
            if(cont_aciertos>1)
           {
             cont_aciertos-=1;
           }
          }
          if(click==7&&acierto==7)
          {
            puntaje=puntaje+90;
            pausa=0;
            posiciones(7,25);
            click=0;
            acierto=0;
            tiempo_mos=0;
            cont_aciertos+=1;
            for(int i=0;i<8;i++)
           {
             aciertos_z[i]=0;
           } 
          }
          
          fill(255,255,255);
          rect(coord_nivel3[presion][0],coord_nivel3[presion][1], 60, 60); 
          noFill();   
    }
    else if(nivel==4 &&mouseX>160&&mouseX<520&&mouseY>64&&mouseY<364)
    {
      for(int i=0;i<30;i++)
          {
            if(clickx<coord_nivel4[i][0]+60&&clickx>coord_nivel4[i][0]&&clicky<coord_nivel4[i][1]+60&&clicky>coord_nivel4[i][1])
            {
              presion=i;
            }
          }
          
          for(int i=0;i<8;i++)
          {
            if(presion==posiciones_z[i])
            {
              acierto+=1;
              aciertos_z[i]=1;
              ganaste=minim.loadFile("ganaste.wav",2048);  
              ganaste.play(); 
            }  
          }
          click+=1;
          if(click!=acierto)
          {
            pausa=0;
            posiciones(8,30);
            click=0;
            acierto=0;  
            tiempo_mos=0;
            perdiste=minim.loadFile("perdiste.wav",2048);  
             perdiste.play(); 
              for(int i=0;i<8;i++)
             {
               aciertos_z[i]=0;
             }           
             if(cont_aciertos>1)
             {
               cont_aciertos-=1;
             }
          }
          if(click==8&&acierto==8)
          {
            puntaje=puntaje+120;
            pausa=0;
            posiciones(8,30);
            click=0;
            acierto=0;
            cont_aciertos+=1;
            for(int i=0;i<8;i++)
           {
             aciertos_z[i]=0;
           } 
           tiempo_mos=0;
          }          
          fill(255,255,255);
          rect(coord_nivel4[presion][0],coord_nivel4[presion][1], 60, 60); 
          noFill();    
    }
  }
  else if(inicio==2)
  {
    inicio=3;
    tiempo=0;
  }
  else if(inicio==3)
  {
    inicio=4;
    tiempo=0;
  }
  else if(inicio==4)
  {
    inicio=5;
    tiempo=0;
  }
  else if(inicio==5)
  {
    inicio=0;
    tiempo=0;
  }
}

/**/
void juego()
{
  if(pausa==0)
  {
    cuadricula(nivel);
    if(nivel==1)
    {
        if(aciertos_z[0]==1)
        {
          image(zombie1,coord_nivel1[posiciones_z[0]][0]+1,coord_nivel1[posiciones_z[0]][1]+1,58,58);
        }
        if(aciertos_z[1]==1)
        {
          image(zombie2,coord_nivel1[posiciones_z[1]][0]+1,coord_nivel1[posiciones_z[1]][1]+1,58,58);
        }
        if(aciertos_z[2]==1)
        {
          image(zombie3,coord_nivel1[posiciones_z[2]][0]+1,coord_nivel1[posiciones_z[2]][1]+1,58,58); 
        }
    }
    else if(nivel==2)
    {
        if(aciertos_z[0]==1)
        {
          image(zombie1,coord_nivel2[posiciones_z[0]][0]+1,coord_nivel2[posiciones_z[0]][1]+1,58,58);
        }
        if(aciertos_z[1]==1)
        {
          image(zombie2,coord_nivel2[posiciones_z[1]][0]+1,coord_nivel2[posiciones_z[1]][1]+1,58,58);
        }
        if(aciertos_z[2]==1)
        {
          image(zombie3,coord_nivel2[posiciones_z[2]][0]+1,coord_nivel2[posiciones_z[2]][1]+1,58,58); 
        }
        if(aciertos_z[3]==1)
        {
          image(zombie4,coord_nivel2[posiciones_z[3]][0]+1,coord_nivel2[posiciones_z[3]][1]+1,58,58);

        }
        if(aciertos_z[4]==1)
        {
          image(zombie1,coord_nivel2[posiciones_z[4]][0]+1,coord_nivel2[posiciones_z[4]][1]+1,58,58);    
        }
    }
    else if(nivel==3)
    {
      if(aciertos_z[0]==1)
        {
          image(zombie1,coord_nivel3[posiciones_z[0]][0]+1,coord_nivel3[posiciones_z[0]][1]+1,58,58);
        }
        if(aciertos_z[1]==1)
        {
          image(zombie2,coord_nivel3[posiciones_z[1]][0]+1,coord_nivel3[posiciones_z[1]][1]+1,58,58);
        }
        if(aciertos_z[2]==1)
        {
          image(zombie3,coord_nivel3[posiciones_z[2]][0]+1,coord_nivel3[posiciones_z[2]][1]+1,58,58);
        }
        if(aciertos_z[3]==1)
        {
          image(zombie4,coord_nivel3[posiciones_z[3]][0]+1,coord_nivel3[posiciones_z[3]][1]+1,58,58);

        }
        if(aciertos_z[4]==1)
        {
          image(zombie1,coord_nivel3[posiciones_z[4]][0]+1,coord_nivel3[posiciones_z[4]][1]+1,58,58);    
        }
        if(aciertos_z[5]==1)
        {
          image(zombie2,coord_nivel3[posiciones_z[5]][0]+1,coord_nivel3[posiciones_z[5]][1]+1,58,58);
        }
        if(aciertos_z[6]==1)
        {
          image(zombie3,coord_nivel3[posiciones_z[6]][0]+1,coord_nivel3[posiciones_z[6]][1]+1,58,58);
        }
    }
    else if(nivel==4)
    {
      if(aciertos_z[0]==1)
      {
        image(zombie1,coord_nivel4[posiciones_z[0]][0]+1,coord_nivel4[posiciones_z[0]][1]+1,58,58);
      }
      if(aciertos_z[1]==1)
      {
        image(zombie2,coord_nivel4[posiciones_z[1]][0]+1,coord_nivel4[posiciones_z[1]][1]+1,58,58);
      }
      if(aciertos_z[2]==1)
      {
        image(zombie3,coord_nivel4[posiciones_z[2]][0]+1,coord_nivel4[posiciones_z[2]][1]+1,58,58);
      }
      if(aciertos_z[3]==1)
      {
        image(zombie4,coord_nivel4[posiciones_z[3]][0]+1,coord_nivel4[posiciones_z[3]][1]+1,58,58);
      }
      if(aciertos_z[4]==1)
      {
        image(zombie1,coord_nivel4[posiciones_z[4]][0]+1,coord_nivel4[posiciones_z[4]][1]+1,58,58);    
      }
      if(aciertos_z[5]==1)
      {
        image(zombie2,coord_nivel4[posiciones_z[5]][0]+1,coord_nivel4[posiciones_z[5]][1]+1,58,58);
      }
      if(aciertos_z[6]==1)
      {
        image(zombie3,coord_nivel4[posiciones_z[6]][0]+1,coord_nivel4[posiciones_z[6]][1]+1,58,58);
      }
      if(aciertos_z[7]==1)
      {
        image(zombie4,coord_nivel4[posiciones_z[7]][0]+1,coord_nivel4[posiciones_z[7]][1]+1,58,58);
      }
    }
    if(tiempo_mos<25)
    {
      mostrar_imagen(nivel);      
    }    
  }  
}

/**/



void c_nivel()
{
  if(cont_aciertos>=0&&cont_aciertos<2)
  {
    nivel=1;
  }
  else if(cont_aciertos>=2&&cont_aciertos<5)
  {
    nivel=2;
  }
  else if(cont_aciertos>=5&&cont_aciertos<8)
  {
    nivel=3;
  }
  else if(cont_aciertos>=8)
  {
    nivel=4;
  }
}


void  cuadricula(int a)
{
  textFont(tnivel,20);
  stroke(0,150,0);
  strokeWeight(2);
  noFill();
  if(a==1)
  {
    for(int i=0;i<9;i++)
    {
      rect(coord_nivel1[i][0],coord_nivel1[i][1], 60, 60); 
    }
    fill(255);
    text("NIVEL: Fácil",width/2-50,height-30);
    noFill();
  }
  else if(a==2)
  {
    for(int i=0;i<16;i++)
    {
      rect(coord_nivel2[i][0],coord_nivel2[i][1], 60, 60); 
    }
    fill(255);
    text("NIVEL: Normal",width/2-65,height-30);
    noFill();
  }
  else if(a==3)
  {
    for(int i=0;i<25;i++)
    {
      rect(coord_nivel3[i][0],coord_nivel3[i][1], 60, 60); 
    }
    fill(255);
    text("NIVEL: Dificil",width/2-55,height-30);
    noFill();
  }
  else if(a==4)
  {
    for(int i=0;i<30;i++)
    {
      rect(coord_nivel4[i][0],coord_nivel4[i][1], 60, 60); 
    }
    fill(255);
    text("NIVEL: Locura",width/2-65,height-30);
    noFill();
  }
}

void posiciones(int n, int m)
{
  //n numero de datos a buscar
  //m numero de datos por nivel
  k=0;
  do{
      contador=0;
      if(k==0)
      {
        posiciones_z[k]=(int)random(0,m-1);
        k=1;
      }
      else
      {
        aux=(int)random(0,m-1);
        for(int i=0;i<k;i++)
        {
          if(aux==posiciones_z[i])
          {
            contador=1;
          }
        }
        if(contador==0)
        {
          posiciones_z[k]=aux;
          k=k+1;
        }
      }
  }while(k<n);
}

void mostrar_imagen(int a)
{
  if(a==1)
  {
     image(zombie1,coord_nivel1[posiciones_z[0]][0]+1,coord_nivel1[posiciones_z[0]][1]+1,58,58);
     image(zombie2,coord_nivel1[posiciones_z[1]][0]+1,coord_nivel1[posiciones_z[1]][1]+1,58,58);
     image(zombie3,coord_nivel1[posiciones_z[2]][0]+1,coord_nivel1[posiciones_z[2]][1]+1,58,58);
  }
  else if(a==2)
  {
     image(zombie1,coord_nivel2[posiciones_z[0]][0]+1,coord_nivel2[posiciones_z[0]][1]+1,58,58);
     image(zombie2,coord_nivel2[posiciones_z[1]][0]+1,coord_nivel2[posiciones_z[1]][1]+1,58,58);
     image(zombie3,coord_nivel2[posiciones_z[2]][0]+1,coord_nivel2[posiciones_z[2]][1]+1,58,58);
     image(zombie4,coord_nivel2[posiciones_z[3]][0]+1,coord_nivel2[posiciones_z[3]][1]+1,58,58);
     image(zombie1,coord_nivel2[posiciones_z[4]][0]+1,coord_nivel2[posiciones_z[4]][1]+1,58,58);    
  }
  else if(a==3)
  {
    image(zombie1,coord_nivel3[posiciones_z[0]][0]+1,coord_nivel3[posiciones_z[0]][1]+1,58,58);
    image(zombie2,coord_nivel3[posiciones_z[1]][0]+1,coord_nivel3[posiciones_z[1]][1]+1,58,58);
    image(zombie3,coord_nivel3[posiciones_z[2]][0]+1,coord_nivel3[posiciones_z[2]][1]+1,58,58);
    image(zombie4,coord_nivel3[posiciones_z[3]][0]+1,coord_nivel3[posiciones_z[3]][1]+1,58,58);
    image(zombie1,coord_nivel3[posiciones_z[4]][0]+1,coord_nivel3[posiciones_z[4]][1]+1,58,58);    
    image(zombie2,coord_nivel3[posiciones_z[5]][0]+1,coord_nivel3[posiciones_z[5]][1]+1,58,58);
    image(zombie3,coord_nivel3[posiciones_z[6]][0]+1,coord_nivel3[posiciones_z[6]][1]+1,58,58);
  }
  else if(a==4)
  {
    image(zombie1,coord_nivel4[posiciones_z[0]][0]+1,coord_nivel4[posiciones_z[0]][1]+1,58,58);
    image(zombie2,coord_nivel4[posiciones_z[1]][0]+1,coord_nivel4[posiciones_z[1]][1]+1,58,58);
    image(zombie3,coord_nivel4[posiciones_z[2]][0]+1,coord_nivel4[posiciones_z[2]][1]+1,58,58);
    image(zombie4,coord_nivel4[posiciones_z[3]][0]+1,coord_nivel4[posiciones_z[3]][1]+1,58,58);
    image(zombie1,coord_nivel4[posiciones_z[4]][0]+1,coord_nivel4[posiciones_z[4]][1]+1,58,58);    
    image(zombie2,coord_nivel4[posiciones_z[5]][0]+1,coord_nivel4[posiciones_z[5]][1]+1,58,58);
    image(zombie3,coord_nivel4[posiciones_z[6]][0]+1,coord_nivel4[posiciones_z[6]][1]+1,58,58);
    image(zombie4,coord_nivel4[posiciones_z[7]][0]+1,coord_nivel4[posiciones_z[7]][1]+1,58,58);
  }
}


