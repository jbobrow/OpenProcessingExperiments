
import processing.video.*;
//import org.openkinect.*;
//import org.openkinect.processing.*;

//to be watched with Animal Rights - DeadMau5
//I claim no rights to this song.

//like int x
Capture video;
//Kinect kinect;
//use 4:3 ratios: 320x240, 640x480, 
int camw = 40;
int camh = 30;
int fps = 15;
int newx = 0; //my x
int newy = 0; //my y
int xjump = 18;
int yjump = 18;
int time = 1000;
int count = 0;

boolean begin = true;
boolean after10 =false;
boolean after15 =false;
boolean after20 =false;
boolean after22 =false;
boolean after24 =false;
boolean after26 =false;
boolean after28 =false;
boolean after30 =false;
boolean after31 =false;
boolean after32 =false;
boolean after33 =false;
boolean after34 =false;
boolean after35 =false;
boolean after40 =false;
boolean after42 =false;
boolean after44 =false;
boolean after46 =false;
boolean after48 =false;
boolean after50 =false;
boolean after51 =false;
boolean after52 =false;
boolean after53 =false;
boolean after54 =false;
boolean after55 =false;
boolean after56 =false;
boolean after57 =false;
boolean after58 =false;
boolean after59 =false;
boolean after60 =false;


void setup() {
  
 
  
  
  //kinect = new Kinect(this)l
 // kinect.start();
  
  background(0);
  
  //automating size calculation, so that saying one pixel takes up 9 pixels
  size(720, 540);
  //initialize capture
  video = new Capture(this,camw,camh,fps);
    //(,width,height,framerate in seconds)
    //the this refers to me or I, like the applet itself
    //capture connects to the computer's camera it needs to know who to contact
    //this program versus another
  
}

void draw() {
 
 // image(video,0,0); //video starting at top left hand corner
  
  //jim cambell style: low rez arrays
  //let Processing know we're about to access and play with pixel [] arrayf
  video.loadPixels();
  
  
  
  for(int y = 0; y < video.height; y++) {
     for(int x = video.width-1; x > 0; x--) {
        int location = x + y * video.width;
        color c = video.pixels[location]; 
    
    drawPoints(c);
    
     newx+=xjump;
     //same as newx = newx + xjump;
     }
   newx = 0;
   newy+=yjump;
 
  }
  
  newy = 0;
  
  video.updatePixels();
  
}

void drawPoints(color c){
  //println(count);
  
   strokeWeight(17);
   float r = red(c);
   float g = green(c);
   float b = blue(c);
 //this is how you do grey scale!!

 //10 seconds 10*fps 0-10
 if(count <= 150) {
  begin = true;
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }
 
 //5 seconds 15*fps 10-15 
else if(count <= 225) {
   println("count="+ count + "countmod10&*fps=" + count%10*fps);
  begin = false;
  after10 = true;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

 //5 seconds 20*fps 15-20 
else if(count <= 300) {
  println("gothere2");
  after10 = false;
  after15 = true;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 22*fps 20-22  
else  if(count <= 330) {
  println("gothere3");
  after10 = false;
  after15 = false;
  after20 = true;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }
 
//2 seconds 24*fps 22-24
else  if(count >= 360) {
   println("gothere4");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = true;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 26*fps 24-26 
 else if(count <= 390) {
   println("gothere5");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = true;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 28*fps 26-28  
else  if(count <= 420) {
  println("gothere6");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = true;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 30*fps 28-30 
else  if(count <= 450) {
  println("gothere7");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = true;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 31*fps 30-31  
else  if(count <= 465) {
  println("gothere8");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = true;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 32*fps 31-32 
else  if(count <= 480) {
  println("gothere9");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = true;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 33*fps 32-33  
else  if(count <= 495) {
  println("gothere10");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = true;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 34*fps 33-34  
else  if(count <= 510) {
  println("gothere11");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = true;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 35*fps 34-35  
else  if(count <= 525) {
  println("gothere12");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = true;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//5 seconds 40*fps 35-40 
else  if(count <= 600) {
  println("gothere13");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = true;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 42*fps 40-42  
else  if(count <= 630) {
  println("gothere14");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = true;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 44*fps 42-44 
else  if(count <= 660) {
  println("gothere15");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = true;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 46*fps 44-46 
else  if(count <= 690) {
  println("gothere16");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = true;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 48*fps 46-48 
else  if(count <= 720) {
  println("gothere17");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = true;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//2 seconds 50*fps 48-50  
else  if(count <= 750) {
  println("gothere18");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = true;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 51*fps 50-51 
else  if(count <= 765) {
  println("gothere19");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = true;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 52*fps 51-52  
else  if(count <= 780) {
  println("gothere20");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = true;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 53*fps 52-53  
else  if(count <= 795) {
  println("gothere21");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = true;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }
 
//1 second 54*fps 53-54 
else  if(count <= 810) {
  println("gothere22");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = true;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 55*fps 54-55  
else  if(count <= 825) {
  println("gothere23");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = true;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 56*fps 55-56 
else  if(count <= 840) {
  println("gothere24");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = true;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 57*fps 56-57 
else  if(count <= 855) {
  println("gothere25");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = true;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = false;
 }

//1 second 58*fps 57-58  
else  if(count <= 870) {
  println("gothere26");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = true;
  after58 = false;
  after59 = false;
  after60 = false;
 }
//1 second 59*fps 58-59  
else  if(count <= 885) {
  println("gothere27");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = true;
  after59 = false;
  after60 = false;
 }
 //1 second 60*fps 59-60
else  if(count <= 900) {
  println("gothere28");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = true;
  after60 = false;  
 }
 
/*else  if(count%(60*fps) == 0) {
  println("gothere29");
  after10 = false;
  after15 = false;
  after20 = false;
  after22 = false;
  after24 = false;
  after26 = false;
  after28 = false;
  after30 = false;
  after31 = false;
  after32 = false;
  after33 = false;
  after34 = false;
  after35 = false;
  after40 = false;
  after42 = false;
  after44 = false;
  after46 = false;
  after48 = false;
  after50 = false;
  after51 = false;
  after52 = false;
  after53 = false;
  after54 = false;
  after55 = false;
  after56 = false;
  after57 = false;
  after58 = false;
  after59 = false;
  after60 = true; 
 }
 
*/
 
 if (count > 60*fps){
   count = 0;
 
 }

if(begin == true) {
  stroke(c);
  point(newx,newy);
}

 if(after10==true){
        stroke(c-13); //from location
     //stroke(255);
     point(newx,newy);
 }
 
else if(after15==true){
        stroke(r); //from location
    // stroke(0);
     point(newx,newy);
 }
 
else if(after20==true){
   stroke(c-100); //from location
     point(newx,newy);
 }
 
else if(after22==true){
       stroke(r); //from location
     point(newx,newy);
 }
 
else if(after24==true){
   stroke(g); //from location
     point(newx,newy);
 }
 
else if(after26==true){
   stroke(b); //from location
     point(newx,newy);
 }
 
else if(after28==true){
   stroke(g); //from location
     point(newx,newy);
 }
 
else if(after30==true){
    stroke(r); //from location
     point(newx,newy);
 }
 
else if(after31==true){
   stroke(r,0,0); //from location
     point(newx,newy);
 }
 
else if(after32==true){
     stroke(0,g,0); //from location
     point(newx,newy);
 }
 
else if(after33==true){
   stroke(0,0,b); //from location
     point(newx,newy);
 }
 
else if(after34==true){
    stroke(c-85); //from location
     point(newx,newy);
 }
 
else if(after35==true){
     stroke(c-5); //from location
     point(newx,newy);
 }
 
else if(after40==true){
   stroke(c+200); //from location
     point(newx,newy);
 }
 
else if(after42==true){
   stroke(c);
   point(newx,newy);
 }
 
else if(after44==true){
   stroke(0,g-155,0);
   point(newx,newy);
 }
 
else if(after46==true){
   stroke(0,g-55,0);
   point(newx,newy);
 }
 
else if(after48==true){
   stroke(0,g,0);
   point(newx,newy);
 }
 
else if(after50==true){
   stroke(0,0,b-200);
   point(newx,newy);
 }
 
else if(after51==true){
   stroke(0,0,b-150);
   point(newx,newy);
 }
 
else if(after52==true){
   stroke(0,0,b-100);
   point(newx,newy);
 }
 
else if(after53==true){
   stroke(0,0,b-50);
 }
 
else if(after54==true){
   stroke(0,0,b);
   point(newx,newy);
 }
 
else if(after55==true){
   stroke(b);
   point(newx,newy);
 }
 
else if(after56==true){
   stroke(r);
   point(newx,newy);
 }
 
else if(after57==true){
   stroke(c+69);
   point(newx,newy);
 }
 
else if(after58==true){
   stroke(b);
   point(newx,newy);
 }
 
else if(after59==true){
     stroke(c);
   point(newx,newy);
   saveFrame("smile-####.tif");
 }
 
else  if(after60==true){
 }
 
 count++;
 
/* 
 //first 15 seconds [0-15]
 if(millis() <= time*15){

 }
 
  // second 15 seconds [15-30]
 if(millis() >= time*15 && millis() <= time*30){
    
 }
 
 // next 5 seconds [30-35]
 if(millis() >= time*30 && millis() <= time*35){
     
   
 }
 
  // next 2 seconds [35-37]
 if(millis() >= time*35 && millis() <= time*37){
 
 }
 
 // next 2 second [37-39]
 if(millis() >= time*37 && millis() <= time*39){
     
 }
 
 // next 2 second [39-41]
 if(millis() >= time*39 && millis() <= time*41){
     
 }
 
 
 // next 2 second [41-43]
 if(millis() >= time*41 && millis() <= time*43){
     
  
 }
 
 // next 2 second [43-45]
 if(millis() >= time*43 && millis() <= time*45){
    
 }
 
 // next second [45-46]
 if(millis() >= time*45 && millis() <= time*46){
     
 }
 
 // next second [46-47]
 if(millis() >= time*46 && millis() <= time*47){
   
 }
 
  // next second [47-48]
 if(millis() >= time*47 && millis() <= time*48){
     
 }
 
  // next 5 seconds [47-52]
 if(millis() >= time*47 && millis() <= time*52){
    
 }
 
  // next 4 seconds [52-56]
 if(millis() >= time*52 && millis() <= time*56){
   
 }
 
  // next 5 seconds [56-60]
 if(millis() >= time*56 && millis() <= time*60){
     
 }
 
  //next second
 if(millis() >= time*60 && millis() <= time*61){

   
 }
 
 */

}


//whenever the camera is ready to send you a new frame, read the frame
void captureEvent(Capture v) {
  v.read();
}



