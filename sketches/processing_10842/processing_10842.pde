
//by echoechonoisenoise 2010
//neural net structure from http://oreilly.com/catalog/9780596005559/ but simplified for explanation reasons.
//no bias and no momentum.

import controlP5.*;
ControlP5 gui;
Brain brain;
void setup(){
  size(900,500);
  smooth();
  brain=new Brain(6,12,2,0.25);
  gui = new ControlP5(this);
  gui.addSlider("fun",0,100,50,20,120,100,10);
  gui.addSlider("money",0,100,50,20,170,100,10);
  gui.addSlider("power",0,100,50,20,220,100,10);
  gui.addSlider("sex",0,100,50,20,270,100,10);
  gui.addSlider("weather",0,100,50,20,320,100,10);
  gui.addSlider("friends",0,100,50,20,370,100,10);
  gui.addSlider("happy",0,100,50,630,182,100,10);
  gui.addSlider("affraid",0,100,50,630,307,100,10);
  gui.addButton("train",0,630,425,29,29);
  gui.addButton("ask",0,660,425,29,29);
  gui.addButton("teach",0,690,425,29,29);
  gui.addButton("neu",0,720,425,29,29);
  gui.addSlider("hidden_neurons",1,25,12,750,425,50,14);
  gui.addSlider("learning_rate",0.1,0.9,0.25,750,440,50,14);
  gui.addSlider("repeat_teaching",1,3000,1000,630,455,170,14);
  Slider s = (Slider)gui.controller("hidden_neurons");
  s.setNumberOfTickMarks(25);
}
void draw(){
  background(35);
  drawGraph();  
}
void train(){//this is a training set
  for(int i=0;i<(int)gui.controller("repeat_teaching").value();i++){//repeated so that network can learn
    float r=random(1);
    if(r<0.25){
      brain.setInput(0,random(0.5,1));//for given inputs...
      brain.setInput(1,random(0.5,1));
      brain.setInput(2,random(0.5,1));
      brain.setInput(3,random(0.5,1));
      brain.setInput(4,random(0.5,1));
      brain.setInput(5,random(0.5,1));
      brain.setDesiredOutput(0,1);//...set the answers...
      brain.setDesiredOutput(1,0);  
      brain.feedForward();//...push the data thru the net...
      brain.backPropagate();//...compare net's answers with the desired and adjust weights a lttle bit...
    }
    else if(r>=0.25&&r<0.5){
      brain.setInput(0,random(0,0.5));
      brain.setInput(1,random(0.5,1));
      brain.setInput(2,random(0.5,1));
      brain.setInput(3,random(0.5,1));
      brain.setInput(4,random(0,0.5));
      brain.setInput(5,random(0,0.5));
      brain.setDesiredOutput(0,0.5);
      brain.setDesiredOutput(1,0.5);  
      brain.feedForward();
      brain.backPropagate(); 
    }
    else if(r>=0.5&&r<0.75){
      brain.setInput(0,random(0.5,1));
      brain.setInput(1,random(0,0.5));
      brain.setInput(2,random(0,0.5));
      brain.setInput(3,random(0.5,1));
      brain.setInput(4,random(0.5,1));
      brain.setInput(5,random(0.5,1));
      brain.setDesiredOutput(0,0.5);
      brain.setDesiredOutput(1,0.5);  
      brain.feedForward();
      brain.backPropagate(); 
    }
    else{
      brain.setInput(0,random(0,0.5));
      brain.setInput(1,random(0,0.5));
      brain.setInput(2,random(0,0.5));
      brain.setInput(3,random(0,0.5));
      brain.setInput(4,random(0,0.5));
      brain.setInput(5,random(0,0.5));
      brain.setDesiredOutput(0,0);
      brain.setDesiredOutput(1,1);  
      brain.feedForward();
      brain.backPropagate();       
    }
  }  
}
void ask(){
  brain.setInput(0,map(gui.controller("fun").value(),0,100,0,1));//take inputs from sliders...
  brain.setInput(1,map(gui.controller("money").value(),0,100,0,1));
  brain.setInput(2,map(gui.controller("power").value(),0,100,0,1));
  brain.setInput(3,map(gui.controller("sex").value(),0,100,0,1));
  brain.setInput(4,map(gui.controller("weather").value(),0,100,0,1));
  brain.setInput(5,map(gui.controller("friends").value(),0,100,0,1));
  brain.feedForward();//...push the data thru the net...
  gui.controller("happy").setValue(map(brain.getOutput(0),0,1,0,100));//...display networks answers.
  gui.controller("affraid").setValue(map(brain.getOutput(1),0,1,0,100));
}
void teach(){
  for(int i=0;i<(int)gui.controller("repeat_teaching").value();i++){
    brain.setInput(0,map(gui.controller("fun").value()+random(-10,10),0,100,0,1));//take inputs from sliders...
    brain.setInput(1,map(gui.controller("money").value()+random(-10,10),0,100,0,1));
    brain.setInput(2,map(gui.controller("power").value()+random(-10,10),0,100,0,1));
    brain.setInput(3,map(gui.controller("sex").value()+random(-10,10),0,100,0,1));
    brain.setInput(4,map(gui.controller("weather").value()+random(-10,10),0,100,0,1));
    brain.setInput(5,map(gui.controller("friends").value()+random(-10,10),0,100,0,1));
    brain.setDesiredOutput(0,map(gui.controller("happy").value(),0,100,0,1));//take answers from sliders...
    brain.setDesiredOutput(1,map(gui.controller("affraid").value(),0,100,0,1));
    brain.feedForward();
    brain.backPropagate();//teach
  } 
}
void neu(){
  brain=new Brain(6,(int)gui.controller("hidden_neurons").value(),2,gui.controller("learning_rate").value());//make a new brain with random weights

}








