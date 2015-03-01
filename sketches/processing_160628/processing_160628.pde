
PImage SantaMonica;
float speed= 4.0;
float move;

void setup() {



size(500,400);
SantaMonica=loadImage("http://www.santamonicascoop.com/wp-content/uploads/2014/04/Santa-Monica-Pier-Steve-Bev-via-Flickr-Creative-Commons.jpg");
}
void draw() {
background(40);
text("Santa Monica Pier",200, 200);
move=move+speed;
//background(random(0,100),random(50,200),random(0,255);
image(SantaMonica,move,30); 
if (move>500){
move=0;
}
}


