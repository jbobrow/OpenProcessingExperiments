
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;


int total = 0;
int rotation = 0;
int spin = 0;

AudioPlayer[] play = new AudioPlayer[total];
int[] placedrot = new int[total];
float[] placedspin = new float[total];
float[] placedx = new float [total];
float[] placedy = new float [total];

float[] speed = new float[total];

void setup()
{
  size(700, 400);
  background (255);
  stroke(17,0,255);
  strokeWeight(2);
  
  
  m = new Minim(this);
  
  
  
}

void draw_swirly(float myX, float myY) {
  rotation = 0;
  pushMatrix();
  translate(myX, myY);
  rotate(radians(spin));
  spin = spin +1;

  int i = 0;
  while(rotation<360) {
    rotate (radians(rotation));
    line (i,i,30,30);
    rotation = rotation+10;
    line (i,i,30,30);

    rotation = rotation+20;
    line (i,i,30,30);
    rotation = rotation+15;
  }
  popMatrix();
}

void draw()
{
  background(255);
  draw_swirly(mouseX, mouseY);

  int count = 0;
  while(count<total) {
    pushMatrix();
    translate(placedx[count], placedy[count]);
    rotate(radians(placedspin[count]));
    placedspin[count] = placedspin[count] + 1 + speed[count];
   // play[count] = play[count] + 1 + speed[count];
    float s = ( dist(0,0,width,height)-(dist(placedx[count], placedy[count],mouseX,mouseY)))/350.0;
    speed[count] = s*s;
    
    placedrot[count] = 0;
    int i = 0;
    while(placedrot[count]<360) {
      rotate (radians(placedrot[count]));
      line (i,i,30,30);
      placedrot[count] = placedrot[count]+10;
      line (i,i,30,30);
  
      placedrot[count] = placedrot[count]+20;
      line (i,i,30,30);
      placedrot[count] = placedrot[count]+15;
    }
    //float p = ( dist(0,0,width,height)-(dist(play[count],mouseX,mouseY))/350.0;
    //speed[count] = p*p;
    
    popMatrix();
    count = count+1;
  }
  
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    total = total + 1;
    placedrot = expand(placedrot, total);
    placedspin = expand(placedspin, total);
    placedx = expand(placedx, total);
    placedy = expand(placedy, total);
    speed = expand(speed, total);
    play = (AudioPlayer[])expand(play, total);
    
    placedrot[total-1] = rotation;
    placedspin[total-1] = spin;
    placedx [total-1] = mouseX;
    placedy [total-1] = mouseY;
    speed[total-1] = 0;
    play[total -1] = m.loadFile("119887__cmusounddesign__bc-fan-scraping.wav");
 play[total-1].loop();
}
  


}


