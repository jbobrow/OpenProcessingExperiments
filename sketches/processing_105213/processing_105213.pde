
int y = 200;
float x=0;
float pig=0.3;
void setup() {
  size(500, 500);
}
void draw() {
  PImage img = loadImage("images-1.jpeg");
  img.resize(500, 500);
  image(img, 0, 0);
  fill(255, 0, 0);
  ellipse(100, y++, 30, 30);

  fill(0, 0, 0);
  fill(247, 240, 5);
  rect(160, 70, 10, 20);
  fill(43, 118, 26);
  rect(150, 60, 30, 10);
  rect(160, 50, 10, 10);
  rect(350, 60, 30, 10);
  rect(360, 50, 10, 10);
  fill(247, 240, 5);
  rect(360, 70, 10, 20);
x=x-pig;
  fill(242, 127, 2);
  rect(50+x, 360, 10, 10);
  rect(40+x, 350, 10, 10);
  rect(30+x, 340, 10, 10);
  rect(30+x, 350, 10, 10);
  rect(40+x, 340, 10, 10);
  fill(18, 95, 30);
  rect(20+x, 330, 10, 10);
  rect(10+x, 340, 10, 10);
  rect(30+x, 320, 10, 10);
  rect(10, 390, 10, 10);
  rect(10, 380, 10, 10);
  fill(255, 5, 5);
  rect(10, 370, 10, 10);
  rect(10, 360, 10, 10);
  rect(0, 370, 10, 10);
  rect(20, 370, 10, 10);
  textSize(60);
  fill(247, 240, 5);
  rect(0, 400, 500, 100);
  fill(90, 63, 30);
  stroke(90, 63, 30);
  text("Minecraft", 100, 450);
  fill(103, 77, 29);
  rect(420, 470, 10, 10);
  rect(430, 460, 10, 10);
  rect(440, 460, 10, 10);
  rect(430, 450, 10, 10);
  rect(420, 440, 10, 10);
  rect(450, 470, 10, 10);
  fill(35, 116, 152);
  rect(440, 450, 10, 10);
  rect(450, 440, 10, 10);
  rect(460, 430, 10, 10);
  rect(470, 420, 10, 10);
  fill(193, 89, 44);
  rect(200, 300, 100, 100);
  rect(200, 200, 100, 100);
  fill(23, 188, 22);
  stroke(23, 188, 22);
  rect(200, 100, 100, 100);
  rect(300, 100, 100, 100);
  rect(100, 100, 100, 100);
  rect(200, 0, 100, 100);
  if(y<315){
  fill(232, 201, 220);
  stroke(232, 201, 220);
  rect(100+x, 370, 20, 30);
  rect(180+x, 370, 20, 30);
  rect(100+x, 330, 100, 40);
  rect(70+x, 330, 30, 40);
  fill(171, 101, 175);
  rect(60+x, 350, 10, 20); 
  fill(0, 0, 0);
  rect(70+x, 330, 10, 10);
  }else{

    
    fill(232, 0, 0);
  stroke(232, 201, 220);
  rect(100+x--, 370, 20, 30);
  rect(180+x--, 370, 20, 30);
  rect(100+x--, 330, 100, 40);
  rect(70+x--, 330, 30, 40);
  fill(171, 101, 175);
  rect(60+x--, 350, 10, 20); 
  fill(0, 0, 0);
  rect(70+x--, 330, 10, 10);
  }if(y > 400){
    y=900;
  ellipse(100, y, 30, 30);
  fill(232, 201, 220);
  stroke(232, 201, 220);
  rect(100, 370, 20, 30);
  rect(180, 370, 20, 30);
  rect(100, 330, 100, 40);
  rect(70, 330, 30, 40);
  fill(171, 101, 175);
  rect(60, 350, 10, 20); 
  fill(0, 0, 0);
  rect(70, 330, 10, 10);
  }
 // ellipse(100,400,30,30);
}



