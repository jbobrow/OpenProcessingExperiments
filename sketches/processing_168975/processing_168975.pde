
float r;
float g;
float b;
void setup()
{size(600,600);
background(255);}
void draw()
{strokeWeight(4);
  fill(#F55474);
rect(550,0,50,50);
fill(#76F554);
rect(550,50,50,50);
fill(#FA6C14);
rect(550,100,50,50);
fill(#1C4BA5);
rect(550,150,50,50);
fill(#99A51C);
rect(550,200,50,50);
r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
rect(550,250,50,50);
if(mousePressed){
line(pmouseX,pmouseY,mouseX,mouseY);}
  
  if(mouseX>550 && mouseY<50){
  if (mousePressed){
  stroke(#F55474);}}
else if(mouseX>550 && mouseY>50 && mouseY<100){
    if (mousePressed){
  stroke(#76F554);}}
  else if(mouseX>550 && mouseY>100 && mouseY<150){
  if(mousePressed){
  stroke(#FA6C14);}}
else if(mouseX>550 && mouseY>150 && mouseY<200){
  if(mousePressed){
    stroke(#1C4BA5);}}
    else if(mouseX>550 && mouseY>200 && mouseY<250){
      if(mousePressed){
        stroke(#99A51C);}}
        else if(mouseX>550 && mouseY>250 && mouseY<300){
          if(mousePressed){
            stroke(r,g,b);}}}

