
int counter=1;
int mode = 0;
PFont font;
float x = mouseX;
float y = mouseY;

void setup () {
  size(900,600);
  font = createFont("Arial", 15, true);
  textFont(font, 14);
  background(0,0,0);
  frameRate(25);
}

void draw(){
  if(mousePressed){
  if((mouseX > 100-50) && (mouseX < 100+50) && (mouseY > 525-40) && (mouseY < 525+40)){
    mode = 1;
  }
  if((mouseX > 250-50) && (mouseX < 250+50) && (mouseY > 525-40) && (mouseY < 525+40)){
    mode = 2;
  }
  if((mouseX > 400-50) && (mouseX < 400+50) && (mouseY > 525-40) && (mouseY < 525+40)){
    mode = 3;
  }
    if((mouseX > 550-40) && (mouseX < 550+50) && (mouseY > 525-40) && (mouseY < 525+40)){
    mode = 4;
  }
   
    if((mouseX > 700-40) && (mouseX < 700+50) && (mouseY > 525-40) && (mouseY < 525+40)){
    mode = 5;
  }
      if((mouseX > 800) && (mouseX < 800+50) && (mouseY > 480) && (mouseY < 480+100)){
    mode = 6;
  }}
  fill(#030303);
  stroke(#52c909);
  strokeWeight(10);
  rect(0,450,900,200,20);
 
  //kleine auswahlkasten
  stroke(#4b514a);
  strokeWeight(3);
  fill(#0de6c5);
  ellipse(100,525,100,80);
  fill(#e60d6e);
  ellipse(250,525,100,80);
  fill(#fffd35);
  ellipse(400,525,100,80);
  fill(#074274);
  ellipse(550,525,100,80);
  fill(#3eb42a);
  ellipse(700,525,100,80);
  fill(#c11818);
  rect(800,480,50,100,15);
  
 fill(0); 
text("Raupe",80,530); 
text("Blume",232,530); 
text("Quadrat",373,530);
text("Quadratkontur",503,530);
text("Blumenkontur",658,530);
text("R",820,498);
text("U",820,513);
text("B",820,528);
text("B",820,545);
text("E",820,560);
text("R",820,575);
  
if(mode == 1){
if(mousePressed){
    noStroke();
    fill(random(255),random(255),random(255),120);
ellipse(mouseX,mouseY,40,40); 
ellipse(mouseX-15,mouseY-30,5,30);
ellipse(mouseX-15,mouseY-40,10,10);
ellipse(mouseX+15,mouseY-30,5,30);
ellipse(mouseX+15,mouseY-40,10,10);
ellipse(mouseX,mouseY+40,50,50);
ellipse(mouseX-35,mouseY+50,30,5);
ellipse(mouseX+35,mouseY+50,30,5);
ellipse(mouseX,mouseY+80,50,50);
ellipse(mouseX-35,mouseY+80,30,5);
ellipse(mouseX+35,mouseY+80,30,5);
ellipse(mouseX,mouseY+120,50,50);
ellipse(mouseX-35,mouseY+110,30,5);
ellipse(mouseX+35,mouseY+110,30,5);
}
}
if(mode == 2) {
  if(mousePressed){
noStroke();
fill(random(255),random(255),random(255)); 
ellipse(mouseX+50,mouseY+50,50,50);
fill(random(255),random(255),random(255)); 
ellipse(mouseX+50,mouseY+50,30,30);
fill(random(255),random(255),random(255)); 
ellipse(mouseX+50,mouseY+50,30,30);
fill(random(255),random(255),random(255),100); 
rect(mouseX,mouseY,50,50,20);
fill(random(255),random(255),random(255),100);
rect(mouseX+50,mouseY,50,50,20);
fill(random(255),random(255),random(255),100);
rect(mouseX,mouseY+50,50,50,20);
fill(random(255),random(255),random(255),100);
rect(mouseX+50,mouseY+50,50,50,20);
fill(#86cc22,50);
ellipse(mouseX+10,mouseY+50,50,15);
fill(#86cc22,50);
ellipse(mouseX+90,mouseY+50,50,15);
fill(#86cc22,50);
ellipse(mouseX+50,mouseY+10,15,50);
fill(#86cc22,50);
ellipse(mouseX+50,mouseY+90,15,50);
}}
if(mode==3){
  if(mousePressed){
noStroke();
fill(random(255),random(255),random(255),100);
rect(mouseX,mouseY,50,50,20);
fill(random(255),random(255),random(255),100);
rect(mouseX+50,mouseY,50,50,20);
fill(random(255),random(255),random(255),100);
rect(mouseX,mouseY+50,50,50,20);
fill(random(255),random(255),random(255),100);
rect(mouseX+50,mouseY+50,50,50,20);
stroke(random(255),random(255),random(255));
strokeWeight(5);
fill(random(255),random(255),random(255),120);
rect(mouseX,mouseY,100,100,20); 
}}

if(mode==4){
if(mousePressed){
  strokeWeight(2);
stroke(random(255),random(255),random(255));
fill(#000000);
rect(mouseX,mouseY,120,120,10);  
stroke(random(255),random(255),random(255));
rect(mouseX+10,mouseY+10,100,100,10);  
stroke(random(255),random(255),random(255));
rect(mouseX+20,mouseY+20,80,80,10); 
stroke(random(255),random(255),random(255));
rect(mouseX+30,mouseY+30,60,60,10);  
stroke(random(255),random(255),random(255));
rect(mouseX+40,mouseY+40,40,40,10); 
stroke(random(255),random(255),random(255));
rect(mouseX+50,mouseY+50,20,20,10);
}}
if(mode==5){
  if(mousePressed){
    strokeWeight(2);
  stroke(random(255),random(255),random(255));
  noFill();
ellipse(mouseX,mouseY,50,50);
  stroke(random(255),random(255),random(255));
ellipse(mouseX+50,mouseY,50,50);
stroke(random(255),random(255),random(255));
ellipse(mouseX+50,mouseY+50,50,50);
stroke(random(255),random(255),random(255));
ellipse(mouseX,mouseY+50,50,50);
stroke(random(255),random(255),random(255));
strokeWeight(5);
ellipse(mouseX+25,mouseY+25,23,23);
}}
if(mode==6){
  if(mousePressed){
    noStroke();
  fill(0,0,0);
  ellipse(mouseX,mouseY,100,100);
}}}

void keyPressed(){
  
  if(key=='s');
  saveFrame("bild"+counter+"jpg");
  counter++;
  
  if(key=='1'){
    mode=1;
  }
  
  if(key=='2'){
    mode=2;
  }
    if(key=='3'){
    mode=3;
  }
      if(key=='4'){
    mode=4;
  }
  if(key=='5'){
    mode=5;
}
if(key=='6'){
  mode=6;
}}


