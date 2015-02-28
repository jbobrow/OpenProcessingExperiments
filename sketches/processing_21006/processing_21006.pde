
//import PDF library
import processing.pdf.*;
//create a boolean to turn recording on/off
boolean record;

int x = 50;
int y = 50;

//import PDF library
import processing.pdf.*;


void setup() {
 size (500, 720);
 background(255,255,128);
}

void draw (){
  
  //use an if statement to start recording
if (record) {
// Note that #### will be replaced with the frame number. Fancy!
beginRecord(PDF, "frame-####.pdf");
}
  
  
//noStroke();
 rectMode(CENTER);
 noStroke();
 //funciones
 while (x <= width) {
   fill (255,166,77);
  rect (x, 50, 30,30); 
   rect (x, 650, 30,110);
  x = x +100;
 }
 while (y <= height) {
  rect (50, y, 30,30); 
  rect (450, y, 30,30); 
  
  y = y +100;
 }
 fill(255,135,15,30);
rect (width/2, height/2-110,150,150);
 fill(255,135,15,80);
rect (width/2,height/2-110, 30, 450);
rect (width/2,height/2-110, 450, 30);

/*lineas en forma de L*/
//izq
 fill(207,111,63);
rect (130,120, 90, 30);
rect (100,150, 30, 90);


rect (130,380, 90, 30);
rect (100,350, 30, 90);



//derecha
rect (370,120, 90, 30);
rect (400,150, 30, 90);


rect (370,380, 90, 30);
rect (400,350, 30, 90);


//centros
 fill(215,93,95);
//centro izq
rect(130,150,30,30);
rect(130,350,30,30);

//centro derecha
rect(370,150,30,30);
rect(370,350,30,30);

fill(92,214,214);
//rombo central
triangle(200,250,300,250,width/2,180);
triangle(200,250,300,250,width/2,320);
//cuadros inferiores

rect(width/2+100,height/2+140,60,60);
rect(width/2-100,height/2+140,60,60);

//cuadro final
fill(47,188,188);
rect(width/2,height/2-110,50,50);

//lineas inferores
   fill (255,166,77);
rect(width/2, 610, 430, 30);
rect(width/2, 690, 430, 30);




//use an if statement to stop recording and turn recording off
if (record) {
endRecord();
record = false;
}


}



//if you press a key, a pdf will be recorded
void keyPressed () {
record = true;
}

         
                                
