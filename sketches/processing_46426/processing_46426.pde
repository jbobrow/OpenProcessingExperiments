
/**
* Course Number: 22491
* Fianl year Project for processing
* Sketch description: A paint application
* @author FirstName: Conor LastName: McNamara, Student# G00248329
* @version Date: 4/05/09
*/


PFont f;

int x = 870;
int y = 510;
int w = 20;
int h = 25;

int x2 = 790;
int y2 = 510;
int w2 = 20;
int h2 = 25;

int x3 = 510;
int y3 = 560;
int w3 = 56;
int h3 = 45;

int x4 = 620;
int y4 = 560;
int w4 = 68;
int h4 = 45;

int x5 = 840;
int y5 = 300;
int w5 = 68;
int h5 = 45;

int cx1 = 20;
int cy1 = 540;
int cw1 = 18;
int ch1 = 18;

int cx2 = 50;
int cy2 = 540;
int cw2 = 18;
int ch2 = 18;

int cx3 = 80;
int cy3 = 540;
int cw3 = 18;
int ch3 = 18;

int cx4 = 110;
int cy4 = 540;
int cw4 = 18;
int ch4 = 18;

int cx5 = 140;
int cy5 = 540;
int cw5 = 18;
int ch5 = 18;

int cx55 = 20;
int cy55 = 570;
int cw55 = 18;
int ch55 = 18;

int cx6 = 170;
int cy6 = 540;
int cw6 = 18;
int ch6 = 18;

int cx66 = 50;
int cy66 = 570;
int cw66 = 18;
int ch66 = 18;

int cx7 = 200;
int cy7 = 540;
int cw7 = 18;
int ch7 = 18;

int cx8 = 230;
int cy8 = 540;
int cw8 = 18;
int ch8 = 18;

int cx9 = 260;
int cy9 = 540;
int cw9 = 18;
int ch9 = 18;

int cx10 = 290;
int cy10 = 540;
int cw10 = 18;
int ch10 = 18;

int cx11 = 320;
int cy11 = 540;
int cw11 = 18;
int ch11 = 18;

int cx12 = 350;
int cy12 = 540;
int cw12 = 18;
int ch12 = 18;

int cx13 = 380;
int cy13 = 540;
int cw13 = 18;
int ch13 = 18;

int cx14 = 410;
int cy14 = 540;
int cw14 = 18;
int ch14 = 18;

int cx15 = 380;
int cy15 = 570;
int cw15 = 48;
int ch15 = 18;


int R = 0;
int G = 0;
int B = 0;

int pensize = 2;
boolean button0 = true;
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;
boolean button5 = false;
boolean color1 = false;
boolean color2 = false;
boolean color3 = false;
boolean color4 = false;
boolean color5 = false;
boolean color55 = false;
boolean color6 = false;
boolean color66 = false;
boolean color7 = false;
boolean color8 = false;
boolean color9 = false;
boolean color10 = false;
boolean color11 = false;
boolean color12 = false;
boolean color13 = false;
boolean color14 = false;
boolean color15 = false;



void setup(){
size(900,600);
background(255);
frameRate(50000);
smooth();
f = loadFont( "ArabicTypesetting-20.vlw" );
}

void draw(){

//Paintbrush
if (mousePressed){
button0 = button0;
if (button0){
noStroke();
fill(R,G,B);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,pensize ,pensize);
}
if (mouseX > x4 && mouseX < x4+w4 && mouseY > y4 && mouseY < y4+h4 && mousePressed){
button0 = true;
button5 = false;
button3 = false;
}
}

//Pen draw
if (mouseX > x3 && mouseX < x3+w3 && mouseY > y3 && mouseY < y3+h3 && mousePressed){
button0 = false;
button5 = false;
button3 = !button3;
}
else if (mousePressed && button0 == false && button5 == false && !button3){
stroke(R,G,B);
line(pmouseX, pmouseY, mouseX, mouseY);
}

//Column 1
fill(21,11,59);
rect(778,480,200,70);
textFont(f,22);
fill (255);
text("Adjust  tool size", 790,500);

//Column 2
fill(21,11,59);
rect (10,525,430,100);


//Button for increasing pen size
if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed){
button1 = true; 
} 
else {
button1 = false;
}
if (button1) {
fill(185,201,255);
rect(x,y,w,h);
} 
else {
fill(255);
rect(x,y,w,h);
}
textFont(f,55);
fill(0);
text("+", x + 1,y + 20);


//Button for decreasing pen size
if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2 && mousePressed){
button2 = true; 
} 
else {
button2 = false;
}
if (button2) {
fill(185,201,255);
rect(x2,y2,w2,h2);
} 
else {
fill(255);
rect(x2,y2,w2,h2);
}
textFont(f,55);
fill (0);
text("-", x - 75,y + 23);

//Button for pen draw
if (mouseX > x3 && mouseX < x3+w3 && mouseY > y3 && mouseY < y3+h3 && mousePressed){
button3 = true; 
} 
else {
button3 = false;
}
if (button3) {
fill(185,201,255);
rect(x3,y3,w3,h3);
} 
else {
fill(245,0,8);
rect(x3,y3,w3,h3);
}
textFont(f,20);
fill (255);
text("Pen draw", x3 + 2, y3 + 25);


//Button for paint brush
if (mouseX > x4 && mouseX < x4+w4 && mouseY > y4 && mouseY < y4+h4 && mousePressed){
button4 = true; 
} 
else {
button4 = false;
}
if (button4) {
fill(185,201,255);
rect(x4,y4,w4,h4);
} 
else {
fill(245,0,8);
rect(x4,y4,w4,h4);
}
textFont(f,20);
fill (255);
text("Paint brush", x4 + 2, y4 + 25);


//Color 1
fill(0);
rect(cx1,cy1,cw1,ch1);

//Color 2
fill(72,71,71);
rect(cx2,cy2,cw2,ch2);

//Color 3
fill(167,167,167);
rect(cx3,cy3,cw3,ch3);

//Color 4
fill(126,36,36);
rect(cx4,cy4,cw4,ch4);

//Color 5
fill(216,13,13);
rect(cx5,cy5,cw5,ch5);

//Color 55
fill(85,34,2);
rect(cx55,cy55,cw55,ch55);

//Color 6
fill(255,97,5);
rect(cx6,cy6,cw6,ch6);

//Color 66
fill(255,162,235);
rect(cx66,cy66,cw66,ch66);

//Color 7
fill(255,198,8);
rect(cx7,cy7,cw7,ch7);

//Color 8
fill(245,255,15);
rect(cx8,cy8,cw8,ch8);

//Color 9
fill(137,255,59);
rect(cx9,cy9,cw9,ch9);

//Color 10
fill(33,201,8);
rect(cx10,cy10,cw10,ch10);

//Color 11
fill(84,240,238);
rect(cx11,cy11,cw11,ch11);

//Color 12
fill(14,96,175);
rect(cx12,cy12,cw12,ch12);

//Color 13
fill(5,20,93);
rect(cx13,cy13,cw13,ch13);

//Color 14
fill(71,40,111);
rect(cx14,cy14,cw14,ch14);

//Eraser
fill(255);
rect(cx15,cy15,cw15,ch15);
}

//Events
void mousePressed() {

//Brush size buttons
if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
button1 = !button1;
pensize = pensize + 1;
}

if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2) {
button2 = !button2;
pensize = pensize - 1;
}


//Color buttons
if (mouseX > cx1 && mouseX < cx1+cw1 && mouseY > cy1 && mouseY < cy1+ch1) {
color1 = !color1;
R = 0;
G = 0;
B = 0;
}
if (mouseX > cx2 && mouseX < cx2+cw2 && mouseY > cy2 && mouseY < cy2+ch2) {
color2 = !color2;
R = 72;
G = 71;
B = 71;
}
if (mouseX > cx3 && mouseX < cx3+cw3 && mouseY > cy3 && mouseY < cy3+ch3) {
color3 = !color3;
R = 167;
G = 167;
B = 167;
}
if (mouseX > cx4 && mouseX < cx4+cw4 && mouseY > cy4 && mouseY < cy4+ch4) {
color4 = !color4;
R = 126;
G = 36;
B = 36;
}
if (mouseX > cx5 && mouseX < cx5+cw5 && mouseY > cy5 && mouseY < cy5+ch5) {
color5 = !color5;
R = 216;
G = 13;
B = 13;
}
if (mouseX > cx55 && mouseX < cx55+cw55 && mouseY > cy55 && mouseY < cy55+ch55) {
color55 = !color55;
R = 85;
G = 34;
B = 2;
}
if (mouseX > cx6 && mouseX < cx6+cw6 && mouseY > cy6 && mouseY < cy6+ch6) {
color6 = !color6; 
R = 255;
G = 97;
B = 5;
}
if (mouseX > cx66 && mouseX < cx66+cw66 && mouseY > cy66 && mouseY < cy66+ch66) {
color66 = !color66;
R = 255;
G = 162;
B = 235;
}
if (mouseX > cx7 && mouseX < cx7+cw7 && mouseY > cy7 && mouseY < cy7+ch7) {
color7 = !color7;
R = 255;
G = 198;
B = 8;
}
if (mouseX > cx8 && mouseX < cx8+cw8 && mouseY > cy8 && mouseY < cy8+ch8) {
color8 = !color8;
R = 245;                  
G = 255;
B = 15;
}
if (mouseX > cx9 && mouseX < cx9+cw9 && mouseY > cy9 && mouseY < cy9+ch9) {
color9 = !color9;
R = 137;
G = 255;
B = 59;
}
if (mouseX > cx10 && mouseX < cx10+cw10 && mouseY > cy10 && mouseY < cy10+ch10) {
color10 = !color10;   
R = 33;
G = 201;
B = 8;
}
if (mouseX > cx11 && mouseX < cx11+cw11 && mouseY > cy11 && mouseY < cy11+ch11) {
color11 = !color11;    
R = 84;
G = 240;
B = 238;
}
if (mouseX > cx12 && mouseX < cx12 + cw12 && mouseY > cy12 && mouseY < cy10 + ch12) {
color12 = !color12;
R = 14;         
G = 96;
B = 175;
}
if (mouseX > cx13 && mouseX < cx13 + cw13 && mouseY > cy13 && mouseY < cy13 + ch13) {
color13 = !color13;
R = 5;
G = 20;
B = 93;
}
if (mouseX > cx14 && mouseX < cx14 + cw14 && mouseY > cy14 && mouseY < cy14 + ch14) {
color14 = !color14;
R = 71;
G = 40;
B = 111;
}
if (mouseX > cx15 && mouseX < cx15 + cw15 && mouseY > cy15 && mouseY < cy15 + ch15) {
color15 = !color15;
R = 255;
G = 255;
B = 255;
}
}






