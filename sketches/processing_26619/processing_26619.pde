
boolean hit=false;
float oldX, oldY;
//colors
color buttonCol = color(255);
color buttonCol2 = color (254,255,0); 
color buttonCol3 = color(0,0,255);
color buttonCol4 =color (0,255,0);
color buttonCol5 = color(255,0,0);
color buttonCol6 = color(254,255,0);  
color buttonCol7 = color(0);
color penColor = #000000;
void setup() {
size(500,500);
smooth();}
void draw(){
noStroke();
//top leftbox
//white
fill(255,255,255);
rect(10, 20, 20, 20);
if (mouseX >10 && mouseX <30 && mouseY >20 && mouseY<40) {
if(!hit){}
if(mousePressed){ 
penColor= buttonCol;}   
hit=true;
}else{
hit=false;}
//yellow
fill(254,255,0);
rect(30, 20, 20, 20);
if (mouseX >30 && mouseX <50 && mouseY >20 && mouseY<40) {
if(!hit){}
if(mousePressed){ 
penColor=buttonCol2;
}hit=true;
}else{
hit=false;}
//blue
fill(0,0,255);
rect(10, 40, 20, 20);
if (mouseX >10 && mouseX <30 && mouseY >40 && mouseY<60) {
if(!hit){}
if(mousePressed){ 
penColor=buttonCol3;}
hit=true;
}else{
hit=false;}
//green
fill(0,255,0);
rect(30, 40, 20, 20);
if (mouseX >30 && mouseX <60 && mouseY >40 && mouseY<60) {
if(!hit){}
if(mousePressed){ 
penColor=buttonCol4;}  
hit=true;
}else{
hit=false;}
//red
fill(255,0,0);
rect(10, 60, 20, 20);
if (mouseX >10 && mouseX <30 && mouseY >60 && mouseY<80) {
if(!hit){}
if(mousePressed){ 
penColor=buttonCol5;}
hit=true;
}else{
hit=false;}
//black
fill(0);
rect(30, 60, 20, 20);
if (mouseX >30 && mouseX <50 && mouseY >60 && mouseY<80) {
if(!hit){ 
}
if(mousePressed){ 
penColor=buttonCol7;}   
hit=true;
}else{
hit=false;}
// pen bigger
fill(0);
rect(10, 380, 60, 100);
if (mouseX >10 && mouseX <70 && mouseY >380 && mouseY<480) {
if(!hit){}
if(mousePressed){ 
strokeWeight(10);
}else   
hit=true;
}else{
hit=false;}
//pen normal size
fill(0);
rect(430, 430, 60, 50);
if (mouseX >430 && mouseX <490 && mouseY >430 && mouseY<480) {
if(!hit){}
if(mousePressed){ 
strokeWeight(1);}   
hit=true;
}else{
hit=false;}
//clearnew
fill(229);
rect(10, 80, 40, 20);
if (mouseX >10 && mouseX <50 && mouseY >80 && mouseY<100) {
if(!hit){}
if(mousePressed){  
background(255);}
hit=true;
}else{
hit=false;}
//good to keep dont mess with 
stroke(penColor);
if(mousePressed) {
line(mouseX,mouseY, oldX, oldY);}
oldX =mouseX;
oldY =mouseY;}
