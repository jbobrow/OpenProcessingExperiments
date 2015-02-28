
/*-------------------
Codi creat per Arnau Cuadras
Pràctica "P3_b"
Informàtica
Grup 4
2n GEDI
ELISAVA
-------------------*/
//Definition of variables//
int vx=12;//x axis speed//
int vy=10;//y axis speed//
int posx=width/2;//x axis start point//
int posy=height/2;//y axis start point//
float midax=random(10,20);//geometry width//
float miday=random(10,20);//geometry height//
void setup(){
  size(600,600);//window size//
}
void draw(){
 midax=random(10,20);//geometry width//
 miday=random(10,20);//geometry height//
  fill(0,20);
  rect(0,0,width,height);//rectangle used as a background for creating the blurriness//
  posx=posx+vx;//x axis movement definition//
   posy=posy+vy;//y axis movement definition//   
   fill(255);
     for(int i=0; i<100;i++){
         fill(random(posx),random(posx),random(posy),random(posy));      
    ellipse(posx+random(width),posy,midax,miday);
             }
    if (posx>=width){
    vx=-vx;
    }
    if (posy>=height){
    vy=-vy;
    }
    if (posx<=0){
    vx=-vx;
    }
    if (posy<=0){
    vy=-vy;
    }
}
void mousePressed(){
 posx=0;
 posy=mouseY;
 }
