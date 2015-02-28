
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int total=0;

color col;

float xpos[] = new float [total];
float ypos[] = new float [total];
float ballSize[] = new float [total];
float grow[]= new float [total];

float xspeed[] = new float [total];
float yspeed[] = new float [total];

int growing []= new int [total];
float colourh []= {123,76,129,234,122,50};
float colours []= {70,124,200};
float colourb []= {100,23,212};

Minim m;
AudioPlayer bowl;

void setup() {
  
  size (700,400);
  smooth();
  colorMode(HSB);
  col = color(100,190,200,10 );
 
  
  m= new Minim(this);
  bowl=m.loadFile ("Bowl.wav");
}

void draw () {
  
  
  
  
  noStroke();
  fill(255,30);
  rect(0, 0, width, height);
  col=col+1;
  
   fill(col);

  for( int i=0; i<total; i++) {
    
   if(dist(mouseX,mouseY,xpos[i],ypos[i]) < (ballSize[i]+grow[i])/2){
     if(grow[i] < 300) {
       grow[i]++;
       
     }
   } else {
     if (grow[i] > 0) {
       grow[i]--;
           
     }
   }
   if(grow[i] >0){
     ellipse(xpos[i],ypos[i],ballSize[i]+grow[i],ballSize[i]+grow[i]);
    
    }

  }
}

void mousePressed() {
 
  bowl.loop(0);
  
 total++;
 xpos =expand(xpos, total);
 ypos =expand(ypos, total);
 ballSize =expand(ballSize, total);
 grow =expand(grow, total);
 growing=expand(growing,total);
 xspeed=expand(xspeed,total);
 yspeed=expand(yspeed,total);
 
 xpos[total-1] = mouseX;
 ypos[total-1]= mouseY;
 ballSize[total-1]=random (100);
 grow[total-1]=0;
 growing[total-1]=0;
 xspeed [total-1]= round(random(-10,10));
 yspeed [total-1]=round(random(-10,10));

  
}




