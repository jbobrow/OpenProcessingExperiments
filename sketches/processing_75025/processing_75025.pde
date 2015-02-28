
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioInput in;
AudioPlayer ganaste;  
AudioPlayer perdiste;
PFont mensaje,msgfinal;
int nivel=70;

int x=300,continua=0,desicion=0;
float y=0,m=0;

void setup()
{
  size(400,600);
  minim=new Minim(this);  
  ganaste=minim.loadFile("ganaste.mp3",2048);  
  perdiste=minim.loadFile("perdiste.mp3",2048);
  in=minim.getLineIn(Minim.STEREO,512);
  mensaje=loadFont("Algerian-48.vlw");
  msgfinal=loadFont("ArialMT-48.vlw");
  smooth();
  frameRate(20);
}

void draw()
{
  background(55,195,201);
  if(continua==0)
  {
        for(int i = 0; i < in.bufferSize() - 1; i++)
        {
          if(abs(in.mix.get(i))>m)  
          {  
            m=abs(in.mix.get(i));  
          }  
        }
        y=m*150;
        fill(255,0,0);
        if(y>nivel)
        {
          ellipse(200,x,50,50);
           x-=3; 
          if(x<25)
          {
            continua=1;            
            desicion=1;
          }
        }
        else if(y<=nivel)
        {    
          ellipse(200,x,50,50);
          x+=3;
          if(x>height-25)
          {
           continua=1;
           desicion=0;
          }
        }
  }
  else
  {
    if(desicion==1)
    {
      ganaste.play(); 
      fill(255,0,0);
      ellipse(200,25,50,50);
      fill(0);
      textFont(mensaje,30);
      text("FELICIDADES",width/2-90,height/2-40);
      text("HAS",width/2-30,height/2);
      text("GANADO",width/2-60,height/2+40);
      textFont(msgfinal,15);
      fill(random(150,255),0,0);
      text("PARA CONTINUAR",145,390);
      text("PRESIONE CUALQUIER TECLA",105,410);
      if(keyPressed==true)
      {
        desicion=0;
        x=300;
        y=0;
        continua=0;
        ganaste.pause();
      }
    }
    else
    {
      perdiste.play();
      background(55,195,201); 
      fill(255,0,0);
      ellipse(200,height-25,50,50);
      fill(0);
      textFont(mensaje,30);
      text("LAMENTABLEMENTE",width/2-145,height/2-40);
      text("HAS",width/2-30,height/2);
      text("PERDIDO",width/2-60,height/2+40);
      textFont(msgfinal,15);
      fill(random(150,255),0,0);
      text("PARA CONTINUAR",145,390);
      text("PRESIONE CUALQUIER TECLA",105,410);
      if(keyPressed==true)
      {
        desicion=0;
        x=300;
        y=0;
        continua=0;
        perdiste.pause();
      }
    }
  }
 m=0;
 fill(0);
 textFont(msgfinal,15);
 text("NIVEL ACTUAL(↑/↓):" + nivel,0,575);
}

void keyPressed()
{
  if(keyCode==UP)
  {
    if(nivel<=140)
    {
      nivel+=10;
    }
  }
  if(keyCode==DOWN)
  {
    if(nivel>=20)
    {
      nivel-=10;
    }
  }
}

