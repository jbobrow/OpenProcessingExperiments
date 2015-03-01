
import processing.video.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.signals.*;
Capture cam;
Minim minim;
AudioSample kick;
AudioOutput out;
SineWave square;
SineWave sine;
SineWave a;

// Tracking vidéo
import processing.video.*;
Capture video;
float txe = 0;
float tye = 0;
float alpha = 0.4;
int taille1 = 70 ;
int taille2 = 80 ;
int rouge = 10;

zone_son[] lazone=new zone_son[20];

float seuil=10;
boolean p=false;

void setup() { 
 size(1280, 840); 
 cam = new Capture(this);
 cam.start(); 
 minim = new Minim(this);
out = minim.getLineOut(Minim.STEREO);

// Mes samples
kick = minim.loadSample("kick.mp3");

// Mes ondes sinusoidales (fréquence, amplitude,sortie);
 square = new SineWave(262, 0.1, out.sampleRate());
 sine = new SineWave(524, 0.04, out.sampleRate());
 a = new SineWave(131, 0.1, out.sampleRate());
 
  
// add the oscillator to the line out
out.addSignal(square);
out.addSignal(sine);
out.addSignal(a);

// les zones et notes associées

// haut gauche
 lazone[1]=new zone_son(80, 0, 80, 80, "C3");
 lazone[2]=new zone_son(80, 0, 80, 80, "E3");
 lazone[7]=new zone_son(80, 0, 80, 80, "G3");

// haut droite
 lazone[4]=new zone_son(1200, 0, 80, 80, "C3");
 lazone[6]=new zone_son(1200, 0, 80, 80, "E3");
 lazone[8]=new zone_son(1200, 0, 80, 80, "A3");

// Milieu droite
 lazone[0]=new zone_son(1200, 200, 80, 80, "c3");
 lazone[3]=new zone_son(1200, 200, 80, 80, "E3");
 lazone[5]=new zone_son(1200, 200, 80, 80, "C4");

// Bas Gauche
 lazone[9]=new zone_son(80, 400, 80, 80, "C3");
 lazone[10]=new zone_son(80, 400, 80, 80, "E3");
 lazone[11]=new zone_son(80, 400, 80, 80, "G4");
 lazone[12]=new zone_son(80, 400, 80, 80, "C5");
 
// Bas droite
 lazone[13]=new zone_son(1200, 400, 80, 80, "C3");
 lazone[14]=new zone_son(1200, 400, 80, 80, "E3");
 lazone[15]=new zone_son(1200, 400, 80, 80, "A4");
 lazone[16]=new zone_son(1200, 400, 80, 80, "C5");
 
 // Transition droite
 lazone[17]=new zone_son(1200, 600, 80, 80, "C3");
 lazone[18]=new zone_son(1200, 600, 80, 80, "E3");
 lazone[19]=new zone_son(1200, 600, 80, 80, "E5");
 

 


} 

void draw() { 
 stroke(255);
 // draw the waveforms
 for(int i = 0; i < out.bufferSize() - 1; i++)
 {
   float x1 = map(i, 0, out.bufferSize(), 0, width);
   float x2 = map(i+1, 0, out.bufferSize(), 0, width);
   line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
   line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
 }
 if (cam.available()) { 
   // Reads the new frame
   cam.read();

   scale(-1,1); 
   translate(-1280, 0);
   image(cam, 0, 0);
   for (int i=0; i< lazone.length;i++) {
     lazone[i].teste();
     lazone[i].dessine();
     lazone[i].joue();
   }
 }
 fill(255);
 text("Seuil : "+seuil,10,20);
} 

// modifier le seuil avec les touches haut et bas
void keyPressed(){
 if(key==CODED){
   if(keyCode==UP){
     seuil+=0.1;
   }
   if(keyCode==DOWN){
     seuil-=0.1;
   }
   seuil=constrain(seuil,0,20);
 }
if (key == 'c') kick.trigger();
loop();

}



class zone_son {
 int px, py, lx, ly;
 String note;
 boolean survol, joue;

 zone_son(int px, int py, int lx, int ly, String note) {
   this.px=px;
   this.py=py;
   this.lx=lx;
   this.ly=ly;
   this.note=note;
   survol=false;
   joue=false;
 }

 void dessine() {
   stroke(255, 0, 0);
   if (survol==true){
     fill(255, 0, 0);
   } 
   else {
     noFill();
   }
   rect(px,py,lx,ly);
 }
 
 void joue(){
   if (survol==true && joue==false){
   out.playNote( note );
   joue=true;
   } else if (survol==false && joue==true){
     joue=false;
   }
 }

 void teste() {
   int presenceSum = 0;
   for (int x=px; x < px+lx; x++) {
     for (int y=py;y < py+ly;y++) {
       color currColor = cam.pixels[(y*width)+x];
       // Extract the red, green, and blue components of the current pixel’s color
       int cR = (currColor >> 16) & 0xFF;
       int cG = (currColor >> 8) & 0xFF;
       int cB = currColor & 0xFF;
       presenceSum += cR + cG + cB;
     }
   }
   if (presenceSum/100000.0 > seuil) {
     survol=true;
   } 
   else {
     survol=false;
   }
 }
}

void mouseMoved()
{

 float freq = map(mouseY, 0, height, 1500, 60);
 square.setFreq(freq);
 sine.setFreq(freq);



}



void stop()
{
out.close();
minim.stop();
super.stop();
kick.close();
}



