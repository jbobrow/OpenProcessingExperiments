
int op=255;

void setup(){
size(1000, 1000);
background(255);


PFont font;
font = loadFont("Arial-Black-48.vlw"); 
textFont(font); 
}

void draw(){


text("_*_", random(1000),random(1000)); 
if (op == 0){
 op = 255; 
}
fill(0,0,random(127), op);
op--;


}


