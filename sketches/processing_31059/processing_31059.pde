
VARIABLE TYPES:

int = integer; 

float = decimal;

boolean = true or false;

String = a line of words in quotes 

    example = “Hello World!”

char = a single character

    example = ‘c’

Other less popular ones:

color 
PImage




IF STATEMENTS:

if(this happens){
    do this;
}

example: 

if (x<100){
    ellipse(x, x, 20, 20);
}


if(keyPressed == true){
    if(key == ‘a’){
background(200,30,100);
}
}



WRITING A CLASS

int xPos;
in yPos;
int wid;
int hei;
color col;


class Shoe{ → classes are usually named with an Uppercase letter.

Shoe(int x, int y, int w, int h, color c){

xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}

void display(){
fill(col);
rect (xPos, yPos, wid, hei);
}

To display the shoe:

IN ANOTHER TAB!

void setup(){

Shoe mine;
void setup(){
size(…)
background(…)
mine = new Shoe(5,10,30,20,color(67,30,100));
}

void draw(){
mine.display();
}


                
                
