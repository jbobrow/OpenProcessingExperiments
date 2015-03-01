
int x=0;
int y=0;
int speed=3;
PImage webImage1;
PImage webImage2;

void setup(){
size (571,827);
String url1 = "http://s22.postimg.org/tguh36b9t/poster.jpg";
String url2 = "http://s4.postimg.org/fzr3vdtst/bike2.png";

webImage1 = loadImage(url1,"jpg");
webImage2 = loadImage(url2,"png");
}

void draw(){ 
noCursor();
  smooth();
  frameRate(30);
image(webImage1,0,0);
if (mousePressed==true){
tint(255,255,255,255-y); 
image(webImage2,x,200);
x=x+speed;
y++;
}
//magic dust
  for (int i=0; i<10; i++)
  {
    fill(255);
    noStroke();
    ellipse(mouseX+(random(-5, 5))*i, mouseY+(random(0, 30))*i, 2, 2);
  }
}
