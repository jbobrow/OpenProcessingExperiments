
int posicionX;
posicionA=100;
posicionB=400;
posicionC=320;
posicionD=180;
posicionD=180;
posicionE=248;
posicionF=140;
posicionG=252;
posicionH=360;
size(700,500);
void setup(){
}
void draw(){
background(200,255,255);
fill(255,255,0);
ellipse(200,70,100,100);
fill(205,133,63);
rect(0,150,700,100);
fill(0,0,205);
rect(0,250,700,250);
fill(139,69,19);
quad(posicionA,300,posicionB,300,posicionC,400,posicionD,400);
posicionA=posicionA+4;
posicionB=posicionB+4;
posicionC=posicionC+4;
posicionD=posicionD+4;
fill(238,232,170);
triangle(posicionE,296,posicionE,150,posicionF,296);
posicionE=posicionE+4;
posicionF=posicionF+4;
triangle(posicionG,296,posicionG,150,posicionH,296);
posicionG=posicionG+4;
posicionH=posicionH+4;

}                           
