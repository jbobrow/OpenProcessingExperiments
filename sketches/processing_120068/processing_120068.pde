
int rectWidth;
PImage i;
   
void setup() {
  size(630, 500);
  noStroke();
  background(140);
  rectWidth = width/4;
  i = loadImage("motif8.png");
  imageMode(CENTER);
}

void draw() { 
  
}
void mouseReleased() {
  saveFrame(gimme_name("myProject_"));
};

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

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    background(0);
  } else { 
  
image(i, random(600), random(800));
tint(random(285),153,(204),random(226)); 
scale(random(0.20-1), random(1-2));
image(i, 50, 0);
    
  }
}


