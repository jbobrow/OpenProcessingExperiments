
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioInput in;
AudioSample player_1;
AudioSample player_2;

int s2 = 0;
int seconds;
int lastSecond;
int secondsBeat;
int ms;
int x;
int y;


float largura;
float altura;

float largura2;
float altura2;

float largura3;
float altura3;

float largura4;
float altura4;

float largura5;
float altura5;



float volume; 

 
void setup()
{
  size(500,500);
  smooth(); 
  noFill();
  strokeWeight(8.0);
  
   x = -width/2;
  y= -height/2;
  largura = 100;
  altura = 100;
  
  largura2= 50;
  altura2= 50;
  
  largura3 = 150;
  altura3 = 150;
  
  largura4 = 200;
  altura4 = 200;
  
  largura5= 250;
  altura5 = 250;
 
 
  
  minim = new Minim(this);
  player_1 = minim.loadSample("bass2.wav", 512);
  player_2 = minim.loadSample("trance2.wav", 512);
 
  
  seconds = 0;
  secondsBeat = 1;
  
  
  in = minim.getLineIn(Minim.MONO, 2);
  
 
  
}
 
void draw(){
  background(255); 

  translate(width/2, height/2);
  rotate(radians(-90));
  
  noFill();
  
  seconds = second();
 

   

   // min
  float m = minute();
  float mMap = map (m, 0,59, 0, 360);// 0 a 12 para 0 a 360: resultado e um numero de 0 a 360
  float angle_minute = radians (mMap);
  float hM = map ( m, 0, 59, 0, 360);// mapear o HUE
  
  stroke(50,50, 50);
  arc(0, 0, 410, 410, 0, angle_minute);

  // horas
  float h = hour(); // - 0 a 24
  float h12 = h % 12; // 0 a 12
  float hMap =   map (h12, 0,12, 0, 360);// 0 a 12 para 0 a 360
  float angle_hour = radians (hMap);
  float hH = map ( h12, 0, 12, 0, 360);// mapear o HUE
  
  stroke(50,50, 50);
  arc(0, 0, 380, 380, 0, angle_hour);

   


  
    // sec
  float s = second() ;
  float sMap = map (s, 0,59, 0, 360);// 0 a 12 para 0 a 360: resultado e um numero de 0 a 360
  float angle_second = radians (sMap);
  float angle_first = radians (sMap-5);
  
  float hS = map ( s, 0, 59, 0, 360);// mapear o HUE
  
  stroke(50,50, 50);
  arc(0, 0, 440, 440, angle_first, angle_second);
  
  noStroke();
  fill(360,0,0, 1);
  rect(-width/2,-height/2, width, height);
  
  
  noStroke();
  fill( 50, 50, 50, 50);
  ellipse (0, 0, 20,20);
  
  
  volume = in.left.get(0)*100;
  println(volume);
  
         ellipse(0, 0,largura5+volume,altura5+volume);
  fill(50,50,50);
  strokeWeight (6.0);
  rectMode (CENTER);
  
        ellipse(0, 0,largura4+volume,altura4+volume);
  fill(255, 255, 255, 50);
  strokeWeight (6.0);
  rectMode (CENTER);
  
      ellipse(0, 0,largura3+volume,altura3+volume);
  fill(50,50,50 );
  strokeWeight (6.0);
  rectMode (CENTER);
  
  ellipse(0, 0,largura+volume,altura+volume);

  fill(255);
  strokeWeight (6.0);
  rectMode (CENTER);
  
  ellipse(0, 0, largura2+volume,altura2+volume);
  fill(255);
  strokeWeight (6.0);
  rectMode (CENTER);
  
  

 
  
  

  if (lastSecond+1 == seconds) {
    player_1.trigger();
    
   
}

if(seconds == secondsBeat) {
   player_2.trigger();
  secondsBeat = secondsBeat +8;
  
}





  lastSecond = seconds;
  

 
}


void stop()
  {
   //always close Minim audio classes when you are done with them
   player_1.close();
   player_2.close();
   in.close();
   minim.stop();
   super.stop();
  }
 



