
/*
- add music
Have other characters as the "tail" also include allmates
music notes as attacks
avoid guards,/shoot them 
after collecting all the characters and almates, have final fight with Usagi or head guy*/

//Background image, edited in Photoshop//
PImage display;
//int gamerstat=0;
//int playerstat=0;


//Setup for 'down' walking Aoba//
int afframes=22;
int panelaf=1;
PImage aFront=new PImage[afframes];

//Setup for 'up' walking Aoba//
int abframes=22;
int panelab=1;
PImage aBack=new PImage[abframes];

//Setup for 'right' walking Aoba//
int arframes=22;
int panelar=1;
PImage aRight=new PImage[arframes];

//Setup for 'left' walking Aoba//
int alframes=22;
int panelal=1;
PImage aLeft=new PImage[alframes];

float xpos=450;
float ypos=450;
//var music1= new Audio ("SlaughterParty.mp3");


void setup(){
  size(900,700);
  //frameRate(100);
  display = requestImage("Background.jpg");
  
  for(int f=0;f<aFront.length;f++){
    aFront[f]=requestImage("aobaFront"+f+".png");
  }
    for(int b=0;b<aBack.length;b++){
      aBack[b]=requestImage("aobaUp"+b+".png");
    }
      for(int r=0;r<aRight.length;r++){
        aRight[r]=requestImage("aobaRight"+r+".png");
      }
        for(int l=0;l<aLeft.length;l++){
          aLeft[l]=requestImage("aobaLeft"+l+".png");
        }
}
void draw(){

  fill(#161364);
  rect(0,0,width,height);
  image(display,0,0,width,height);
 /*if(gamerstat == playerstat){
   if(music1.paused==true){
     music1.load();
     music1.play();
   }
 }*/
  if(keyPressed){
    if(key=='s'||key=='S'||keyCode==DOWN){
      ypos++;
      panelaf=(panelaf+1)%afframes;
      image(aFront[panelaf%afframes],xpos,ypos);
    }
      if(key=='w'||key=='W'||keyCode==UP){
        ypos--;
        panelab=(panelab+1)%abframes;
        image(aBack[panelab%abframes],xpos,ypos);
      }
        if(key=='d'||key=='D'||keyCode==RIGHT){
          xpos++;
          panelar=(panelar+1)%arframes;
          image(aRight[panelar%arframes],xpos,ypos);
        }
          if(key=='a'||key=='A'||keyCode==LEFT){
            xpos--;
            panelal=(panelal+1)%alframes;
            image(aLeft[panelal%alframes],xpos,ypos);  
          }
    
}
  
      else{
        image(aFront[panelaf%afframes],xpos,ypos);
  
}
 
}


