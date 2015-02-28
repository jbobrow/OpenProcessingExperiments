
int value=0;

void draw (){
fill (value);
rect (25, 25, 50, 50);
}

void mousePressed(){
if (value != 0) {
value = 0;
}else{
value = 255;
}
}
