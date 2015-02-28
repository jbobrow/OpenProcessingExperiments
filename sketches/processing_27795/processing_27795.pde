
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;
AudioPlayer song8;
AudioPlayer song9;



float x=10, y=5,t=random(10,30),n=random(30,50),u=random(30,50),i=random(10,30); 
int count=20;
float siz=1;
int mmx;
int mmy;
int col;
int colx;
int coly;
int colz;
 int cola=255;
 int colb=255;


void setup() {
  size(500,500);
  smooth();
  minim = new Minim(this);
  song1= minim.loadFile("1.aif");
  song2= minim.loadFile("2.aif");
  song3= minim.loadFile("3.aif");
  song4= minim.loadFile("4.aif");
  song5= minim.loadFile("5.aif");
  song6= minim.loadFile("6.aif");
  song7= minim.loadFile("7.aif");
  song8= minim.loadFile("8.aif");
  song9= minim.loadFile("9.aif");
  //noStroke();
  strokeWeight(6);
   colorMode(HSB);
   
}
void draw() {
  
  

  
  
     if (mouseX>75 && mouseX<125){
  if(mouseY>75 && mouseY<125 && !song1.isPlaying()){
   song1.loop(0);
   colx=0;
   coly=50;
   colz=255;
   col=200;
     siz=50;
   mmx=100;
   mmy=100;
  }
}



    if (mouseX>225 && mouseX<275){
  if(mouseY>75 && mouseY<125 && !song2.isPlaying()){
   song2.loop(0);
  colx=30;
   coly=80;
  colz=255;
   col=0;

   siz=60;
   mmx=250;
   mmy=100;
  }
}



    if (mouseX>375 && mouseX<425){
  if(mouseY>75 && mouseY<125 && !song3.isPlaying()){
   song3.loop(0);
   colx=60;
   coly=110;
   
   colz=255;
   col=200;
    cola=255;
  colb=0;
   siz=70;
   mmx=400;
   mmy=100;
  }
}

    if (mouseX>375 && mouseX<425){
  if(mouseY>225 && mouseY<275 && !song4.isPlaying()){
   song4.loop(0);
   colx=90;
   coly=140;
  colz=255;
   col=200;
   siz=80;
   mmx=400;
   mmy=250;
  }
}
    if (mouseX>375 && mouseX<425){
  if(mouseY>375 && mouseY<425 && !song5.isPlaying()){
   song5.loop(0);
 
  colx=120;
   coly=170;
  colz=255;
   col=200;
   siz=90;
   mmx=400;
   mmy=400;
  }
}

    if (mouseX>225 && mouseX<275){
  if(mouseY>375 && mouseY<425 && !song6.isPlaying()){
   song6.loop(0);
    colx=150;
   coly=200;
   colz=255;
   col=200;
   siz=100;
   mmx=250;
   mmy=400;
  }
}

    if (mouseX>75 && mouseX<125){
  if(mouseY>375 && mouseY<425 && !song7.isPlaying()){
   song7.loop(0);
   colx=180;
   coly=230;
    colz=255;
   col=200;
  
  cola=255;
  colb=255;
  
   siz=110;
   mmx=100;
   mmy=400;
  }
}

    if (mouseX>75 && mouseX<125){
  if(mouseY>225 && mouseY<275 && !song8.isPlaying()){
   song8.loop(0);
   colx=210;
   coly=250;
   colz=255;
   col=200;
   siz=120;
   mmx=100;
   mmy=250;
  }
}

    if (mouseX>225 && mouseX<275){
  if(mouseY>225 && mouseY<275 && !song9.isPlaying()){
   song9.loop(0);
   colx=0;
   coly=255;
  colz=255;
   col=200;
   siz=130;
   mmx=250;
   mmy=250;
  }
}


fill (random(colx,coly),255,255,10);
stroke(random(colx,coly),255,255,10);
 

   ellipse(mmx,mmy,siz,siz);
  
  strokeWeight(2);

  for (int bx = 50; bx < width;  bx+=50) {
    for (int by = 50; by<height; by+=50) {
fill(random(colx,coly),100,random(cola,colb),80); 
  stroke(random(colx,coly),random(colz,col),255,80);

      int z= (mouseX/10-bx/10)*(mouseX/10-bx/10);
      int r=(mouseY/10-by/10)*(mouseY/10-by/10);
      ellipse (bx,by,(z+r)/20+10,(z+r)/20+10);
      
    }
  }
}


