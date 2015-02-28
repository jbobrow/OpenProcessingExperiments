
color rot = color(255,0,0);
color gruen = color(0,255,0);
color blau = color(0,0,255);
color gelb = color(255,255,0);
color schwarz = color(0,0,0);
color weiss = color(255,255,255);
color startFarbe1 = color(255,255,254);
color startFarbe2 = color(255,255,254);
color startFarbe3 = color(255,255,254);
color startFarbe4 = color(255,255,254);

void setup(){
size(700,500);
background(255);
smooth();



}


void draw(){
 
  //FARBLEISTE
fill(125,255,184);
rect(50,-1,600,60);

//BUCHSTABEN DREIECK
fill(0);
PFont font;
font = loadFont("ArialNarrow-10.vlw"); 
textFont(font,10); 
text("1",112.5,22.5);

 
textFont(font,10); 
text("2",127.5,22.5);


textFont(font,10); 
text("3",142.5,22.5);


textFont(font,10); 
text("4",157.5,22.5);

 
textFont(font,10); 
text("5",172.5,22.5);


textFont(font,10); 
text("6",187.5,22.5);

//BUCHSTABEN KREIS
fill(0);
 
textFont(font,10); 
text("q",262.5,22.5);


textFont(font,10); 
text("w",277.5,22.5);


textFont(font,10); 
text("e",292.5,22.5);

 
textFont(font,10); 
text("r",307.5,22.5);


textFont(font,10); 
text("t",322.5,22.5);

 
textFont(font,10); 
text("z",337.5,22.5);

//BUCHSTABEN QUADRAHT
fill(0);

textFont(font,10); 
text("a",412.5,22.5);


textFont(font,10); 
text("s",427.5,22.5);


textFont(font,10); 
text("d",442.5,22.5);


textFont(font,10); 
text("f",457.5,22.5);


textFont(font,10); 
text("g",472.5,22.5);


textFont(font,10); 
text("h",487.5,22.5);

//BUCHSTABEN STERN
fill(0);
 
textFont(font,10); 
text("y",562.5,22.5);

 
textFont(font,10); 
text("x",577.5,22.5);


textFont(font,10); 
text("c",592.5,22.5);

 
textFont(font,10); 
text("v",607.5,22.5);


textFont(font,10); 
text("b",622.5,22.5);


textFont(font,10); 
text("n",637.5,22.5);

//KLEINE RECHTECKE
fill(rot);
rect(110,25,10,10);
fill(gruen);
rect(125,25,10,10);
fill(blau);
rect(140,25,10,10);
fill(gelb);
rect(155,25,10,10);
fill(schwarz);
rect(170,25,10,10);
fill(weiss);
rect(185,25,10,10);

fill(rot);
rect(260,25,10,10);
fill(gruen);
rect(275,25,10,10);
fill(blau);
rect(290,25,10,10);
fill(gelb);
rect(305,25,10,10);
fill(schwarz);
rect(320,25,10,10);
fill(weiss);
rect(335,25,10,10);

fill(rot);
rect(410,25,10,10);
fill(gruen);
rect(425,25,10,10);
fill(blau);
rect(440,25,10,10);
fill(gelb);
rect(455,25,10,10);
fill(schwarz);
rect(470,25,10,10);
fill(weiss);
rect(485,25,10,10);

fill(rot);
rect(560,25,10,10);
fill(gruen);
rect(575,25,10,10);
fill(blau);
rect(590,25,10,10);
fill(gelb);
rect(605,25,10,10);
fill(schwarz);
rect(620,25,10,10);
fill(weiss);
rect(635,25,10,10);
  
  
//DREIECK
fill(255,255,254);
rect(55,5,50,50);
fill(startFarbe1);
triangle(65,15,95,15,80,45);

//KREIS
fill(255,255,254);
rect(205,5,50,50);
fill(startFarbe2);
ellipse(230,30,30,30);

//QUADRAHT
fill(255,255,254);
rect(355,5,50,50);
fill(startFarbe3);
rect(365,15,30,30);

//STERN
fill(255,255,254);
rect(505,5,50,50);
fill(startFarbe4);
beginShape();
vertex(517,26);
vertex(527,26);
vertex(530,15);
vertex(533,26);
vertex(543,26);
vertex(536,32);
vertex(538,43);
vertex(530,36);
vertex(522,43);
vertex(524,32);
vertex(517,26);
endShape();

  

//FARBEN DREIECK
if(mouseX > 110 && mouseX < 120 && mouseY > 25 && mouseY < 35){
  startFarbe1 = color(rot);
}

if(mouseX > 125 && mouseX < 135 && mouseY > 25 && mouseY < 35){
  startFarbe1 = color(gruen);
}

if(mouseX > 140 && mouseX < 150 && mouseY > 25 && mouseY < 35){
  startFarbe1 = color(blau);
} 
  
if(mouseX > 155 && mouseX < 165 && mouseY > 25 && mouseY < 35){
  startFarbe1 = color(gelb);
}  
  
if(mouseX > 170 && mouseX < 180 && mouseY > 25 && mouseY < 35){
  startFarbe1 = color(schwarz);
}  
  
if(mouseX > 185 && mouseX < 190 && mouseY > 25 && mouseY < 35){
  startFarbe1 = color(weiss);
}

//FARBEN KREIS
if(mouseX > 260 && mouseX < 270 && mouseY > 25 && mouseY < 35){
  startFarbe2 = color(rot);
}

if(mouseX > 275 && mouseX < 285 && mouseY > 25 && mouseY < 35){
  startFarbe2 = color(gruen);
}

if(mouseX > 290 && mouseX < 300 && mouseY > 25 && mouseY < 35){
  startFarbe2 = color(blau);
} 
  
if(mouseX > 305 && mouseX < 315 && mouseY > 25 && mouseY < 35){
  startFarbe2 = color(gelb);
}  
  
if(mouseX > 320 && mouseX < 330 && mouseY > 25 && mouseY < 35){
  startFarbe2 = color(schwarz);
}  
  
if(mouseX > 335 && mouseX < 345 && mouseY > 25 && mouseY < 35){
  startFarbe2 = color(weiss);
}

//FARBEN QUADRAHT
if(mouseX > 410 && mouseX < 420 && mouseY > 25 && mouseY < 35){
  startFarbe3 = color(rot);
}

if(mouseX > 425 && mouseX < 435 && mouseY > 25 && mouseY < 35){
  startFarbe3 = color(gruen);
}

if(mouseX > 440 && mouseX < 450 && mouseY > 25 && mouseY < 35){
  startFarbe3 = color(blau);
} 
  
if(mouseX > 455 && mouseX < 465 && mouseY > 25 && mouseY < 35){
  startFarbe3 = color(gelb);
}  
  
if(mouseX > 470 && mouseX < 480 && mouseY > 25 && mouseY < 35){
  startFarbe3 = color(schwarz);
}  
  
if(mouseX > 485 && mouseX < 495 && mouseY > 25 && mouseY < 35){
  startFarbe3 = color(weiss);
}

//FARBEN STERN
if(mouseX > 560 && mouseX < 570 && mouseY > 25 && mouseY < 35){
  startFarbe4 = color(rot);
}

if(mouseX > 575 && mouseX < 585 && mouseY > 25 && mouseY < 35){
  startFarbe4 = color(gruen);
}

if(mouseX > 590 && mouseX < 600 && mouseY > 25 && mouseY < 35){
  startFarbe4 = color(blau);
} 
  
if(mouseX > 605 && mouseX < 615 && mouseY > 25 && mouseY < 35){
  startFarbe4 = color(gelb);
}  
  
if(mouseX > 620 && mouseX < 630 && mouseY > 25 && mouseY < 35){
  startFarbe4 = color(schwarz);
}  
  
if(mouseX > 635 && mouseX < 645 && mouseY > 25 && mouseY < 35){
  startFarbe4 = color(weiss);
}



if(mousePressed){
  
  
fill(startFarbe1);
triangle(mouseX-15,mouseY-82,mouseX+15,mouseY-82,mouseX,mouseY-52);
fill(startFarbe2);
ellipse(mouseX+70,mouseY,40,40);
fill(startFarbe3);
rect(mouseX-90,mouseY-20,40,40);
fill(startFarbe4);
beginShape();
vertex(mouseX,mouseY+53);
vertex(mouseX+3,mouseY+66);
vertex(mouseX+13,mouseY+66);
vertex(mouseX+6,mouseY+70);
vertex(mouseX+8,mouseY+81);
vertex(mouseX,mouseY+74);
vertex(mouseX-8,mouseY+81);
vertex(mouseX-6,mouseY+70);
vertex(mouseX-12,mouseY+66);
vertex(mouseX-3,mouseY+66);
vertex(mouseX,mouseY+53);
endShape();
}

if(keyPressed){


  if(key == '1'){
startFarbe1 = color(rot);
}
  
    if(key == '2'){
startFarbe1 = color(gruen);
}
  
      if(key == '3'){
startFarbe1 = color(blau);
}
  
        if(key == '4'){
startFarbe1 = color(gelb);
}

        if(key == '5'){
startFarbe1 = color(schwarz);
}

        if(key == '6'){
startFarbe1 = color(weiss);
}



  if(key == 'q'){
startFarbe2 = color(rot);
}
  
    if(key == 'w'){
startFarbe2 = color(gruen);
}
  
      if(key == 'e'){
startFarbe2 = color(blau);
}
  
        if(key == 'r'){
startFarbe2 = color(gelb);
}

        if(key == 't'){
startFarbe2 = color(schwarz);
}

        if(key == 'z'){
startFarbe2 = color(weiss);
}
        

  if(key == 'a'){
startFarbe3 = color(rot);
}
  
    if(key == 's'){
startFarbe3 = color(gruen);
}
  
      if(key == 'd'){
startFarbe3 = color(blau);
}
  
        if(key == 'f'){
startFarbe3 = color(gelb);
}

        if(key == 'g'){
startFarbe3 = color(schwarz);
}

        if(key == 'h'){
startFarbe3 = color(weiss);
}


  if(key == 'y'){
startFarbe4 = color(rot);
}
  
    if(key == 'x'){
startFarbe4 = color(gruen);
}
  
      if(key == 'c'){
startFarbe4 = color(blau);
}
  
        if(key == 'v'){
startFarbe4 = color(gelb);
}

        if(key == 'b'){
startFarbe4 = color(schwarz);
}

        if(key == 'n'){
startFarbe4 = color(weiss);
}


  if(key == ' '){
background(255,255,255);
}

}

}

