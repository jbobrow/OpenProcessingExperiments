
PImage hintergrund;
PImage ball;
PImage ballflach;
PImage ballflach1;
PImage ballflach2;
PImage ballflach3;
PImage ballflach4;
PImage ballgeknuellt;
PImage ballsprung1;
PImage ballsprung2;
PImage ballsprung3;
PImage ballsprung4;
PImage ballsprung5;
PImage ballsprung6;
PImage ballsprung7;
PImage ballsprung8;
PImage ballsprung9;
PImage balldefekt1;
PImage balldefekt2;
PImage balldefekt3;
PImage balldefekt4;

int counter = 0;

int jetzt;

void setup() {
  size(1000, 700);

  hintergrund = loadImage("img_0026_Ebene-1.png");
  ballflach = loadImage("img_0025_Ebene-2.png");
  ballflach1 = loadImage("img_0024_Ebene-3.png");
  ballflach2 = loadImage("img_0023_Ebene-4.png");
  ballflach3 = loadImage("img_0022_Ebene-5.png");
  ballflach4 = loadImage("img_0021_Ebene-6.png");
  ballgeknuellt = loadImage("img_0020_Ebene-7.png");
  ballsprung1 = loadImage("img_0019_Ebene-8.png");
  ballsprung2 = loadImage("img_0017_Ebene-10.png");
  ballsprung3 = loadImage("img_0016_Ebene-11.png");
  ballsprung4 = loadImage("img_0015_Ebene-12.png");
  ballsprung5 = loadImage("img_0014_Ebene13.png");
  ballsprung6 = loadImage("img_0013_Ebene-12-kopieren.png");
  ballsprung7 = loadImage("img_0012_Ebene-14.png");
  ballsprung8 = loadImage("img_0011_Ebene-15.png");
  ballsprung9 = loadImage("img_0010_Ebene-16.png");
  
  balldefekt1= loadImage("img_0007_Ebene-19.png");
  balldefekt2= loadImage("img_0006_Ebene-20.png");
  balldefekt3= loadImage("img_0005_Ebene-21.png");
  balldefekt4= loadImage("img_0004_Ebene-22.png");
  
}

void draw() {

if(counter<10){
  if (mouseX>390 && mouseX<440 && mouseY>280 && mouseY<450) {
    ball=ballflach1;
  }
  else if (mouseX>460 && mouseX<660 && mouseY>220 && mouseY<280) {
    ball=ballflach2;
  }
  else if (mouseX>680 && mouseX<730 && mouseY>280 && mouseY<450) {
    ball=ballflach3;
  }
  else if (mouseX>460 && mouseX<660 && mouseY>420 && mouseY<480) {
    ball=ballflach4;
  }
     else {
    ball=ballflach;
  }
}
else{ball=balldefekt4;}

   
   if(jetzt != 0 && counter<10){
    if (millis()<jetzt+100) {
        ball=ballgeknuellt;
      }
      else if (millis()<jetzt+200) {
        ball=ballsprung1;
      }
      else if (millis()<jetzt+350) {
        ball=ballsprung2;
      }
      else if (millis()<jetzt+450) {
        ball=ballsprung3;
      }
      else if (millis()<jetzt+550) {
        ball=ballsprung4;
      }
      else if (millis()<jetzt+700) {
        ball=ballsprung5;
      }
      else if (millis()<jetzt+800) {
        ball=ballsprung6;
      }
      else if (millis()<jetzt+900) {
        ball=ballsprung7;
      }
      else if (millis()<jetzt+1000) {
        ball=ballsprung8;
      }
      else if (millis()<jetzt+1100) {
        ball=ballsprung9;
      }
      else if (millis()<jetzt+1200) {
        ball=ballflach;
      }
    
   }
   
 
 if (counter==10){
 
 if(jetzt != 0){
    if (millis()<jetzt+100) {
        ball=balldefekt1;
      }
      else if (millis()<jetzt+200) {
        ball=balldefekt2;
      }
      else if (millis()<jetzt+350) {
        ball=balldefekt3;
      }
      else if (millis()<jetzt+450) {
        ball=balldefekt4;
      }
 }
 
 
 }

  image(hintergrund, 0, 0);
  image(ball, 0, 0);
}

void mouseClicked(){
  
      jetzt=millis();
      
     
 counter=counter+1;
      




}



