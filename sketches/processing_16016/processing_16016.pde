
PImage x;
void setup(){
size(600,600);
 
x= loadImage("yi1.png");

}
void draw() {
//face
fill(255,208,63);
ellipse(310,310,571,571);

x= loadImage("yi1.png");
image(x,0,0,600,600) ;
//lift
fill(0);
ellipse(126,210,38,60);
fill(225);
ellipse(118,210,15,31);
//right
fill(0);
ellipse(332,213,45,57);
fill(225);
ellipse(324,213,16,24);
//
fill(0);
quad(95,150,208,153,208,170,95,170);
quad(355,140,485,172,477,200,347,150);


}




