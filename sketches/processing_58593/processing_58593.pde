
/**
Swarm simulation
Attempts to emulate locusts in close proximity eating and procreating like mad.

document lives online
https://docs.google.com/document/pub?id=1aC61yIWF1vWemJf68IAGtskiG5ikt7H3EehF8859nGo

Philippe Moore 2012 (c)
**/

SimControl c;

void setup() {
  size(600, 600);
  //background(0);
  c = new SimControl();
}

void draw() {
  c.runSim();
}

