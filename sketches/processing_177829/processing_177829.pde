
PImage El_Salvador,Guatemala,Belice,Honduras,Nicaragua,Panama,Mexico,Costa_Rica,tikal,Salvador,concepcion,francisco,copan,acahualinca,xunantunich,codice;
int a,px,py,anterior,iguales,pxa,pya,iguales2,negro0x,negro0y,negro1x,negro1y,negro2x,negro2y,negro3x,negro3y,negro4x,negro4y,negro5x,negro5y,negro6x,negro6y,negro7x,negro7y,negro8x,negro8y,negro9x,negro9y,negro10x,negro10y,negro11x,negro11y,negro12x,negro12y,negro13x,negro13y,negro14x,negro14y,negro15x,negro15y;
boolean esa,gua,bel,hon,nic,pan,mex,cos;
IntList cadena;

void setup(){
  size(800,600);
  El_Salvador=loadImage("El_Salvador.png");
  Guatemala=loadImage("Guatemala.png");
  Belice=loadImage("Belice.png");
  Honduras=loadImage("Honduras.png");
  Nicaragua=loadImage("Nicaragua.png");
  Panama=loadImage("Panama.png");
  Mexico=loadImage("Mexico.png");
  Costa_Rica=loadImage("Costa_Rica.png");
  tikal=loadImage("tikal.jpg");
  Salvador=loadImage("Salvador.jpg");
  concepcion=loadImage("concepcion.jpg");
  francisco=loadImage("francisco.jpg");
  copan=loadImage("copan.jpg");
  acahualinca=loadImage("acahualinca.jpg");
  xunantunich=loadImage("xunantunich.jpg");
  codice=loadImage("codice.jpg");
  cadena = new IntList();
int i=15;
while(i>=0){
float r=random(16);
if ((cadena.hasValue(int(r)))==false){
   cadena.append(int(r));
    i=i-1;
    }
}
  }

void draw() {
  iguales=anterior-a;
 if ((iguales==1) || (iguales==-1)){
     iguales2=anterior+a;
       if(iguales2==1){
       esa=true;
       negro0x=pxa;
       negro0y=pya;
       negro1x=px;
       negro1y=py;
       image(Salvador,500,20,300,300);
       fill(#050505);
       text("Salvador of the world, El Salvador",500,400);
       }
        if(iguales2==5){
       gua=true;
       negro2x=pxa;
       negro2y=pya;
       negro3x=px;
       negro3y=py;
       image(tikal,500,20,300,300);
       fill(#050505);
       text("Tikal, Guatemala",500,400);
       
        }
        if(iguales2==9){
          text("Iguales Belice",500,140);
          bel=true;
          negro4x=pxa;
       negro4y=pya;
       negro5x=px;
       negro5y=py;
       image(xunantunich,500,20,300,300);
       fill(#050505);
       text("Xunantunich, Belice",500,400);
        }
        if(iguales2==13){
          text("Iguales Honduras",500,160);
          hon=true;
          negro6x=pxa;
       negro6y=pya;
       negro7x=px;
       negro7y=py;
       image(copan,500,20,300,300);
       fill(#050505);
       text("Copan, Honduras",500,400);
        }
        if(iguales2==17){
          text("Iguales Nicaragua",500,180);
          nic=true;
          negro8x=pxa;
       negro8y=pya;
       negro9x=px;
       negro9y=py;
       image(acahualinca,500,20,300,300);
       fill(#050505);
       text("Acahualinca, Nicaragua",500,400);
        }
        if(iguales2==21){
          text("Iguales Panama",500,200);
          pan=true;
          negro10x=pxa;
       negro10y=pya;
       negro11x=px;
       negro11y=py;
       image(francisco,500,20,300,300);
       fill(#050505);
       text("San Francisco, Panama",500,400);
        }
        if(iguales2==25){
          text("Iguales Mexico",500,220);
          mex=true;
          negro12x=pxa;
       negro12y=pya;
       negro13x=px;
       negro13y=py;
       image(codice,500,20,300,300);
       fill(#050505);
       text("Codice, Mexico",500,400);
        }
        if(iguales2==29){
          text("Iguales Costa Rica",500,120);
          cos=true;
          negro14x=pxa;
       negro14y=pya;
       negro15x=px;
       negro15y=py;
       image(tikal,500,20,300,300);
       fill(#050505);
       text("Concepcion, Costa Rica",500,400);
        }
 }
  fill(#D8FC0D);
  rect(0,0,100,60);
  rect(110,0,100,60);
  rect(220,0,100,60);
  rect(330,0,100,60);
  rect(0,70,100,60);
  rect(110,70,100,60);
  rect(220,70,100,60);
  rect(330,70,100,60);
  rect(0,140,100,60);
  rect(110,140,100,60);
  rect(220,140,100,60);
  rect(330,140,100,60);
  rect(0,210,100,60);
  rect(110,210,100,60);
  rect(220,210,100,60);
  rect(330,210,100,60);
 if (esa==true){
   fill(#050505);
   rect(negro0x*110,negro0y*70,100,60);
   rect(negro1x*110,negro1y*70,100,60);
 }
  if (gua==true){
    fill(#050505);
    rect(negro2x*110,negro2y*70,100,60);
    rect(negro3x*110,negro3y*70,100,60);
  }
  if (bel==true){
    fill(#050505);
    rect(negro4x*110,negro4y*70,100,60);
    rect(negro5x*110,negro5y*70,100,60);
  }
  if (hon==true){
    fill(#050505);
    rect(negro6x*110,negro6y*70,100,60);
    rect(negro7x*110,negro7y*70,100,60);
  }
  if (nic==true){
    fill(#050505);
    rect(negro8x*110,negro8y*70,100,60);
    rect(negro9x*110,negro9y*70,100,60);
  }
  if (pan==true){
    fill(#050505);
    rect(negro10x*110,negro10y*70,100,60);
    rect(negro11x*110,negro11y*70,100,60);
  }
  if (mex==true){
    fill(#050505);
    rect(negro12x*110,negro12y*70,100,60);
    rect(negro13x*110,negro13y*70,100,60);
  }
  if (cos==true){
    fill(#050505);
    rect(negro14x*110,negro14y*70,100,60);
    rect(negro15x*110,negro15y*70,100,60);
  }
  
  if ((a==0) || (a==1)){
  image(El_Salvador,px*(110),py*(70),100,60);
  anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==2) || (a==3)){
  image(Guatemala,px*110,py*70,100,60);
  anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==4) || (a==5)){
  image(Belice,px*110,py*70,100,60);
  anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==6) || (a==7)){
  image(Honduras,px*110,py*70,100,60);
  anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==8) || (a==9)){
  image(Nicaragua,px*110,py*70,100,60);
  anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==10) || (a==11)){
    image(Panama,px*110,py*70,100,60);
    anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==12) || (a==13)){
    image(Mexico,px*110,py*70,100,60);
    anterior=a;
  pxa=px;
  pya=py;
  }
  if ((a==14) || (a==15)){
    image(Costa_Rica,px*110,py*70,100,60);
    anterior=a;
  pxa=px;
  pya=py;
  }

}
void mouseClicked(){
  float equis,ye;
  equis=mouseX;
  ye=mouseY;
  if ((equis<=100) && (ye<=60)){
    px=0;
    py=0;
    a=cadena.get(0);
    }
   if ((equis>=110 && equis<=210) && (ye<=60)){
     px=1;
     py=0;
     a=cadena.get(1);
   }
   if((equis>=220 && equis<=320) && (ye<=60)){
     px=2;
     py=0;
     a=cadena.get(2);
   }
   if((equis>=330 && equis<=430) && (ye<=60)){
     px=3;
     py=0;
     a=cadena.get(3);
   }
   if ((ye>=70 && ye<=130) && (equis<=100)){
     px=0;
     py=1;
     a=cadena.get(4);
   }
   if ((equis>=110 && equis<=210) && (ye>=70 &&ye<=130)){
     px=1;
     py=1;
     a=cadena.get(5);
   }
   if ((equis>=220 && equis<=320) && (ye>=70 && ye<=130)){
     px=2;
     py=1;
     a=cadena.get(6);
   }
   if ((equis>=330 && equis<=430) && (ye>=70 && ye <=130)){
     px=3;
     py=1;
     a=cadena.get(7);
   }
   if ((equis<=100) && (ye<=200 & ye>=140)){
     px=0;
     py=2;
     a=cadena.get(8);
     }
    if ((equis>=110 && equis<=210) && (ye>=140 &&ye<=200)){
     px=1;
     py=2; 
     a=cadena.get(9);
   }
   if ((equis>=220 && equis<=320) && (ye>=140 && ye<=200)){
     px=2;
     py=2;
     a=cadena.get(10);
   }
   if ((equis>=330 && equis<=430) && (ye>=140 && ye <=200)){
     px=3;
     py=2;
     a=cadena.get(11);
   }
   if((equis<=100) && (ye>=210 && ye<=270)){
     px=0;
     py=3;
     a=cadena.get(12);
   }
    if ((equis>=110 && equis<=210) && (ye>=210 &&ye<=270)){
      px=1;
      py=3;
     a=cadena.get(13);
   }
   if ((equis>=220 && equis<=320) && (ye>=210 && ye<=270)){
     px=2;
     py=3;
     a=cadena.get(14);
   }
   if ((equis>=330 && equis<=430) && (ye>=210 && ye <=270)){
     px=3;
     py=3;
     a=cadena.get(15);
   }
        
}
    
  


