
void setup (){
size (400,400);
background (255);
}
 
void draw (){
background (255);
if (mousePressed){
if (mouseButton==LEFT){
rect (150,150,200,200);
}

if (mouseButton==RIGHT){
ellipse (150,200,100,100);
}
if (mouseButton==CENTER){
triangle (150,150,200,50,250,150);
}
}
}
