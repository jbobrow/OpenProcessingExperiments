
/*
created by João Lima - check www.joaolimadesign.com

- when mouseclick = save a printscreen
- when move position mouse change the spirograph style
- when move position Y mouse change sound

- To nice effect please move mouse in a diagonal 
*/

float a,b,h,xpos,ypos,oxpos,oypos,t,ot,d,od;
int centerX,centerY;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;

void setup() {
 size(800,600);
 colorMode(RGB);
 background(225);
 centerX = width/2;
 centerY = height/2;

 //som UPLOAD
 minim = new Minim(this); 
  player = minim.loadFile("friz1.mp3");
  player1 = minim.loadFile("friz2.mp3");
  player2 = minim.loadFile("friz3.mp3");
  player3 = minim.loadFile("friz4.mp3");

//plays the files
  player.play();
  player1.play();
  player2.play();
  player3.play();
}

void draw() {
 background(255);
 noStroke();
 
 a = mouseX;
 b = 800;
 h = mouseY;
   
 for(int i=1; i<361; i+=1) {
   t = radians(i);
   ot = radians(i-1);
   d = a*t;
   od = a*ot;
 
   oxpos = (a-b)*cos(ot)+h*cos(od);
   oypos = (a-b)*sin(ot)+h*sin(od);    
   
   xpos = (a-b)*cos(t)+h*cos(d);
   ypos = (a-b)*sin(t)+h*sin(d);
   
   stroke(i-1,0,0);
   line(centerX+oxpos, centerY+oypos, centerX+xpos, centerY+ypos);
 }
 
 //SOM POR CADA COORDENADA
  if((mouseY<150 && mouseY>0) && (mouseX<800 && mouseX>0))
  { 
    noStroke(); 
    noFill(); 
    rect(0,0,800,150);
     if(!player.isPlaying()){
      player.play();
    }
  } else{
   player.pause();
  }
  
//player1

   if((mouseY<300 && mouseY>150) && (mouseX<800 && mouseX>0))
  { 
     noStroke(); 
     noFill();
     rect(00,150,800,150);
     if(!player1.isPlaying()){
      player1.play();
    }
  } else{   
   player1.pause();
  }

//player2

if((mouseY<450 && mouseY>300) && (mouseX<800 && mouseX>0))
  { 
    noStroke(); 
    noFill(); 
    rect(00,300,800,150);  
     if(!player2.isPlaying()){
      player2.play();
    }
  } else{
   
   player2.pause();
  }
  
//player3

   if((mouseY<600 && mouseY>450) && (mouseX<800 && mouseX>0))
  { 
    noStroke(); 
    noFill();
    rect(00,450,800,150);
     if(!player3.isPlaying()){
      player3.play();
    }
  } else{ 
   player3.pause();
  }
 
}

//printscreen when click
void mousePressed() {
 save("spiro_big_"+a+"_"+b+"_"+h+".tif");
}


