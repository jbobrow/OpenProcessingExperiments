
PFont f;
PImage filler;

void setup(){
  
  filler = loadImage("filler.png");
size (600, 600);

noStroke();
f = loadFont ("Courier-20.vlw");
frameRate (60);

}

String tiny = ("What we see before us is just one tiny part of the world. We get into the habit of thinking, this is the world, but thats not all to it. The real world is a much deeper and darker place than this, and most of it is occupied by jellyfish and things. We just happen to forget all that. Two thirds of all the earth's surface is ocean, and all we can see of it with the naked eye is the surface: the skin. We hardly know anything about whats underneath the skin.  ");

int counter =0;
float regression=1.5;
int chooser =0;
void draw(){
  
background (16, 34, 72);

  fill(255);
  writer(chooser, 80, regression);
  
  
  if (regression >=0){
  regression=regression*0.999;
}
  
if (frameCount%7==0 && chooser <378){
chooser++;
}

image(filler, 0,0);
}



void writer(int letterchooser, float fontsize, float receder)
{
 
textAlign(CENTER);
textFont (f, fontsize);
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

