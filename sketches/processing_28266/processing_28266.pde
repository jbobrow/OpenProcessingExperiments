
//to make it so the character naturally switches to the different animations, 
//perhaps a boolean is needed so that if true it does the first matrix and if
//false it does another?



import ddf.minim.*;
 
Minim minim;
AudioSample stomp;
 
PImage jungle;
PImage [] forward;
PImage [] boom;
PImage [] splitt;
int x = 50;
int y = 130;
int frame = 0;
int bam = 0;
int two = 0;
 
void setup() {
  size (650, 366);
  minim = new Minim(this);
  stomp = minim.loadSample("Mortal_Kombat_Theme.mp3", 2048);
  forward = new PImage[9];
  boom = new PImage[4];
  splitt = new PImage[10];
  
    for(int k = 0; k<splitt.length; k++) {
    splitt[k] = loadImage("h0"+ (k+1) +".png");
  }
  
  for(int i = 0; i<forward.length; i++) {
    forward[i] = loadImage("a0"+ (i+1) +".png");
  }
  

  for(int j = 0; j<boom.length; j++) {
    boom[j] = loadImage("k0"+ (j+1) +".png");
  }
  
  jungle = loadImage("livingforest_mk4.jpg");
  stomp.trigger();
}
 
 
void draw() {
  
 if(frame > 8) frame = 0;
  if(frame < 0) frame = 8;
 if(two >= 9) two = 0;
  if(bam > 3) bam = 0;

  
  image(jungle, 0,0);

  pushMatrix();
  translate(x, y);
  image(forward[frame],50,50);
  popMatrix();
}
 
 
void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      x += 5;
      frame++;
    }
    else if(keyCode==LEFT) {
      x-= 5;
      frame--;
    }
    else if(keyCode==UP) {
      
      pushMatrix();
      translate(25, 50);
      image(boom[bam],x,y);
      popMatrix();
      

      
      bam++;
    }
    else if(keyCode==DOWN) {
      
      pushMatrix();
      translate(25, 100);
      image(splitt[two],x,y);
      popMatrix();
      

      
      two++;
    }
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  stomp.close();
  minim.stop();
   
  super.stop();
}

