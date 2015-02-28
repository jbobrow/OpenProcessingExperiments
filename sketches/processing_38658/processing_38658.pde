
int counter;

void setup(){
size(300,300);
smooth();
}
void draw(){
background(255,204,15);
//ears of panda
fill(0);
ellipse(80,100,70,70);
ellipse(220,100,70,70);
//head of panda
fill(255);
strokeWeight(4);
ellipse(150,150,200,180);
//eyes of panda
fill(0);
ellipse(100,160,60,70);
ellipse(200,160,60,70);
float mx=constrain(mouseX,84,116);
float my=constrain(mouseY,142,178);
fill(255);
ellipse(mx,my,12,12);
ellipse(mx+100,my,12,12);
//nose of panda
fill(0);
ellipse(150,200,15,10);
//mouse of panda
noFill();
stroke(0);
strokeWeight(4);
bezier(145,220,145,225,155,225,155,220);
if (keyPressed) {
//background of bear
noStroke();
fill(0,210,245);
rect(0,0,300,300);
//ears of bear
fill(142,64,0);
stroke(0);
strokeWeight(4);
ellipse(80,100,70,70);
ellipse(220,100,70,70);
//head of bear
fill(142,64,0);
stroke(0);
strokeWeight(4);
ellipse(150,150,200,180);
//eyes of bear
fill(255);
ellipse(100,150,30,30);
ellipse(200,150,30,30);
fill(0);
ellipse(90,150,7,7);
ellipse(190,150,7,7);
//mouse of bear
strokeWeight(2);
fill(230,140,0);
stroke(0);
ellipse(150,200,80,70);
stroke(0);
strokeWeight(2);
line(150,170,150,215);
line(150,215,142,220);
line(150,215,158,220);
//nose of bear
fill(0);
ellipse(150,170,20,15);}}   
                
