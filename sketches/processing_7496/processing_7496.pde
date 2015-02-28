
/*  Sierpinski triangle L-System
 *
 *  This code was based on Patrick Dwyer's L-System class:
 *  http://processing.org/learning/topics/pentigree.html
 *
 *  Wally Glutton 2008
 *  http://stungeye.com
 *
 *  License: This is free and unencumbered software released into the public domain. 
 */

import controlP5.*;

LSystem ps;
ControlP5 controlP5;
int iterations = 4;

void setup() 
{
  size(430, 600);
  frameRate(24);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("iterations",0,9,iterations,20,20,10,100);

  ps = new LSystem();
  ps.simulate(iterations,2);
}

public void iterations(int newIteration) {
  ps.reset();
  ps.simulate(newIteration,newIteration);
}

void draw() 
{
  stroke(255);
  background(0);
  ps.render();
}


class LSystem {

  int steps = 0;
  int step_inc = 1;

  String axiom;
  String ruleA;
  String ruleB;
  String production;

  float startLength;
  float drawLength;
  float theta;

  int generations;

  LSystem() {

    axiom = "A";
    ruleA = "B-A-B";
    ruleB = "A+B+A";
    startLength = 90.0f;
    theta = radians(60.0);
    reset();
  }

  void reset() {
    production = axiom;
    drawLength = startLength;
    generations = 0;
    steps = 0;
  }

  int getAge() {
    return generations;
  }
  
  void render() {
    pushMatrix();
    translate(20, height/2+50);
    steps += step_inc;          
    if (steps > production.length()) {
      steps = production.length();
    }
    for (int i = 0; i < steps; i++) {
      char step = production.charAt(i);
      if ((step == 'A') || (step == 'B')) {
        line(0, 0, drawLength, 0);
        translate(drawLength, 0);
      } 
      else if (step == '+') {
        rotate(-theta);
      } 
      else if (step == '-') {
        rotate(+theta);
      } 
    }
    popMatrix();
  }
  
  void simulate(int gen, int step_inc_) {
    while (getAge() < gen) {
      production = iterate(production, ruleA, ruleB);
    }
    step_inc = step_inc_;
  }

  String iterate(String prod_, String ruleA_, String ruleB_) {
    drawLength = drawLength * 0.6;
    generations++;
    String newProduction = "";          
    for (int i = 0; i < prod_.length(); i++) {
       if (prod_.charAt(i) == 'A') {
         newProduction += ruleA_;
       } else if (prod_.charAt(i) == 'B') {
         newProduction += ruleB_;
       } else {
         newProduction += prod_.charAt(i);
       }
    }
    return newProduction;
  }
}

