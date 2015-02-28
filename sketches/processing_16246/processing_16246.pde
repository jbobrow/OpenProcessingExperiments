
/**
 * shows how to set a specific easing (character of movment)
 * list of all easing styles below:
 *
 * Ani.LINEAR
 * Ani.QUAD_IN
 * Ani.QUAD_OUT
 * Ani.QUAD_IN_OUT
 * Ani.CUBIC_IN
 * Ani.CUBIC_IN_OUT
 * Ani.CUBIC_OUT
 * Ani.QUART_IN
 * Ani.QUART_OUT
 * Ani.QUART_IN_OUT
 * Ani.QUINT_IN
 * Ani.QUINT_OUT
 * Ani.QUINT_IN_OUT
 * Ani.SINE_IN
 * Ani.SINE_OUT
 * Ani.SINE_IN_OUT
 * Ani.CIRC_IN
 * Ani.CIRC_OUT
 * Ani.CIRC_IN_OUT
 * Ani.EXPO_IN
 * Ani.EXPO_OUT
 * Ani.EXPO_IN_OUT
 * Ani.BACK_IN
 * Ani.BACK_OUT
 * Ani.BACK_IN_OUT
 * Ani.BOUNCE_IN
 * Ani.BOUNCE_OUT
 * Ani.BOUNCE_IN_OUT
 * Ani.ELASTIC_IN
 * Ani.ELASTIC_OUT
 * Ani.ELASTIC_IN_OUT
 * 
 * MOUSE
 * click           : set end position of the animations and trigger new one
 */

import de.looksgood.ani.*;

ArrayList entities = new ArrayList(0);
String solvers[] = {
  Ani.LINEAR,Ani.QUAD_IN,Ani.QUAD_OUT,Ani.QUAD_IN_OUT,Ani.CUBIC_IN,Ani.CUBIC_IN_OUT,Ani.CUBIC_OUT,Ani.QUART_IN,Ani.QUART_OUT,Ani.QUART_IN_OUT,Ani.QUINT_IN,Ani.QUINT_OUT,Ani.QUINT_IN_OUT,Ani.SINE_IN,Ani.SINE_OUT,Ani.SINE_IN_OUT,Ani.CIRC_IN,Ani.CIRC_OUT,Ani.CIRC_IN_OUT,Ani.EXPO_IN,Ani.EXPO_OUT,Ani.EXPO_IN_OUT,Ani.BACK_IN,Ani.BACK_OUT,Ani.BACK_IN_OUT,Ani.BOUNCE_IN,Ani.BOUNCE_OUT,Ani.BOUNCE_IN_OUT,Ani.ELASTIC_IN,Ani.ELASTIC_OUT,Ani.ELASTIC_IN_OUT
};

void setup() {
  size(480,300,P2D);
  smooth();
  noStroke();


for(int i =0;i<10;i++)
  entities.add(new Entit());


  strokeWeight(2);

  // you have to call always Ani.init() first!
  Ani.init(this);
  background(0);


  textFont(createFont("Vernada",9));
  textMode(SCREEN);
}

void draw() {


  if(frameCount%2==0) {
    tint(12,128,255,5);


    image(g,noise(frameCount%5)*10-1.5,noise(frameCount%4)*4-.5);
  }
  else {

    tint(255,128,12,13);
    image(g,-noise(frameCount%6)*10+1.5,noise(frameCount%4)*4-.5);
  }

  for(int i = 0;i<entities.size();i++) {
    Entit tmp = (Entit)entities.get(i);
    tmp.update();
  }
  


/*
  pushStyle();
  strokeWeight(1);
  for(int i =0;i<10000;i++) {
    stroke(random(25),random(3,10));
    point(random(width),random(height));
  }
  popStyle();
*/
  pushStyle();
  strokeWeight(noise(frameCount%5)*10+3);
  noFill();
  stroke(0);


  rect(3,3,width-6,height-6);

  popStyle();

  pushStyle();
  fill(255);
  textAlign(RIGHT);
  text(millis(),width-9,height);
  popStyle();

}



void mouseReleased() {
  entities.add(new Entit());
}


