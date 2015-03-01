
/* @pjs font="AvenirLTStd-Heavy.otf, Aleo-Light.0tf"; */

size(500,500);
background(50);
PFont aleo = loadFont("Aleo-Light",20);
PFont avenir = loadFont("AvenirLTStd-Heavy",32);
textFont(aleo);
fill(107,143,209);
text("kelly likes banana pancakes.",10,20,440,300);
textFont(avenir);
textAlign(RIGHT);
fill(209,165,207);
text("...who doesn't?",490,200);
textFont(aleo);
textAlign(LEFT);
fill(107,143,209);
text("good point.",10,400);


