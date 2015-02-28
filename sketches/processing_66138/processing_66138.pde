
void setup(){
  colorMode(HSB, 360, 100, 100);
  color yellow = color(61,43,95);
  color dirtyYellow = color(61,43,80);
  color purple = color(237,28,88);
  color black = color(0,0,0);
  color white = color(0,0,100);
  color azul = color(233,45,38);
  color grey = color(0,0,80);
  
  int r = 20;
  int hRand = round(random(height/2));
  int wRand = round(random(width/2));
    
  size(500, 500);
  background(purple);
  smooth();
  noStroke();
  
  for(int i=0;i<7;i++){
    int variable = round(random(r)-(r/2));
    if(i%2 == 0){
        fill(yellow);
        stroke(dirtyYellow);
        rect((wRand+variable), hRand+(20*i), 50, 20);
    } else {
        fill(white);
        stroke(grey);
        rect((wRand+variable), hRand+(20*i), 50, 20);
    }
  }
  
    hRand = round(random(height/2));
    wRand = round(random(width/2)+(width/2));
  
    for(int i=0;i<7;i++){
    int variable = round(random(r)-(r/2));
    if(i%2 == 0){
        fill(yellow);
        stroke(dirtyYellow);
        rect((wRand+variable), hRand+(20*i), 50, 20);
    } else {
        fill(white);
        stroke(grey);
        rect((wRand+variable), hRand+(20*i), 50, 20);
    }
  }
  
    hRand = round(random(height/2)+(height/2));
    wRand = round(random(width/2)+(width/4));
  
    for(int i=0;i<7;i++){
    int variable = round(random(r)-(r/2));
    if(i%2 == 0){
        fill(yellow);
        stroke(dirtyYellow);
        rect((wRand+variable), hRand+(20*i), 50, 20);
    } else {
        fill(white);
        stroke(grey);
        rect((wRand+variable), hRand+(20*i), 50, 20);
    }
  }

  fill(azul);
  stroke(black);
  
  for(int i=0;i<10;i++){
    ellipse((200+(i*i)), (180+(2*i)), (160-(2*i)), (80-(i*i)));
  }  
  
  fill(white);
  noStroke();
  
  for(int i=0;i<42;i++){
    hRand = round(random(height));
    wRand = round(random(width));
    float radiansRand = random(3);
    float radiansRand2 = random(3);
    arc(wRand,hRand,20,20,radiansRand,radiansRand2);
  }
  
  fill(271,60,66,60);
  int vRand1 = round(random(200)-100);
  int vRand2 = round(random(200)-100);
  int vRand3 = round(random(200)-100);
  int vRand4 = round(random(200)-100);
  beginShape();
  vertex(0,(height/2)+vRand1);
  vertex((width/2)+vRand2,0);
  vertex(width, (height/2)+vRand3);
  vertex((width/2)+vRand4,height);
  endShape();
  
  
  for(int i=0; i<3;i++){
    wRand = round(random((width/2)-100));
    hRand = round(random(height/2)+(height/2));
    stroke(0);
    noFill();
    int bezFactor = 40;
    bezier(wRand,hRand,wRand,(hRand-bezFactor),(wRand+bezFactor),(hRand-bezFactor),(wRand+bezFactor),hRand);
    bezier((wRand+bezFactor),hRand,(wRand+bezFactor),(hRand+bezFactor),(wRand+bezFactor/8),(hRand+bezFactor),(wRand+(bezFactor/8)),hRand);
    bezier((wRand+(bezFactor/8)),hRand,(wRand+(bezFactor/8)),(hRand-(7*(bezFactor/8))),(wRand+bezFactor-(bezFactor/8)),(hRand-(7*(bezFactor/8))),(wRand+bezFactor-(bezFactor/8)),hRand);
    bezier((wRand+bezFactor-(bezFactor/8)),hRand,(wRand+bezFactor-(bezFactor/8)),(hRand+(7*(bezFactor/8))),(wRand+(2*(bezFactor/8))),(hRand+(7*(bezFactor/8))),(wRand+(2*(bezFactor/8))),hRand);
  }

  int poemInt = 42;
  float poemFloat = 3.5;

  println("Life is a party, alive and writhing.");
  println("The places change, the details vary,");
  println("But the big picture stays the same.");
  println("From the barflies and party girls");
  println("To all the moms and dads with their " + poemFloat + " kids,");
  println("The players dance across the stage,");
  println("Let it pass by or you can engage.");
  println("Pick up your brush and add your voice");
  println("To the partygoers cheerful cries.");
  println("(The meaning of this party is " + poemInt + ".)");
}

