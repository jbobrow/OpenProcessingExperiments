
PImage img;
void setup(){
size(1024,768);
img=loadImage ("Koala.jpg");
}
void draw () {
image(img,0 , 0);
fill (255,10,10);
ellipse (400,400,100,100);
ellipse (650,450,100,100);
triangle (430,585,450,585,440,700);
triangle (470,585,490,585,480,700);



}


