
 PImage liz;
  PImage mac;
  PImage back;

float[] x = {
  -20, 20
 
};
void setup() { 
  size(1000, 1000); 
  smooth(); 
  noStroke();
  liz = loadImage("lizhead.png");
  mac = loadImage("machead.png");
  back = loadImage("psychedelic-19 (1).jpg");

}
void draw() { 
  image(back,0,0);
  background(0); 
  x[0] += 2; 
  x[1] += 2; 
  
  image(liz, x[0], 30);
  image(mac, x[1], 90);
  
}


