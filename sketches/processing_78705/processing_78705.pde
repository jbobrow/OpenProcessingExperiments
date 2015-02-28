
int X=20;
  int Y=200;
  int inc=0;
  
void setup(){
 
  size (800,800);
  background(229,49,163);
  frameRate(5);
}

void draw(){

//background(240,106,178);
   
PFont letra;

letra=loadFont("DialogInput-48.vlw");

textFont (letra);

fill(229,49,163);

textSize(100);

rect(0,0,width,height);

fill(0);

text("S",X,400);
text("A",X+inc,400);
text("M",X+inc*2,400);
text("A",X+inc*3,400);
text("N",X+inc*4,400);
text("T",X+inc*5,400);
text("H",X+inc*6,400);
text("A",X+inc*7,400);
inc=inc+5;


if(X+inc*7>=width-60){
  noLoop();

background(229,49,163);

text("S",random(width),random(height));
text("A",random(width),random(height));
text("M",random(width),random(height));
text("A",random(width),random(height));
text("N",random(width),random(height));
text("T",random(width),random(height));
text("H",random(width),random(height));
text("A",random(width),random(height));
}

}
