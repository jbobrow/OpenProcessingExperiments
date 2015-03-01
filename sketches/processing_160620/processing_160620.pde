
PImage photo;
PImage photo2;
PImage photo3;
PImage photo4;
float speed = 4.0;
float move;
void setup() 
{
  size(500, 500);
  photo = loadImage("https://lh6.googleusercontent.com/-M4fxTDixl30/AAAAAAAAAAI/AAAAAAAAABA/GUVFc7t8ZHQ/photo.jpg");
  photo2 = loadImage("http://img2.wikia.nocookie.net/__cb20081018163305/zelda/images/8/8e/Link_Wind_Waker_7.png")
  photo3 = loadImage("http://www.zeldawiki.org/images/2/22/Link_Laugh.png")
  photo4 = loadImage("http://static.tumblr.com/3bf2179991f1c2111f55fb46bc5cec2a/qziyvtd/aR3n2zcgu/tumblr_static_zelda_symbol1_2.png") 
  }


{
 size(500,500);
 background(255,84,0);
 noStroke();
 frameRate(10);
 }
void draw() {
move=move+speed
fill(235, 235, 0);
triangle(250, 50, 10, 450, 500, 450);
fill(0, 0, 0);
triangle(250, 450, 130, 250, 375, 250);
image(photo, 210, 100, 100, 100);
image(photo2, 320, 330, 100, 100);
image(photo3, 70, 330, 100, 100);
image(photo4, 175, 250, 150, 150);
if (move > 4);{
move=0}
}
