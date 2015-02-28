
import netscape.javascript.*;

int num = 100;

float y = 0 ;
Onda[] wave = new Onda[num];

float angle = 0;

void setup () {
  size (500,500);
  noStroke();
  smooth();
  background(0);



  for (int i=0; i < wave.length; i++) {
    int black = floor(random(10,200));
    float y0 = random(height*0.1,height*0.9);
    float w = random(400,600);
    float amp = random(10,80);
    float desf = random(0,20);
    float r = 800/(2*black);
    float speed = random(0.2, 1);
    float x=0;
    wave[i] = new Onda(black,y0,w, amp, desf, r, speed,x);
  }
}

void draw() {
  noStroke();
    fill(0,7);
    rect(0,0,width,height);

  for (int i=0; i < wave.length; i++) {
    wave[i].update();
    wave[i].display();
  }
}



