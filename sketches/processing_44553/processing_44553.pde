
PFont font;
PImage filler;
 
void setup(){
   
  filler = loadImage("bee.png");
size (600, 600);
noStroke();
font = loadFont ("Helvetica-CondensedOblique-35.vlw");
frameRate (60);
 
}
 
String tiny = ("sleep is a natural periodic state of rest for the mind and body, in which the eyes usually close and consciousness iscompletely or partially lost, so that there is a decrease in bodily movement and responsiveness to external stimuli. During sleep the brain in humans and other mammals undergoes a characteristic cycle of brain-wave activity that includes intervals of dreaming ");
 
int counter =0;
float regression=1.5;
int chooser =0;

void draw(){
background (0);
  fill(255);
  writer(chooser, 40, regression);
  if (regression >=0){
  regression=regression*0.999;
}
   
if (frameCount%7==0 && chooser <200){
chooser++;
}
 
image(filler, 0,0);
}
 
 
 
void writer(int letterchooser, float fontsize, float receder)
{
  
textAlign(CENTER);
textFont (font, fontsize);
pushMatrix();
    translate(300, 300);
    
    //rotate(radians(frameCount/3));
     
scale(receder);
     
for (int i=0; i<letterchooser; i++){
     
char letter = tiny.charAt(i);
float offsetx;
float offsety;
float offsetangle = TWO_PI/(5+map(i, 0, 378, 0, 25));
 
 offsetx= map(i, 0, 378, 50, 1600)*sin(offsetangle*i*0.5);
 offsety= map(i, 0, 378, 50, 1600)*cos(offsetangle*i*0.5);
text(letter, offsetx, offsety);
 
  offsetx = offsetx*2;
  offsety=offsety*2;
   
  }
   
  popMatrix();
}


