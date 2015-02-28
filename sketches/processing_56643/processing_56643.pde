
float x,y; 
int g=20,punti=0; //grandezza
float xv=3,q=100,w=20; 
float yv=4; 
int yd=1;
int xd=1;
float a=0;
float b=0;
PFont fontA;
PImage img;
void setup(){
  size(600,600);
 img= loadImage("ciao.jpg");
 fontA=loadFont("AgencyFB-Bold-16.vlw");
 textFont(fontA, 18);
  y=300;
  x=300;
}
void draw(){
 image(img,0,0);
  x=x+(xv*xd);
  y=y+(yv*yd);
  if(x> width-g || x<0){
                        xd*=-1;
                                
  }
  if(y> height-g/2 || y<10){
    yd*=-1;
  
  }
  
  /*ferma pallina
  if (mousePressed){
    xv=0;
    yv=0;
  }
  else{
    xv=3;
    yv=4;
  }
 */
  a=x+g/2;
  b=y+g/g;
  //menu
  if(keyPressed){
    if(key=='+'){
      yv=yv+0.3;
      xv=xv+0.3;
    }
    }
  if(keyPressed){
    if(key=='-'){
      if(yv>=0.5){
      yv=yv-0.3;
      xv=xv-0.3;
    }
    }
    }  
  //punteggio
  if(b<=10)
  {
    punti=punti+1;
  }
   if(b>=590)
  {
    punti=punti-2;
  }
   ellipse(a,b,g,g);
  
  //retta + rimbalzo retta
  rect (min(mouseX,500),500,q,w);
  
  //(rimbalzo)
  if(b>=490 && b<=530 && a>=mouseX && a<=mouseX+100){
    yd*=-1;
  }
  if(b>=490 && b<=530 && a>=mouseX && a<=mouseX+3){
    xd*=-1;
  }
  if(b>=490 && b<=530 && a>=mouseX+97 && a<=mouseX+100){
    xd*=-1;
  }
  
  //punteggio
  text("punteggio: ",420,20);
  text(punti,485,20);
  text("premi + x aumentare(speed)",420,40);
  text("premi - x diminuire(speed)",420,60);
  if(punti==-10){
    xv=0;
    yv=0;
    x=300;
    y=300;
   text("Hai perso:(press 'e' for exit)",200,200);
   if(keyPressed)
    {
      if(key=='e'){
      exit();
      }
      }
      }

}//end programma    

    
  
    



