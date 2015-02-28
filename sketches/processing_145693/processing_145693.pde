
boolean flipFlop = false;
int blackDiam;
void setup(){
  size(300,300);
}

void draw(){
  if (flipFlop == false){
    blackDiam = 50;
  }
  else{
    blackDiam = 30;
  }
 background(255, 204, 0);
//head
strokeWeight(7);
size(300,300);
translate(150,150);
fill(250,208,187);
ellipse(0,0,190,160);

//eyeswhite
strokeWeight(2);
fill(255,250,251);
ellipse(-50,-5,-80,80);
ellipse(50,-5,-80,80);

//eyespink
noStroke();
fill(255,93,117);
ellipse(-46,-4,-70,70);
ellipse(46,-4,-70,70);

//eyesblack
noStroke();
fill(0,0,0);
ellipse(-41,-3,blackDiam,blackDiam);
ellipse(41,-3,blackDiam,blackDiam);

//eyessmallwhite
noStroke();
fill(255,252,250);
ellipse(-37,-5,-20,20);
ellipse(37,-5,-20,20);

//mouth
stroke(0,0,0);
strokeWeight(3);
noFill();
arc(0, 45, 25, 25, 0, PI+QUARTER_PI, OPEN);

//hair
strokeWeight(2);
fill(160,82,44);
ellipse(0,-90,80,80);
ellipse(0,-60,140,50);


}
void keyPressed(){
flipFlop =! flipFlop;
}
