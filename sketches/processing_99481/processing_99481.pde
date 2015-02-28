
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/* Alexandre Acsensi Valiente. Seminari 3 Informàtica.
Un pallaso fa malabars, cada cop que fas un click a la pantalla les boles seran més grosses */
 

/*Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player*/

var audioElement = document.createElement("audio");
var audioElement2 = document.createElement("audio");

//variables del nas del pallaso
int nas,nasgran,velnas;

//definim variables de les pilotes de malabars.
int numboles=10;
int mida=5;

//creem arrays per les variables de les pilotes.
float[]velx=new float[numboles];
float[]vely=new float[numboles];
float[]posx=new float[numboles];
float[]posy=new float[numboles];

//definim els PImage
PImage clown1,clown2;
 
void setup()
{
  size(500,500);
  noCursor();
  smooth();
  noStroke();
  
  //carguem les imatges
  clown1=loadImage("clown1.jpg");
  clown2=loadImage("clown2.jpg");
  
  /*instanciem l'objecte de so
  minim = new Minim(this);
  //carreguem l'mp3
  daSound = minim.loadFile("poik.mp3");
  */
  audioElement2.setAttribute("src", "silius.mp3");
  audioElement2.play();
  
  audioElement.setAttribute("src", "poik.mp3");

   
  //donem un valor a les variables del nas.
  nas=1;
  nasgran=50;
  velnas=1;
   
  //donem un valor a les variables de les boles de malabars.
for(int i = 0; i<numboles; i++)
{
  posx[i]=width/2;
  posy[i]=height/2;
  velx[i]=random(1,10);
  vely[i]=random(1,10);

}
}
   
 
void draw()
{
  //faig el background que canvii en funciona de com mous el ratolí.
  background(250);
  
  for(int x=0; x<=width; x+=10)
  {for(int y=0; y<=height; y+=10)
    {
    fill(x,y,150);
    rect(x,y,5,5);
    }
  }
  
  //col·loquem les imatges
  image(clown1,width-80,height-75);
  image(clown2,0,height-125);
  
  //dibuixo el pallaso.
  fill(123,219,0);
  ellipse(width/2,height,150,200);
   
  fill(0);
  ellipse(width/2,height-125,width/5,width/5);
  ellipse(width/2,height-125-50,width/10,width/10);
  ellipse(width/2-50,height-125,width/10,width/10);
  ellipse(width/2+50,height-125,width/10,width/10);
   
  fill(250,200,5);
  ellipse(width/2,height-100,width/5,width/5);
   
  fill(255,222,245);
  ellipse(width/2+25,height-100,25,25);
  ellipse(width/2-25,height-100,25,25);
  triangle(width/2,height-50,width/2+15,height-75,width/2-15,height-75);
   
  fill(250);
  ellipse(width/2+20,height-125,width/25,width/25);
  ellipse(width/2-20,height-125,width/25,width/25);
   
  fill(0);
  ellipse(width/2+20,height-125,width/50,width/50);
  ellipse(width/2-20,height-125,width/50,width/50);
   
  fill(70,250,250);
  triangle(width/2,height-50,width/2-25,height-40,width/2-25,height-60);
  triangle(width/2,height-50,width/2+25,height-40,width/2+25,height-60);
   
   
  //faig que el nas del pallaso creixi fins a un punt i es torni a fer petit.
  fill(250,10,10);
  ellipse(width/2,height-100,nas,nas);
  nas=nas+velnas;
  if(nas>=nasgran){nas=1;}
   
  for(int i = 0; i<numboles; i++)
  {
    //actualitzem les posicions
    posx[i] += velx[i];
    posy[i] += vely[i];
    audioElement.play(1);
  
    //comprobem que toqui als extrems de x
    if((posx[i]<mida/2)||(posx[i]>width-mida/2))
    {
    velx[i] = -velx[i];
    audioElement.play(1);
    
    /*posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();*/
    } 
    
    //comprobem que toqui als extrems de y
    if((posy[i]<mida/2)||(posy[i]>height-mida/2))
    {
    vely[i] = -vely[i];
    audioElement.play(1);
    
    /*posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();*/
    } 
  }
    
    //dibuixem les pilotes
    for(int i = 0; i<numboles; i++)
    {
    fill(100,0,0);
    ellipse(posx[i],posy[i],mida,mida);
    }
}

//Tanquem les coses de so de java
/*void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  daSound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();

  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}
 */
//Quan es clicki la pantalla les boles de malabars es faran cada cop més grans, fins un punt en el que retornaran.
void mousePressed()
{
  mida=mida+10;
  if(mida>=150){mida=10;}
}



