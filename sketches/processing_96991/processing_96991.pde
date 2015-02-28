
/*-------------------
Codi creat per Arnau Cuadras
Pràctica "P3_b"
Informàtica
Grup 4
2n GEDI
ELISAVA
-------------------*/
var audioElement = document.createElement("audio");//create audio player//
int vxr=12;//x axis rect speed//
int vyr=10;//y axis rect speed//
int posxr=width/2;//x axis rect start point//
int posyr=height/2;//y axis rect start point//
int vx=12;//x axis ellipse speed//
int vy=10;//y axis ellipse speed//
int posx=width/2;//x axis ellipse start point//
int posy=height/2;//y axis ellipse start point//
float midax=random(10,20);//ellipse geometry width//
float miday=random(10,20);//ellipse geometry height//
float midaXr=0;//rect geometry width//
float midaYr=0;//rect geometry height//
void setup(){
   size(600,600,P2D);//window size//
  audioElement.setAttribute("src", "Woodkid - Iron.mp3");//import mp3 data//
  audioElement.play();//play sound//
}
void draw(){
   fill(0,20);
    rect(0,0,width,height);//rectangle used as a background for creating the blurriness//
  posx=posx+vx;//x axis ellipse movement definition//
   posy=posy+vy;//y axis ellipse movement definition//  
    posxr=posxr+vxr;//x axis rect movement definition//
   posyr=posyr+vyr;//y axis rect movement definition// 
      fill(255);
     for(int i=0; i<100;i++){//bucle definition//
    fill(random(posx),random(posx),random(posy),random(posy));//ellipse color//     
    ellipse(posx+random(width),posy,midax,miday);//ellipse definition//
    fill(random(posxr),random(posyr),random(posyr),random(posxr)); //rect color//
    rect(posxr+random(width),posyr,midaXr,midaYr);//rect definition//
                          }//geometries bounce//
    if ((posx+midax)>=width){
    vx=-vx;
    }
    if ((posy+miday)>=height){
    vy=-vy;
    }
    if ((posx+midax)<=0){
    vx=-vx;
    }
    if ((posy+miday)<=0){
    vy=-vy;
    }
     if ((posxr+midaXr)>=width){
    vxr=-vxr;
    }
    if ((posyr+midaYr)>=height){
    vyr=-vyr;
    }
    if ((posxr+midaXr)<=0){
    vxr=-vxr;
    }
    if ((posyr+midaYr)<=0){
    vyr=-vyr;
    }
}
void mousePressed(){//change from rect to ellipse// 
 posx=0;
 posy=mouseY;
 if (mouseX>=width/2){
   midax=0;//hide ellipse//
   miday=0; //hide ellipse//        
    midaXr=random(10,20);//rect geometry width//
    midaYr=random(10,20);//rect geometry height//
    }  
   else{
midax=random(10,20);//ellipse geometry width//
miday=random(10,20);//ellipse geometry height//
midaXr=0;//hide rect//
midaYr=0;//hide rect//
 }
}

