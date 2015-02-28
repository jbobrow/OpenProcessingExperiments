
/*Clea Stone
 CMSC 117
 Keith O'hara
 For the first octave, place your left fingers on Q W E R and your right fingers on U I O P. 
 Use the numbers above these keys for the sharps. For the second octave, place your left fingers on 
 the keys Z X C V and your right fingers on M , . ?
 Use the keys above these keys for the sharps. 
 Press more than one key at a time to create chords.
 Enjoy!*/
import ddf.minim.*; 
import ddf.minim.signals.*; 

Minim minim; 
AudioOutput out; 
SineWave sine; 
SineWave nullSine; 

int keysPressed = 0; 
float MAXAMP = .5;  
float amp  = MAXAMP; 

//c5-c7 in hertz
float[] tones = {
  16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87,
  32.70,32.70, 34.65, 36.71, 38.89, 41.20, 43.25, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41}; 

//correlating keys on computer keyboard
char keys[] =    {
  'q','2','w','3','e','r','5','u','8','i','9','o','p','z','s','x','d','c','v','g','m','k',',','l','.','/'}; 

//note names
String notes[] = {
  "C","#"," D","#"," E","     F","    #","     G","    #","     A","    #","     B","        C","    C",
  "    #","     D","    #","     E","         F", "        #","         G","        #","         A","        #",
  "         B","            C"}; 

//fill array with boolean values
boolean keyStates[]; 

PFont font; 

void setup() 
{ 
  size(800, 500, P2D);
  smooth();

  keyStates = new boolean[keys.length]; 
  minim = new Minim(this); 

  out = minim.getLineOut(Minim.STEREO); 
  nullSine= new SineWave(0, 0, out.sampleRate()); 
  sine = new SineWave(0, amp, out.sampleRate()); 
  sine.portamento(40); 

  font = loadFont("Serif-48.vlw"); 
  textFont(font);

} 

//determine which keys have been pressed 
void keyPressed() 
{ 
  keysPressed=0; 
  out.clearSignals(); 
  for(int i=0;i<keys.length;i++) 
  { 
    if(key == keys[i]) 
    { 
      keyStates[i] = true; 
    } 
    if(keyStates[i]) 
    { 
      keysPressed++; 
    } 
  } 

  if(keysPressed == 0) 
  {
    amp = MAXAMP;
  } 
  else 
  {
    amp=MAXAMP/keysPressed; 
  }

  addWaves();
} 

//determine which keys have been released 
void keyReleased() 
{ 
  keysPressed = 0; 
  out.clearSignals(); 
  for(int i=0;i<keys.length;i++) 
  { 
    if(key == keys[i]) 
    { 
      keyStates[i] = false; 
    } 
    if(keyStates[i]) 
    { 
      keysPressed++; 
    } 
  } 
  addWaves();

} 

void draw() 
{   
  background(129,27,180);
  stroke(0); 
  frameRate(10);

  //white keys
  strokeWeight(1);
  fill(255);
  for (int i = 100; i < 700; i = i + 40)
  {
    rect(i, 250, 40, 200);
  }

  // black keys 
  fill(0);
  noStroke();
  rect(130, 250, 20, 140);
  rect(170, 250, 20, 140);
  rect(250, 250, 20, 140);
  rect(290, 250, 20, 140);
  rect(330, 250, 20, 140);
  rect(410, 250, 20, 140);
  rect(450, 250, 20, 140);
  rect(530, 250, 20, 140);
  rect(570, 250, 20, 140);
  rect(610, 250, 20, 140);
  rect(690, 250, 10, 140);


  //draw wave 
  stroke(0);
  for(int i = 0; i < out.bufferSize() - 1; i++) 
  { 
    float x1 = map(i, 0, out.bufferSize(), 100, 700); 
    float x2 = map(i+1, 0, out.bufferSize(), 100, 700); 
    line(x1, 150 + out.left.get(i)*50, x2, 150 + out.left.get(i+1)*50); 

  } 

  //draw note letters
  int x= 115;
  int y = 110;
  textSize (18);

  for(int i=0;i<keys.length;i++)
  {
    if (notes[i]=="#")  
    {
      if(keyStates[i])
      { 
        fill(19,154,160);
        text(notes[i], x+(i*20), 380);
      } 
    }

    else if (notes[i]=="    #")
    {
      if(keyStates[i])
      { 
        fill(19,154,160);
        text(notes[i], x+(i*20), 380);
      } 
    }

    else if (notes[i]=="        #")
    {
      if(keyStates[i])
      { 
        fill(19,154,160);
        text(notes[i], x+(i*20), 380);
      } 
    }

    else 
    {
      if(keyStates[i])
      { 
        fill(19,154,160);
        text(notes[i], y+(i*20), 420);
      } 
    }
  }
}


void addWaves() 
{ 
  for(int i=0;i<keys.length;i++) 
  { 
    if(keyStates[i]) 
    { 
      sine = new SineWave(32*tones[i], amp, out.sampleRate()); 
      sine.portamento(40); 
      out.addSignal(sine); 
    } 
  }  
} 


void stop() 
{ 
  out.close(); 
  minim.stop(); 

  super.stop();
}





