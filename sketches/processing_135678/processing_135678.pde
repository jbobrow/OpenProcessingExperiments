

float radio=10;
void setup (){
size (400,400);
background(0); 
smooth();
}
void draw (){
noStroke();
fill (255);
ellipse(200,200,radio,radio);
radio = radio + 0.5;
fill (0,10,222);
ellipse(100,100,radio,radio);
radio = radio + 0.5;
fill (0,200,10);
ellipse(300,300,radio,radio);
radio = radio + 0.5;
fill (0,100,0);
ellipse(radio,radio,200,200);
radio = radio - 0.5;

}
