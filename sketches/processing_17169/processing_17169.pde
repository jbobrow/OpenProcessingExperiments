
//import processing.opengl.*;
int pokoj;
int mouseXX;
int mouseYY;
boolean wskaz, miejsce;

PImage strzalka;
PImage strzalkad;
PImage strzalkap;
PImage strzalkal;
PImage oko;
PImage mapa;

PFont font1;
PFont font2;

float angle = 0;
int dokladnosc = 15;
float angleIncrement = TWO_PI / dokladnosc;

void setup() {
  size(800,600,P3D);
frame.setTitle("Galeria Świata Dysku. Projekt wykonał Cyprian Pietrykowski");

}

void draw() {
switch (pokoj)
    {
      case 0:
        pokoj0();
          if (((mouseX>275)&&(mouseX<500))&&((mouseY>130)&&(mouseY<450))) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 1;
        break;
      case 1:
        pokoj1();
          if ((mouseY>500)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 0;
          if ((mouseX>320)&(mouseX<480)& (mouseY>210)&(mouseY<320))
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 2;
        if ((mouseX>190)&(mouseX<230)& (mouseY>205)&(mouseY<275))
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 9;
        if ((mouseX>560)&(mouseX<615)& (mouseY>190)&(mouseY<280))
              wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 10;
        break;
      case 2:
        pokoj2();
        XX=0;
        YY=0;
        zoom = 1;
         if ((mouseY>500)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
         if (wskaz && miejsce) pokoj = 1;
          if ((mouseX>680)&(mouseX<760)& (mouseY>170)&(mouseY<360))
               wskaz = true;
             else 
               wskaz = false;
         if (wskaz && miejsce) pokoj = 4;
          if ((mouseX>30)&(mouseX<110)& (mouseY>170)&(mouseY<360)) 
               wskaz = true;
             else 
               wskaz = false;
         if (wskaz && miejsce) pokoj = 3;
         if ((mouseX>296)&(mouseX<500)& (mouseY>310)&(mouseY<360))
               wskaz = true;
             else 
               wskaz = false;
         if (wskaz && miejsce) pokoj = 8;
        break;
      case 3:
        pokoj3();
        if ((mouseY>500)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 2;
       if ((mouseX>360)&(mouseX<440)& (mouseY>280)&(mouseY<360))   
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 6;          
        break;
      case 4:
        pokoj4();
        if ((mouseY>500)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 2;
        if ((mouseX>445)&(mouseX<530)& (mouseY>290)&(mouseY<420)) 
              wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 5;
        break;
      case 5:
        pokoj5();
        if ((mouseY>530)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 4;
        break;
      case 6:
        pokoj6();
        if ((mouseY>530)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 3;
        break;
      case 7:
        pokoj7();
        if ((mouseY>500)&&(mouseY<600)) 
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 2;
        break;
      case 8:
        pokoj8();
        if ((mouseX>645)&&(mouseX<765)&&(mouseY>560)&&(mouseY<595))
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 2;
        break;
      case 9:
        pokoj9();
          if ((mouseX>80)&(mouseX<280)& (mouseY>480)&(mouseY<530))
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 1;
        break;       
        
      case 10:
        pokoj10();    
          if ((mouseX>530)&(mouseX<730)& (mouseY>450)&(mouseY<500))
               wskaz = true;
             else 
               wskaz = false;
          if (wskaz && miejsce) pokoj = 1;
        break;    
    }
 
 if(mouseX<0) mouseXX=0;
 else if (mouseX>width)
 mouseXX=width;
 else mouseXX=mouseX;
 
  if(mouseY<0) mouseYY=0;
 else if (mouseY>height)
 mouseYY=height;
 else mouseYY=mouseY;
   println(mouseX + "    "  + mouseY + "           " + pokoj); 
}

void mousePressed(){
miejsce=true;
}

void mouseReleased() {
miejsce=false;
}

