
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 20-5: Live Input with Sonia

// Import the Sonia library
import pitaru.sonia_v2_9.*;

float[] values = new float[1000];
int col=0;
boolean rett=true;
int G=0;

void setup() {
  size(1000,800);
  smooth();
  Sonia.start(this);

  // Start listening to the microphone
  // All functions for sound input are static, meaning they are called from the class name itself, LiveInput, rather than an object instance.
  LiveInput.start(); 


  for (int n = 0; n < 1000; n ++ ) {
    values[n] = random(0,10);
  }
  background(0);
  noStroke();
  rectMode(CENTER);
}

void draw() {


  // Get the overall volume (between 0 and 1.0)
  float level = LiveInput.getLevel();


  //colora le palle orizzontali di azzurro e le verticali di...
  if (rett)
    fill(255*(0.2+level),255-(col/4),255,180*(0.2+level));
  else
    fill(255*(0.2+level),255-(col/4),150,180*(0.2+level));


  //se il livello è alto fai pallini bianchi
  if (level>0.5) {
    fill(255);
    for(int i=0;i<level*100;i=i+2) {
      rect((random(width)),random(height)+i,level*300,level*300);
    }
  }

  // Draw ellissi with size based on volume e posizione dipendente dal volume e dal vettore
  for(int i=0;i<level*1000;i=i+20) {
    if (rett) {
      ellipse(i+10,100-random(5)+(values[i]*10*(level+0.5)),level*400,level*400); 
      ellipse(width-i,100-random(5)+(values[i]*10*(level+0.5)),level*400,level*400);
    }
    else {

      ellipse(width/2+100+150*(level*2)-((values[i]*10)*(level+0.5))/2,height-i,level*300,level*300);

      ellipse(width/2+100+150*(level*2)-((values[i]*10)*(level+0.5))/2,i,level*300,level*300);
    }
  }
  //rigenera i valori del vettore
  for (int n = 0; n < 1000; n ++ ) {
    values[n] = random(0,100);
  }
  //velocità palline
  delay(int(50));

  //disegna bottoni
  stroke(0,255,0);
  fill(255);
  ellipse(0,0,50,50);

  if (rett)
    ellipse(width,0,50,50);
  else {
    fill(0);
    stroke(0,0,255);
    ellipse(width,0,50,50);
  }


  noStroke();
}

void mousePressed() {

  if ((mouseX >width-50)&&(mouseY<50))
    rett=!rett;

  if ((mouseX<50)&&(mouseY<50))
    background(random(255));


  col=col+254;
  if (col > 255) 
    col=1;
  G=col/100;
}
// Close the sound engine
public void stop() {
  Sonia.stop();
  super.stop();
}





String gimme_name(String begin)
{
  String name = begin;
  name+=String.valueOf(year());
  name+=".";
  if(month()<10) name+="0";
  name+=String.valueOf(month());
  name+=".";
  if(day()<10) name+="0";
  name+=String.valueOf(day());
  name+="_";
  if(hour()<10) name+="0";
  name+=String.valueOf(hour());
  name+=".";
  if(minute()<10) name+="0";
  name+=String.valueOf(minute());
  name+=".";
  if(second()<10) name+="0";
  name+=String.valueOf(second());
  name+=".png";
  return name;
}
//salva un'immagine premendo la barra
void keyPressed() {
  if (key == ' ') {
    saveFrame(gimme_name("myProject_"));
  }
}


