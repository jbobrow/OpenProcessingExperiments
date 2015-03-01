
float r;
float g;
float b;
void setup()
{size(600,600);
background(255);}

void draw(){
strokeWeight(2);
fill(#B023D8);
rect(550,0,50,50);
fill(#FA42B0);
rect(550,50,50,50);
fill(#42CAFA);
rect(550,100,50,50);
fill(#42FA65);
rect(550,150,50,50);
fill(#FFF300);
rect(550,200,50,50);
fill(#FF0004);
rect(550,250,50,50);
r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
rect(550,300,50,50);
if(mousePressed){
line(pmouseX,pmouseY,mouseX,mouseY);}

if(mouseX>550 && mouseY<50){
  if(mousePressed){
     stroke(#B023D8);}}
else if(mouseX>550 && mouseY>50 && mouseY<100){
  if(mousePressed){
    stroke(#FA42B0);}}
else if(mouseX>550 && mouseY>100 && mouseY<150){
  if(mousePressed){
    stroke(#42CAFA);}}
else if(mouseX>550 && mouseY>150 && mouseY<200){
  if(mousePressed){
    stroke(#42FA65);}}
else if(mouseX>550 && mouseY>200 && mouseY<250){
  if(mousePressed){
    stroke(#FFF300);}}
else if(mouseX>550 && mouseY>250 && mouseY<300){
  if(mousePressed){
    stroke(#FF0004);}}
else if(mouseX>550 && mouseY>300 && mouseY<350){
  if(mousePressed){
    stroke(r,g,b);}}

}
