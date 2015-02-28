
void setup (){
size (400,400);
background (255);
}

void draw (){
if (mousePressed){
if (mouseButton==LEFT){
background(255,0,0);
}
if (mouseButton==RIGHT){
background (0,255,0);
}
if (mouseButton==CENTER){
background (255,255,255);
}
}
}
