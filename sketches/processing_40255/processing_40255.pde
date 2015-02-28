
void setup(){
PImage bg;
size(800,800);

bg = loadImage ("cris.jpg");
image(bg,0,0);
}


void draw(){
  frameRate(30);

fill(168,114,104);
quad(290,155, 270,250, 400,160, 470,250);

fill(168,159,162);
triangle(270,500,120,600,400,725);

fill(170,161,164);
triangle(300,450,330,550,298,600);

noStroke();
fill(201,158,151);
quad(400,600,375,575,400,525,450,500);

noFill();
strokeWeight(5);
arc(350,310, 270,400, PI/2, PI);

fill(209,158,151);
noStroke();
quad(400,310,470,360,440,310,445,405);

fill(209,158,151);
triangle(350,525,300,440,370,570);

fill(209,158,151);
triangle(420,620, 310,440, 370,570);


}

void mousePressed () {
PImage c;
c = loadImage("fatcat100.jpg");
imageMode(CENTER);
image(c,mouseX,mouseY,100,100);
}















