
PImage[] images = new PImage[16];
int p=0;
int c;  
int s=20;
float r,g,b;
void mouseClicked() {
 p = (p+1)%16;
}

void keyPressed(){
   if (key == 'z') {
    s+=1;

  } else if (key == 'x') {
     s-=1;

  }
} 
  
void setup() {
    for(p=0; p< 16; p++){
   images[p]=loadImage("min"+nf(p,4)+".jpg");
  }
  p=0;
  size(images[p].width, images[p].height);
   noStroke();
  smooth(); 
}

void draw() {
 background(0);
 // image(images[p],0,0);
 
  for(int i=0; i<images[p].width; i++) {
    for(int j=0; j<images[p].height; j++) {
      c=images[p].get(i*s,j*s);
      float ran=random(50);
      r=red(c)+ran;
      g=green(c);
      b=blue(c)+ran;
      fill(r,g,b);
      ellipse(i*s,j*s,s,s);
    }
  }
}



