
int x = 5;
float b = 400;
PFont myfont;

void setup(){
size(900,800);
myfont= createFont("Georgia", 40, true);

}

void draw(){
ellipse(600,600,b,b);
fill(200,150,150);
textFont(myfont);
textSize(b);
text("cram",8,b);
}

void mousePressed(){
b = b-10;

}
