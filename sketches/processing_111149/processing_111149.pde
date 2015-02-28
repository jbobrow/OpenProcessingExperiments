

import ddf.minim.*;
import ddf.minim.ugens.*;

//Fibonacci Numbers Musical Remainder Viewer
int num = 200;
String[] scale = {
  "C", "D", "E", "F", "G", "A", "B"
};
String[] melody = new String[num];
int current;
int start = 0;
int next = 1;
int j;

Minim minim;
AudioOutput out;

void setup() {

  //size(500, 500);
  background(0);
  //make sound
  minim = new Minim(this);
  out = minim.getLineOut();

  //set melody with scales
  for (int i = 0; i < num; i++) {
    if (j==7) {
      j = 0;
    }
    melody[i] = scale[j];
    j++;
  }

  //use fibonacci with scale


  //out.playNote(0.0, 2.9, melody[abs(current%7)] );
}

void draw() {
  for (int i = 0; i < num; i++) {
    String a = melody[i];  
    //println(a);
  }

  //get fibonacci numbers
  current = fib();
  print(melody[abs(current%7)]);
  float delay;
  //random note period
  if (random(1) < 0.5) {
    delay = 0.9;
  }
  else
  delay = 1.5;
  //float delay = random(0.5);
  myDelay(delay*1000);

  //play fibonacci sequence play
  out.playNote(0.0, delay, melody[abs(current%7)]+((current%5)+1) );
  //print(melody[abs(current%20)]);
  println(melody[abs(current%7)]+current%7);
  //Play fibonacci sequence?
}

int fib() {
  int result = current;
  start = next;
  next = current;
  current = start + next; 
  return current;
}

void myDelay(float ms) {
  float time = millis();
  while (millis ()-time < ms);
}



