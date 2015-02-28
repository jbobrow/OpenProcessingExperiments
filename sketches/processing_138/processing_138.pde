
/*
Current Version: 0.01
 Released:6.28.2007
 Creator: Che-Wei Wang http://cwwang.com
 License: GNU Public License
 Download Beta:
 To do: time delay, time control
 Instructions:
 click on circle to begin timer and select white player
 press 'UP' to increase time in minutes
 press 'DOWN' to decrease time
 press 'r' to reset
 press 'p' to pause
 press any key or click the mouse to toggle between black and white
 */


int pieSize;
int h,s1,s2;
int dif;
Clock c1,c2;
int time=5;
boolean pause=false;

void setup()
{  
  dif=millis();
  //size( screen.width, (screen.height) );
  size(800,400);
  //setFullScreen( true );
  //setResolution( screen.width, screen.height );
  //frameRate(60);

  smooth();
  c1=new Clock(width*1/4,height/2);
  c2=new Clock(width*3/4,height/2);
} 


void draw(){
  background(0);
  if(pause){
    fill(100,200);
    noStroke();
    rect(0,0,width,height) ;
  }
  else{
    if(c1.counting==false&&c2.counting==false){
      c1.startButton();
      c2.startButton(); 
      setTimer();
    }

    if(c2.counting){
      if(millis()-dif>=1000){
        s2=s2+1;
        dif=millis();
      }
    }

    else if (c1.counting){
      if(millis()-dif>=1000){
        s1=s1+1;
        dif=millis();
      }
    }
  }
  c1.init(time,s1);
  c2.init(time,s2);
}


void setTimer(){

  for (int i=0;i<time;i++){
    if(time==3||time==5||time==25||time==60){
      stroke(120,20,0); 
    }

    else{
      stroke(100); 
    }

    noFill();
    if(i%5==0){

      strokeWeight(2);
    }
    else{

      strokeWeight(1);
    }

    timerPie(60,i,7,8);
    if(time>60){
      stroke(150);
      timerPie(60,constrain(i-60,0,60),8,9);
    }
    if(time>120){
      stroke(255);
      timerPie(60,constrain(i-120,0,60),9,10);
    }

    //ellipse(width/2,height/2,10+i*10,10+i*10);
  }
}

void timerPie(float t, int d, int l1,int l2){

  pushMatrix();
  float angle=PI-(TWO_PI/t*d);
  translate(width/2,height/2);

  float x=sin(angle)*(width/2-width/5);
  float y=cos(angle)*(width/2-width/5);
  line(x/(l1),y/(l1),x/(l2),y/(l2));
  popMatrix();
}

void keyReleased(){
  if(key=='r'){
    reset();
  }

  if(key=='p'&&pause==false){
    pause=true; 
  }
  else if(key=='p'&&pause==true){
    pause=false; 
  }
  if(pause==false){
    toggle();
  }

  if(c1.counting==false&&c2.counting==false){
    if (keyCode==UP){
      if (time<5){
        time++;
      }
      else{
        time=time+5;
      }
      if(time>=150){
        time=150;
      }
    }
    if (keyCode==DOWN){
      if (time<=5){

        time--;
      }
      else{
        time=time-5;
      }
      if(time<=1){
        time=1;
      }

    }
  }

}

void toggle(){
  if(c1.counting){
    c1.counting=false;  
    c2.counting=true;    
  }

  else if(c2.counting){
    c2.counting=false;  
    c1.counting=true;    
  }
}


void mousePressed(){
  toggle();
}

void reset(){
  s1=0;
  s2=0;
  c1.init(time,0);
  c2.init(time,0);
  c1.counting=false;
  c2.counting=false;
  c1.white=false;
  c2.white=false;
}


int h(){
  int hh;
  if (hour()>12) hh=hour()-12;
  else hh=hour();
  return hh ;
}

