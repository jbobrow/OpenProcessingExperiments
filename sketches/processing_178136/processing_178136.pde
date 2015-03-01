
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave1;
Oscil       wave2;
Summer      sum;
int         pitch;
float       vol;      //volume 
boolean     colorScale; 
void setup() {
  size(800,600);
  background(0);
  
  PImage myImage = loadImage("image1.JPG");
  //image(myImage,0,0,800,600);
  
  colorMode(HSB,100);
  
  fillRandomly();
  loadPixels();    //save screen initial
  vol=0.8;
  colorScale=true;
  //colorScale=false;
 
  
  minim = new Minim(this);
  out = minim.getLineOut();
  

  wave1 = new Oscil( 220, 0.0f, Waves.TRIANGLE );
  wave2 = new Oscil( 220, 0.0f, Waves.TRIANGLE );
  sum = new Summer();
  // patch the Oscil to the summer
  wave1.patch( sum );
  wave2.patch( sum );
  sum.patch(out);
  
}

void draw() {
  
  showColorScale(colorScale);
  drawVolume (vol,width-30, height*0.75,width/20);
  color c = get(mouseX,mouseY);
  float hue = hue(c);
  float sat = saturation(c);
  float bri = brightness(c);
  //println ( hue," ",sat," ", bri," ", pitch);
  
  pitch   = int(round((map(hue,0,100,0,13))));  //C3 --> C4
  float amp1 = map(bri,0,100,0.2f,1f);          //brightness
  float amp2 = amp1 * map(sat,0,100,0.2f,0f);     //saturation  
  wave1.setFrequency (Frequency.ofPitch(score(pitch)));
  wave2.setFrequency (wave1.frequency.getLastValue() *2.5 );

  wave1.setAmplitude( vol*amp1 );
  wave2.setAmplitude( vol*amp2 );
  
  out.setPan(map(mouseX,0,width,-0.8,0.8));

}

void keyPressed() {                 //change image to test
  if (key>'0' && key<='8') {
    String imageShown="image"+key+".JPG";
    PImage myImage = loadImage(imageShown);
    updatePixels();
    image(myImage,0,0,800,600);
    loadPixels();
  }
  if (key=='9') {                     //clean screen --> black
    updatePixels();
    background(0);
    loadPixels();
  }
  if ((key=='r') | (key=='R')) {      //fill random with ellipses
    fillRandomly();
  }  
  if ((key=='c') | (key=='C')) {      //show or unshow colorscale
    colorScale=!colorScale;
  }
 
   if ((key=='q')|(key=='Q')) {      // quit
     exit();
   }
   if (key==' ') {                   // mute and unmute
    if (out.isMuted()) {out.unmute();}
    else {out.mute();
         }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      vol +=0.1;
      if (vol>=1) {
        vol=1;
      }
    }  
     if (keyCode == DOWN) {
       vol -=0.1;
       if (vol<=0) {
          vol=0.002;
       
      } 
    } 
  }
}

void fillRandomly() {            //pressed R
  updatePixels();
  int step=int(random(width/13, width/5));
  for (int i=0; i<width;i=i+step) {
    for (int j=0;j<height;j=j+step) {
      //fill(random(100),random(100),random(100));
      noFill();
      stroke(random(100),random(100),random(100));
      strokeWeight(random(width/30,width/20));
      rotate(random(0,QUARTER_PI));
        if (int(random(0,2))==0) {
          rect(i,j,random(width/10,width/5),random(width/10,width/5),random(width/30));
        } else {
        ellipse(i,j,random(width/13,width/5),random(width/13,width/5));
        }
    }
    loadPixels();
  }
  
}

void showColorScale (boolean show) {
 updatePixels();
 
  if (show) {
    for (int i=0 ; i<14; i++){ 
      for (int j=0; j<6; j++){
        for (int z=1; z<10; z++){
          noStroke();
          fill(i*100/13,j*100/5,z*100/10);
          rect(i*width/13+(z-1)*width/13/8,height-(j*20),width/13/7,20);
        }
      }
    }
  }

}

String score (int pitch1){         // get score from integer
  String str="";
  switch (pitch1) {
    case 0 :
      str = "C3"; 
      break;
    case 1 :
      str = "C#3"; 
      break;
    case 2 :
      str = "D3";
      break;
    case 3 :
      str = "D#3";
      break;
    case 4 :
      str = "E3";
      break;
    case 5: 
      str = "F3";
      break;
    case 6: 
      str = "F#3";
      break;
    case 7: 
      str = "G3";
      break;
    case 8: 
      str = "G#3";
      break;
    case 9: 
      str = "A3";
      break;
    case 10: 
      str = "A#3";
      break;
    case 11: 
      str = "B3";
      break;
    case 12: 
      str = "C4";
      break;
    }
    return str;
}

void drawVolume (float vol,float x, float y,float radius) {
  //updatePixels();
  fill(50,70,70);
  noStroke();
  ellipse (x,y,radius*4/3,radius*4/3);
  strokeCap(ROUND);
  noFill();
  stroke(vol*100);
  strokeWeight(radius/4);
  arc(x,y,radius,radius,0,vol*TWO_PI);
  if ((vol==0) | (out.isMuted())) {
    //draw cross
    strokeCap(ROUND);
    float arm = radius*2/3*sin(QUARTER_PI);
    line(x-arm,y-arm,x+arm,y+arm);
    line(x-arm,y+arm,x+arm,y-arm);
  }
}

