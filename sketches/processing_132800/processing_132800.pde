

float xpos; //variabili prima lettera
float ypos;

float xpos1;  // varibili seconda lettera
float ypos1;

float xpos2;  // variabili terza lettera
float ypos2;

float xpos3;  // variabili quarta lettera
float ypos3;

float xpos4;  // variabili quinta lettera
float ypos4;

float xpos5;  // variabili sesta lettera
float ypos5;

float xpos6;  // variabili settima lettera
float ypos6;

float xpos7;  // variabili ottava lettera
float ypos7;

float xpos8;  // variabili nona lettera
float ypos8;

float xpos9;  // variabili decima lettera
float ypos9;

float xpos10;  // variabili undicesima lettera
float ypos10;

int bsize;

float yspeed; //velocità prima lettera
float xspeed;

float xspeed1; //velocità seconda lettera
float yspeed1;

float xspeed2; // velocità terza lettera 
float yspeed2;

float xspeed3; // velocità quarta lettera
float yspeed3;

float xspeed4; // velocità quinta lettera
float yspeed4;

float xspeed5; // velocità sesta lettera
float yspeed5;

float xspeed6; // velocità settima lettera
float yspeed6;

float xspeed7; // velocità ottava lettera
float yspeed7;

float xspeed8; // velocità nona lettera
float yspeed8;

float xspeed9; // velocità decima lettera
float yspeed9;

float xspeed10; // velocità undicesima lettera
float yspeed10;

float radius; // variavile di profondità delle lettere

float gravity; // variabile che regola l'attrazione verso il basso delle lettere

int holdsecond=second(); // variabili per far visualizzare le scritte "BELLE" e "ARTI"
int howlongtoshow=2; 
boolean onoff = false;

 PImage A;
 PImage C1;
PImage C2;
PImage A1;
PImage D;
PImage E;
PImage M;
PImage I;
PImage A2;
PImage D1;
PImage I1;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  
  size(500,500);


//la lettera comparirà a random in un settore di misure prestabilite
  xpos=int(random(10,10)); 
  ypos=int(random(10,10));
  
  xpos1=int(random(10,10));
  ypos1=int(random(10,10));
  
  xpos2=int(random(10,10));
  ypos2=int(random(10,10));
  
  xpos3=int(random(10,10));
  ypos3=int(random(10,10));
  
  xpos4=int(random(10,10));
  ypos4=int(random(10,10));
  
  xpos5=int(random(10,10));
  ypos5=int(random(10,10));
  
  xpos6=int(random(10,10));
  ypos6=int(random(10,10));
  
  xpos7=int(random(10,10));
  ypos7=int(random(10,10));
  
  xpos8=int(random(10,10));
  ypos8=int(random(10,10));

 xpos9=int(random(10,10));
  ypos9=int(random(10,10));
  
  xpos10=int(random(10,10));
  ypos10=int(random(10,10));
  
  radius=50;
  
  xspeed=5;  //velocità variabili prima lettera A
  yspeed=8;
 
  xspeed1=8;  //velocità variabili seconda lettera C
  yspeed1=13;
 
  xspeed2=12;  //velocità variabili terza lettera C
  yspeed2=15;
  
  xspeed3=12;  //velocità variabili quarta lettera A
  yspeed3=25;
  
  xspeed4=14;  //velocità variabili quinta lettera D
  yspeed4=25;
  
  xspeed5=15;  //velocità variabili sesta lettera E
  yspeed5=36; 
 
  xspeed6=15;  //velocità variabili settima lettera M
  yspeed6=19;
  
  xspeed7=13;  //velocità variabili ottava lettera I
  yspeed7=36;
  
  xspeed8=19;  //velocità variabili nona lettera A
  yspeed8=25;
  
 
  xspeed9=13;  //velocità variabili decima lettera D
  yspeed9=36;
  
  xspeed10=19;  //velocità variabili undicesima lettera I
  yspeed10=25;
 
  gravity=5;
  A=loadImage("A.png"); 
C1=loadImage("C1.png");
C2=loadImage("C2.png");
A1=loadImage("A1.png");
D=loadImage("D.png");
E=loadImage("E.png");
M=loadImage("M.png");
I=loadImage("I.png");
A2=loadImage("A2.png");
D1=loadImage("D1.png");
I1=loadImage("I1.png");

img1=loadImage("elefante.png");
img2=loadImage("elefante1.png");
img3=loadImage("elefante2.png");
img4=loadImage("cornice.png");

image(img2,0,274);
image(img3,0,274);

}
//start draw
void draw(){
  background(img4);
  fill(255,0,0,50);
  
   yspeed=yspeed+gravity;
  image(A,xpos,ypos-400,radius,radius);
 image(C1,xpos1+43,ypos1-380,radius,radius);
 image(C2,xpos2+80,ypos2-400,radius,radius);
image(A1,xpos3+122,ypos3-380,radius,radius);
image(D,xpos4+175,ypos4-400,radius,radius);
image(E,xpos5+217,ypos5-380,radius,radius);
image(M,xpos6+261,ypos6-400,radius,radius);
image(I,xpos7+302,ypos7-380,radius,radius);
image(A,xpos8+335,ypos8-400,radius,radius);
image(D1,xpos9+100,ypos9-280,radius,radius);
image(I1,xpos10+140,ypos10-265,radius,radius);

image(img1,0,274);


 
  //trattiene y
  ypos=ypos+yspeed;
  
  if (ypos>height-radius/2){
   //riduce la velocita della prima lettera sull'asse delle y
   
   yspeed=yspeed*-1;
   
  }
  ypos1=ypos1+yspeed+10;
  if (ypos1>height-radius/2){
    //riduce la velocità della seconda lettera sull'asse delle y
     
      yspeed1=yspeed1*-3;
 
  }
   
   
    ypos2=ypos2+yspeed+15;
 
  if (ypos2>height-radius/2){
    //riduce la velocità della terza lettera sull'asse delle y
   
    yspeed2=yspeed2*-5;
   
 }
   
   
   ypos3=ypos3+yspeed+18;
 
  if (ypos3>height-radius/2){
    //riduce la velocità della quarta lettera sull'asse delle y
   
   yspeed3=yspeed3*-5;
 }
  
  
    ypos4=ypos4+yspeed+22;
 
  if (ypos4>height-radius/2){
    //riduce la velocità della quinta lettera sull'asse delle y
   
    yspeed4=yspeed4*-7;
 }
  
   
   ypos5=ypos5+yspeed+25;
  
  if (ypos5>height-radius/2){
   //riduce la velocita della sesta lettera sull'asse delle y
   
    yspeed1=yspeed1*-9;
  }


   ypos6=ypos6+yspeed+26;
  
  if (ypos>height-radius/2){
   //riduce la velocita della settima lettera sull'asse delle y
   
    yspeed6=yspeed6*-11;
   
  }
  ypos7=ypos7+yspeed+33;
  
  if (ypos1>height-radius/2){
    //riduce la velocità della ottava lettera sull'asse delle y
   
  yspeed7=yspeed7*-35;
  }
   
   
    ypos8=ypos8+yspeed+37;
 
  if (ypos2>height-radius/2){
    //riduce la velocità della nona lettera sull'asse delle y
   
   yspeed8=yspeed8*-17;

 }
 
 ypos9=ypos9+yspeed+14;
  
  if (ypos9>height-radius/2){
   //riduce la velocita della decima lettera sull'asse delle y
   
   yspeed9=yspeed9*-1;
   
  }
  ypos10=ypos10+yspeed+10;
  if (ypos1>height-radius/2){
    //riduce la velocità della undicesima lettera sull'asse delle y
     
      yspeed10=yspeed10*-3;
 
  }  
 
   
   if (ypos<0+radius/2){
    yspeed=-yspeed;
  }
   if (ypos1<0+radius/2){
    yspeed1=-yspeed1;
  }
  
   if (ypos2<0+radius/2){
    yspeed2=-yspeed2;
  }
 
 if (ypos3<0+radius/2){
    yspeed3=-yspeed3;
  }
  
  if (ypos4<0+radius/2){
    yspeed4=-yspeed4;
  }
 
 if (ypos5<0+radius/2){
    yspeed5=-yspeed5;
  }
 
 if (ypos6<0+radius/2){
    yspeed6=-yspeed6;
  }
  
  if (ypos7<0+radius/2){
    yspeed7=-yspeed7;
  }
 
 if (ypos8<0+radius/2){
    yspeed8=-yspeed8;
  }
  
  if (ypos9<0+radius/2){
    yspeed9=-yspeed9;
  }
 
 if (ypos10<0+radius/2){
    yspeed10=-yspeed10;
  }
 
  //trattiene x
   xpos=xpos+xspeed;
  
  
  if (xpos>width-radius/2){  
    xspeed=-xspeed;
    
  }
 xpos1=xpos1+xspeed1;
 
  if (xpos1>width-radius/2){
    xspeed1=-xspeed1;
    
  } 
 
  xpos2=xpos2+xspeed2;
 
  if (xpos2>width-radius/2){
    xspeed2=-xspeed2;
    
  } 
 
 xpos3=xpos3+xspeed3;
 
  if (xpos3>width-radius/2){
    xspeed3=-xspeed3;
    
  } 
  
  xpos4=xpos4+xspeed4;
 
  if (xpos4>width-radius/2){
    xspeed4=-xspeed4;
    
 xpos5=xpos5+xspeed5;
  
  
  if (xpos5>width-radius/2){  
    xspeed5=-xspeed5;
    
  } 

 xpos6=xpos6+xspeed6;
  
  
  if (xpos6>width-radius/2){  
    xspeed6=-xspeed6;
    
  }
 xpos7=xpos7+xspeed7;
 
  if (xpos7>width-radius/2){
    xspeed7=-xspeed7;
    
  } 
 
  xpos8=xpos8+xspeed8;
 
  if (xpos8>width-radius/2){
    xspeed8=-xspeed8;
    
  } 

xpos9=xpos9+xspeed9;
  
  
  if (xpos9>width-radius/2){  
    xspeed9=-xspeed9;
    
  }
 xpos10=xpos10+xspeed10;
 
  if (xpos10>width-radius/2){
    xspeed10=-xspeed10;
    
  } 

} 
 
  if (xpos<0+radius/2){
    xspeed=-xspeed;
  }
  if (xpos1<0+radius/2){
    xspeed1=-xspeed1;
  } 
  if (xpos2<0+radius/2){
    xspeed2=-xspeed2;
  } 
  if (xpos3<0+radius/2){
    xspeed3=-xspeed3;
  } 
  
  if (xpos4<0+radius/2){
    xspeed4=-xspeed4;
  } 
  
  if (xpos5<0+radius/2){
    xspeed5=-xspeed5;
  } 
  
   if (xpos6<0+radius/2){
    xspeed6=-xspeed6;
  } 
  
  if (xpos7<0+radius/2){
    xspeed7=-xspeed7;
  } 
  
  if (xpos8<0+radius/2){
    xspeed8=-xspeed8;
  } 
  
  if (xpos9<0+radius/2){
    xspeed9=-xspeed9;
  } 
  
  if (xpos10<0+radius/2){
    xspeed10=-xspeed10;
  } 
  
 
  if (ypos>height-radius/2){
   ypos=height-radius/2;
   //riduce la velocità della prima lettera sull'asse delle x
   
   xspeed=xspeed*.8;
 }
if (ypos1>height-radius/2){
   ypos1=height-radius/2;
   //riduce la velocità della seconda lettera sull'asse delle x
   
   xspeed1=xspeed1*.18;
 }

if (ypos2>height-radius/2){
   ypos2=height-radius/2;
   //riduce la velocità della terza lettera sull'asse delle x
   
   xspeed2=xspeed2*.10;
 }
 if (ypos3>height-radius/2){
   ypos3=height-radius/2;
   //riduce la velocità della quarta lettera sull'asse delle x
   
   xspeed3=xspeed3*.12;
 }
 
 if (ypos4>height-radius/2){
   ypos4=height-radius/2;
   //riduce la velocità della quinta lettera sull'asse delle x
   
   xspeed4=xspeed4*.14;
 }
 
  if (ypos5>height-radius/2){
   ypos5=height-radius/2;
   //riduce la velocità della sesta lettera sull'asse delle x
   
   xspeed5=xspeed5*.19;
 }
 
  if (ypos6>height-radius/2){
   ypos6=height-radius/2;
   //riduce la velocità della settima lettera sull'asse delle x
   
   xspeed6=xspeed6*.22;
 }
if (ypos7>height-radius/2){
   ypos7=height-radius/2;
   //riduce la velocità della ottava lettera sull'asse delle x
   
   xspeed7=xspeed7*.21;
 }

if (ypos8>height-radius/2){
   ypos8=height-radius/2;
   //riduce la velocità della nona lettera sull'asse delle x
   
   xspeed8=xspeed8*.10;
 }
 
 if (ypos9>height-radius/2){
   ypos9=height-radius/2;
   //riduce la velocità della decima lettera sull'asse delle x
   
   xspeed=xspeed*.18;
 }
if (ypos10>height-radius/2){
   ypos10=height-radius/2;
   //riduce la velocità della undicesima lettera sull'asse delle x
   
   xspeed10=xspeed10*.15;
 }

 if (xpos>width-radius/2){
   xpos=width-radius/2;
       
   
 }
if (xpos1>width-radius/2){
   xpos1=width-radius/2;
       
   
 }
 
 if (xpos2>width-radius/2){
   xpos2=width-radius/2;
       
   
 }
 
 if (xpos3>width-radius/2){
   xpos3=width-radius/2;
       
   
 }
 
  if (xpos4>width-radius/2){
   xpos4=width-radius/2;
       
   
 }
 
  if (xpos4>width-radius/2){
   xpos5=width-radius/2;
       
   
 }

if (xpos6>width-radius/2){
   xpos6=width-radius/2;
       
   
 }
if (xpos7>width-radius/2){
   xpos7=width-radius/2;
       
   
 }
 
 if (xpos8>width-radius/2){
   xpos8=width-radius/2;
       
   }

if (xpos9>width-radius/2){
   xpos9=width-radius/2;
         
 }

if (xpos10>width-radius/2){
   xpos10=width-radius/2;
       
   
 }

if (onoff==true && mouseX>1 && mouseY>365 && mouseX<200 && mouseY<500 ){  // per la scritta "BELLE"
   
   image(img2,0,274);
  }

if (onoff==true && mouseX>300 && mouseY>365 && mouseX<500 && mouseY<500 ){  // per la scritta "ARTI"
   
   image(img3,0,274);
  }

}
void mouseMoved() { 
  
  // legato alla funzione per far comparire e scomparire la scritta "BELLE"
if(mouseX>1 && mouseY>365 && mouseX<200 && mouseY<500) {

 onoff=true;
   if (second()>59-howlongtoshow){
    holdsecond=howlongtoshow+second()-60;
  }else{
    holdsecond=second()+howlongtoshow;
  }
}

// legato alla funzione per far comparire e scomparire la scritta "ARTI"
if(mouseX>300 && mouseY>365 && mouseX<500 && mouseY<500) {

 onoff=true;
   if (second()>59-howlongtoshow){
    holdsecond=howlongtoshow+second()-60;
  }else{
    holdsecond=second()+howlongtoshow;
  }
}

}


