
boolean flipFlop = false;
//String keyPrompt = "press DOWN key";
int eyeLidLoc;
int beardLoc;
int bgColor;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(13);
}
 
void draw(){
  if (flipFlop == false){
    eyeLidLoc = -10;
    beardLoc = 70;
    bgColor = 254;
 
  }
  if (flipFlop == true){
    eyeLidLoc = -30;
    beardLoc = 270;
    bgColor = 105;
  }
  makeFace();
  smooth();
  //text(keyPrompt,-145,-135);
}
 
/*void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN) {
      flipFlop =! flipFlop;}
  keyPrompt = ("");
    } else if(keyCode == UP){
      bgColor = 0; }
}
*/ 
void makeFace(){
 
size(300,300);
background(255,bgColor,201);
translate(150,150);

//head
rectMode(CENTER);
noStroke();
fill(227,197,161);
rect(0,0,200,150);
ellipse(20,80,50,50);
ellipse(-20,80,50,50);
//mouth
fill(116,52,79);
ellipse(0,60,30,30);
//ears
fill(27,197,161);
ellipse(170,-30,25,10);


//eyes
fill(255);
ellipse(40,-10,40,20);
ellipse(-40,-10,40,20);

//pupils
fill(0);
ellipse(40,-10,10,10);
ellipse(-40,-10,10,10);

//eyelids
fill(203,175,142);
arc(40,eyeLidLoc,40,20,-PI,0);
arc(-40,eyeLidLoc,40,20,-PI,0);

//hair
fill(0);
arc(0,-75,200,60,-PI,0);

//beard
rect(0,beardLoc,200,90,0,0,20,20);

//nose
fill(203,175,142);
triangle(0,0,30,30,-30,30);
}


