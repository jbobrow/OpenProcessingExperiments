
Pimage laimagen;
void setup(){
size(400,400); 
laimagen=loadImage("http://4.bp.blogspot.com/-ufg0nZYhiQ8/Tq9zCXSlG1I/AAAAAAAAIBs/cMc4KkvOzFM/s1600/Mickey-Mouse.jpg");
}
void draw (){
image(laimagen,0,0);
color tono = color(random(255),random(255),random(255));
loadPixels();
for (int i =0; i< (width*height); i=i+3){
pixels[i] = tono;
}
updatePixels();
}
