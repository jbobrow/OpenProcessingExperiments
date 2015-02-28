
int d=255;
String s="";
int r=0;
void setup() {
size(d,d);
textFont(createFont(s,9));
textSize(d);
}
void draw() {
r=(int)random(95)+1;
s=""+(char)(r+33);
background(33+r);
fill(d-r);
text(s,0,d);
}

