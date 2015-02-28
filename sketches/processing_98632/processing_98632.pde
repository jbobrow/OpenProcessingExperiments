

// Marta Fernández Turu, Grup 02

/*
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

*/

var audioElement= document.createElement("audio");

/*
Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player
*/

//Definim variables


PImage pilota;
boolean ismousepressed;
 
 
void setup() {
   
size(500, 700);
stroke(0);
noCursor();
pilota=loadImage("pilotaa.png");

 /*
 minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("basketball.mp3");//carreguem l'mp3
*/

audioElement.setAttribute("src","basketball.mp3");
 
background(121,101,94); // Fons gris
 for (int x=5; x<width; x+=width/5){        // Determinem un patró de repetició en l'eix X.
  for (int y=5; y<height; y+=height/14){    // Determinem un patró de repetició en l'eix Y.
    fill(124,58,27); rect(x,y,width/5-10,height/14-10);       // Determinem quina figura volem que es repeteixi segons els patrons establerts amb anterioritat.
     
  }
} 
}
 
 
 
void draw(){
    background(121,101,94); // Fons gris
 for (int x=5; x<width; x+=width/5){        // Determinem un patró de repetició en l'eix X.
  for (int y=5; y<height; y+=height/14){    // Determinem un patró de repetició en l'eix Y.
    fill(124,58,27); rect(x,y,width/5-10,height/14-10);       // Determinem quina figura volem que es repeteixi segons els patrons establerts amb anterioritat.
     
  }
}
 

image(pilota,mouseX-40,mouseY-40,80,80);  // Imatge de la pilota que varia la seva posició en funció de la del mouse. (el mouse està centrat en la imatge)

 
fill(0); rect(0.98*width,height,0.5*width,-525);  //Pal de la cistella.
fill(0); rect(0.98*width,0.30*height,-15,5); //Unió cistella.
fill(0); rect(0.98*width-15,0.30*height,-95,10); //Cistella.
   
  
  
fill(0); line(0.98*width-110,0.30*height+10,0.98*width-100,0.30*height+85); //Xarxa cistella E-D.
   
fill(0); line(0.98*width-100,0.30*height+10,0.98*width-90,0.30*height+85);
   
fill(0); line(0.98*width-90,0.30*height+10,0.98*width-80,0.30*height+85);
   
fill(0); line(0.98*width-80,0.30*height+10,0.98*width-70,0.30*height+85);
   
fill(0); line(0.98*width-70,0.30*height+10,0.98*width-60,0.30*height+85);
   
fill(0); line(0.98*width-60,0.30*height+10,0.98*width-50,0.30*height+85);
   
fill(0); line(0.98*width-50,0.30*height+10,0.98*width-40,0.30*height+85);
   
fill(0); line(0.98*width-40,0.30*height+10,0.98*width-30,0.30*height+85);
   
fill(0); line(0.98*width-30,0.30*height+10,0.98*width-20,0.30*height+85);
   
   
   
   
fill(0); line(0.98*width-15,0.30*height+10,0.98*width-25,0.30*height+85); //Xarxa cistella E-D.
   
fill(0); line(0.98*width-25,0.30*height+10,0.98*width-35,0.30*height+85);
   
fill(0); line(0.98*width-35,0.30*height+10,0.98*width-45,0.30*height+85);
   
fill(0); line(0.98*width-45,0.30*height+10,0.98*width-55,0.30*height+85);
   
fill(0); line(0.98*width-55,0.30*height+10,0.98*width-65,0.30*height+85);
   
fill(0); line(0.98*width-65,0.30*height+10,0.98*width-75,0.30*height+85);
   
fill(0); line(0.98*width-75,0.30*height+10,0.98*width-85,0.30*height+85);
   
fill(0); line(0.98*width-85,0.30*height+10,0.98*width-95,0.30*height+85);
   
fill(0); line(0.98*width-95,0.30*height+10,0.98*width-105,0.30*height+85);

 
    }
    
   
void mousePressed(){
    ismousepressed=ismousepressed==false;  //Aconseguim que al apretar sigui true, al tornar apretar sigui false i així succecivament.
    if(ismousepressed){  // Definim que passa en el cas true.
    /*    daSound.cue(0);       
    }else{  // Definim que passa en el cas false.
        daSound.play(0);
        
        */
        audioElement.setAttribute("src","basketball.mp3");
        audioElement.play();
    }
  }


/*
//Tanquem les coses de so de java
void stop()
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


