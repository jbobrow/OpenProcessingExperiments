
PImage notYou;
PImage redPop;
PImage redA;
PImage birdie;
PImage annoy;
PImage branch;
PImage greenPop;
PImage fatBirdie;
PImage fatBirdieTwo;
PImage redRoyal;
PImage babeOrange;

void setup(){
  size (804, 560);
  background (0,0,0); 
  smooth();
  frameRate (5);
//  redPopW =width/2.0;
//  redPopH = height/2.0;
  notYou = loadImage ("notYou.png");
  redPop = loadImage("redPop.png");
  redA = loadImage ("redA.png");
  birdie = loadImage ("birdie.png");
  annoy= loadImage ("annoy.png");
  branch= loadImage ("branch.png");
  greenPop= loadImage ("greenPop.png");
  fatBirdie= loadImage ("fatBirdie.png");
  fatBirdieTwo= loadImage ("fatBirdieTwo.png");
  redRoyal= loadImage ("redRoyal.png");
  babeOrange= loadImage ("babeOrange.png");
}

void draw(){
}
void mouseClicked (){
  //blue
  if (key =='z'){
    background (136, 238, 252);  
}
  //green
   if (key =='x'){
    background (44, 79, 23);  
}
  //orange
   if (key =='w'){
    background (238, 100, 35);  
}
  
  if (key =='1'){
    image (notYou, mouseX, mouseY);
    
}

 if (key =='2'){
    image (annoy, mouseX, mouseY);

}

 if (key =='3'){
    image (redRoyal, mouseX, mouseY);
}

 if (key =='4'){
    image (babeOrange, mouseX, mouseY);
    

}
}

void mousePressed (){
//  if (keyPressed && =='a'){
    if (key == 'a'){
     image (redPop, mouseX, mouseY);
//     redPopW = constrain (redPopW * 1.1, 14px, 28px);
//     redPopH = constrain (redPopH * 1.1, 75px, 150px);
}
  if (key =='b'){
    image (redA, mouseX, mouseY);
}
  if (key =='c'){
    image (birdie, mouseX, mouseY);
}
  if (key == 'd' ){
    image (branch, mouseX, mouseY);
}
  if (key == 'e' ){
    image (greenPop, mouseX, mouseY);
}
  if (key == 'f' ){
    image (fatBirdie, mouseX, mouseY);
}
  if (key == 'g' ){
    image (fatBirdieTwo, mouseX, mouseY);
}
}

