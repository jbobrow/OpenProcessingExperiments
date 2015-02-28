
import processing.pdf.*;
/*import processing.video.*;
MovieMaker mm;  // Declare MovieMaker object*/
/*import codeanticode.gsvideo.*;//llama libreria GSVideo

GSMovieMaker mm;//declara instancia de la clase GSVideo
int fps = 30;//cuadros por segundo
*/
float time;
 float r1, r2, r3, rX, rY, rr1, rr2, psX, psY;
 color punto, linea, back;

void setup(){
size(500, 500);
// Create MovieMaker object with size, filename, compression codec and quality, framerate
 /* mm = new MovieMaker(this, width, height, "rotatePL.mov", 30, MovieMaker.ANIMATION, MovieMaker.HIGH);
  /*frameRate(fps);
  
  mm = new GSMovieMaker(this, width, height, "rotate.mov", GSMovieMaker.THEORA, GSMovieMaker.BEST, fps);// inicializo el objeto mm y especifico sus campos
  mm.setQueueSize(50, 10);//almacena los cuadros para el encode
  mm.start();//inicia grabación*/
  
smooth();
back= color(0);


punto= color (#E39800);
linea= color (#FFFFFF);
Rsketch();
}

void draw(){
  //background(0);
time= millis()*.00008;
stroke(punto, 8);
strokeWeight(2);
point(width*psX+sin(time*rX)*80, height*psY+cos(time*rY)*110);
pushMatrix();
palito(width*psX+sin(time*rX)*80, height*psY+cos(time*rY)*110, cos(time*1.5)*120, time*.8, 2 );
palito(cos(time*1.5)*120, 0, 70, cos(time), PI*r1);
palito(70, 0, cos(time*r2)*95, sin(time*.5), PI*4);
palito(cos(time*r2)*95, 0, 70,time, HALF_PI);
palito(70, 0, sin(time*.8)*100, sin(time*r3), PI*11);
popMatrix();
//mm.addFrame();
}

void palito(float X, float Y, float lon, float vel, float factorVel){
strokeWeight(1);
  stroke(linea, 8);
translate(X, Y);
rotate(vel*factorVel);
line(0, 0, lon, 0);
stroke(punto, 20);
strokeWeight(2);
point(lon, 0);

/*loadPixels();//obtengo los datos de pixeles del sketch
mm.addFrame(pixels); //añade un cuadro nuevo al video en progreso con la informacion de los pixeles
  
  println("Number of queued frames : " + mm.getQueuedFrames());//monitoreo los cuadros en espera 
  println("Number of dropped frames: " + mm.getDroppedFrames());//monitoreo los cuadros terminados*/
//  if(mousePressed){
//saveFrame("postal-####.tif");
//}
}

void keyPressed() {
  if (key == ' ') {
   // mm.finish();  // Finish the movie if space bar is pressed!*/
    //exit();
    Rsketch();
}
}

void Rsketch(){//reset the sketch
r1=random(-8, 8);
r2=random(-2, 2);
r3=random(1, 1);
rr1=random(-8, 8);
rr2=random(-5, 5);
rX=random(rr1);
rY=random(rr2);
psX= random(.4, .6);
psY= random(.4, .6);
background(back);
}

/*void keyPressed() {
  if (key == ' ') {
    // Finish the movie if space bar is pressed
    mm.finish();
    // Quit running the sketch once the file is written
    exit();
  }
}*/

