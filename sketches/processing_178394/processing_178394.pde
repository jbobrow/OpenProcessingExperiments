
//Audio library
import ddf.minim.*;
//Audio variable
Minim minim;
AudioSample song;
//Images variables
PImage m0, m1, m2, m3, m4, m5, m6, m7, m8, m9;
PImage []ImageArray=new PImage[10];

void setup(){

size (800,600);//canvas size
m0=loadImage("mountain1.png"); //load 1st image
m1=loadImage("mountain2.png");
m2=loadImage("mountain3.png");
m3=loadImage("mountain4.png");
m4=loadImage("mountain5.png");
m5=loadImage("mountain6.png");
m6=loadImage("mountain7.png");
m7=loadImage("mountain8.png");
m8=loadImage("mountain9.png");
m9=loadImage("mountain10.png");//load 10th image
ImageArray[0]=m0;//fist image on 0 array position
ImageArray[1]=m1;
ImageArray[2]=m2;
ImageArray[3]=m3;
ImageArray[4]=m4;
ImageArray[5]=m5;
ImageArray[6]=m6;
ImageArray[7]=m7;
ImageArray[8]=m8;
ImageArray[9]=m9;

minim=new Minim(this);
song= minim.loadSample("mantrasong.mp3");
//imageMode(CENTER);
}
void draw(){
}

void mousePressed(){// when you clic on screen images are changing randomly
 // for(int b=0; b<10; b++){
  //}
  image(ImageArray[int(random(ImageArray.length))],0,0);
  //If I want change position X and Y of my image 
  //image(ImageArray[int(random(ImageArray.length))],random(width),random(height),400,300);
}

void keyPressed(){//you need press m letter to listen a background song
  if(key == 'm') song.trigger();
  
}

