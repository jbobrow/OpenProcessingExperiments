
import ddf.minim.*;

Minim minim;
AudioPlayer player;

float inter_size = 1;
float increment = .05;

float opacity = 50;
float bright = 0;

// for sphere
float a = 0;
float b = 0;

// for circle
float n = 0;
float o = 0;
float p = 0;
float q = 0;
float r = 0;
float s = 0;
float t = 0;
float u = 0;

float spin_up_down = -60;
float spin_left_right = 140;

float smaller_size = 25;
float larger_size = 225;

float value = 0;
float saturation_sphere = 360;

float forward_backward = 150;

void setup() {
  size(800,600,P3D);
  background(0);
  
  colorMode(HSB,360);
  
  minim = new Minim(this);
  player = minim.loadFile("The_Salesman_The_Husband_The_Lover.mp3",1024);
  
  player.play();
  
  frameRate(30);
  
  smooth();
  
}

void draw() {
  
  background(0);
  waveformRender();
   
}

void waveformRender() {
  
  lights();
  
  pushMatrix();
  
  translate(width/2,height/2,forward_backward);
  rotateY(radians(spin_left_right));
  rotateX(radians(spin_up_down));
  
  stroke(value,saturation_sphere, bright);
  fill(value, saturation_sphere, bright);
  sphere(smaller_size);
  
  for(int i = 0; i < 720; i++) {
    
    stroke((abs(player.mix.get(i))*1000)%360, (150 + abs(player.mix.get(i))*500)%360, 200 + abs(player.mix.get(i)*200));
    
    line(s + u,r + t,o + q,r + p);
    
    n = sin(i+increment)*smaller_size;
    o = cos(i+increment)*smaller_size;
    p = sin(i+increment)*abs(player.left.get(i))*larger_size;
    q = cos(i+increment)*abs(player.right.get(i))*larger_size;
    r = sin(i)*smaller_size;
    s = cos(i)*smaller_size;
    t = sin(i)*abs(player.left.get(i))*larger_size;
    u = cos(i)*abs(player.right.get(i))*larger_size;
    
  }
  
  popMatrix();
  
}

void keyPressed() {
  
  //SIZE
  if (key == 'l' || key == 'L') {
    smaller_size+=1;
    larger_size+=1;
  }
  if (key == 's' || key == 'S') {
    smaller_size-=1;
    larger_size-=1;
  }
  if (key == 't' || key == 'T') {
    forward_backward+=5;
  }
  if (key == 'f' || key == 'F') {
    forward_backward-=5;
  }
  
  //COLORSPHERE
  if (key == 'r' || key == 'R') {
    value = 0;
  }
  if (key == 'o' || key == 'O') {
    value = 25;
  }
  if (key == 'y' || key == 'Y') {
    value = 60;
  }
  if (key == 'g' || key == 'G') {
    value = 120;
  }
  if (key == 'p' || key == 'P') {
    value = 290;
  }
  if (key == 'b' || key == 'B') {
    value = 240;
  }

  //Brightness
  if (key == '0') {
    bright = 0;
  }
  if (key == '1') {
    bright = 360;
  } 
  
  //Saturation
  if(key == 'w' || key == 'W') {
    saturation_sphere = 0;
  }
  if(key == 'q' || key == 'Q') {
    saturation_sphere = 360;
  }
  
  //SPIN
  if (key == CODED) {
    if (keyCode == UP) {
      spin_up_down+=3;
    }
    if (keyCode == DOWN) {
      spin_up_down-=3;
    }
    if (keyCode == RIGHT) {
      spin_left_right+=3;
    }
    if (keyCode == LEFT) {
      spin_left_right-=3;
    }
  }
}

void stop() {
  
  player.close();
  minim.stop();
  super.stop();
  
}

