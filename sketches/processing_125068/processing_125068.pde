
import ddf.minim.*;

PImage firstSlide;
PImage[] imagesArray=new PImage[9];
boolean playing=false;
int currentImageIndex=0;

Minim minim=new Minim(this);
AudioSample[] audioSampleArray=new AudioSample[9];

void setup(){
  size(1000,800);
  firstSlide=loadImage("FistSlide.jpg");
  for(int i=0;i<=8;i=i+1){
    //println((i+1)+ ".jpg");
    imagesArray[i]=loadImage((i+1)+ ".jpg");
    audioSampleArray[i]=minim.loadSample((i+1)+ ".wav");
  }
}

void draw(){
  //println(playing);
  if(playing==false){
      image(firstSlide,0,0);
  }
  else
  {
    //println(currentImageIndex);
    image(imagesArray[currentImageIndex],0,0);
      
  } 
}

void keyPressed(){
  if(key==ENTER)
  {
     if(playing==false)
     {
         playing=true;
         currentImageIndex=0;  
     }
     else
     {
        
        if(currentImageIndex==8)
        {
          playing=false;
          return;
        }
        else
        {
          currentImageIndex=currentImageIndex+1;
        }       
     }
     audioSampleArray[currentImageIndex].trigger();
    
  }
  
}



