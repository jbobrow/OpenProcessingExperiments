
PImage a,b;
void setup(){
size(600,600);
a= loadImage("img.png");
b= loadImage("img2.png");
 noStroke();
}
void draw() {
  a= loadImage("img.png");
image(a,0,0,600,600) ;
   tutu(100,100, 0.5, 120);
  tutu(300,100,1,0);

}
void tutu(int x, int y, float s, int c) {
  pushMatrix();
  scale(s);
  translate(x,y);
  fill(c);
//ears
fill(231,180,211);
ellipse(338,110,52,138);
ellipse(255,110,52,138);
fill(225);
ellipse(338,110,32,120);
ellipse(255,110,32,120);
//limbs
fill(250,177,246);
ellipse(393,340,68,28);
ellipse(209,340,68,28);
ellipse(200,470,117,37);
ellipse(400,470,117,37);

//big body
fill(245,146,240);
ellipse(300,380,137,217);
//small body
fill(225);
ellipse(300,380,60,175);
//head
fill(247,185,244);
ellipse(300,220,160,140);

ellipse(330,490,20,20);

b= loadImage("img2.png");
image(b,45,-20,600,600) ;


}

