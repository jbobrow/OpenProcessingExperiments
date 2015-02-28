
import netscape.javascript.*;

import rita.render.*;
import rita.json.*;
import rita.support.*;
import rita.*;



import rita.*;
import java.io.IOException;

PFont helvetica;

RiGrammar grammar;

//your text
String text;

//your speed
int voiceSpeed = 200;

//counter to avoid overlapping in case of speech
int waitTime = 0;

void setup()
{
  size(650, 200);
    strokeWeight(4);
  strokeCap(ROUND);
  helvetica = createFont("Helvetica", 48, true);
  textFont(helvetica, 30);
background(225,225,225);

  //load text file and create a grammar
  //try the text examples in the folder
  String[] lines = loadStrings("buzzfeedfinal.txt");
  String grammarString = join(lines, "\n"); 

  grammar = new RiGrammar(grammarString);
  
  //calling the click function once at the beginning to generate the first sentence
  mouseClicked();
}

void draw()
{
  //wait time is just a counter that lets some time pass between stetements 
  waitTime--;
}

void mouseClicked()
{
  //clear the background
  background(225,225,225);
  smooth();
  

  //generate a new text from the grammar
  String text = grammar.expand();

  //print it
  fill(255, 0, 0);
  //alignment
  textAlign(CENTER, CENTER);
  //LEFT, CENTER, RIGHT and TOP, BOTTOM, CENTER, BASELINE

  //size
  textSize(26); 

  //print text in the textbox delimited by the rectangle 
  text(text, 10, 10, width-10, height-10);
}


