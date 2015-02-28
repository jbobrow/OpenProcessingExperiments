
//@pjs preload="spider.jpg;"
class Spyder
{
  PImage image;
  PVector position;
  PVector direction;
  PVector velocity;
  float rotateSpeed;
  float speed;
}
Spyder spider;
int randX = random(0, 200);
int randY = random(0, 200);
int webCycle;
int webXBound;
int webYBound;
float left = 0;
float right = 0;
float down = 0;
float up = 0;
void setup(){
  imageMode(CENTER);
  size(400, 400);
  spider = new Spyder();
  spider.image = loadImage("spider.jpg");
  spider.position = new PVector(200, 150);
  spider.direction = new PVector(0, 1);
  spider.velocity = new PVector(0, 0);
  spider.speed = 3;
  spider.rotateSpeed = .1;
  webCycle = 3;
}
void draw(){
  background(255);
  makeWeb();
  rotate2D(spider.direction, spider.rotateSpeed * (left + right));
  spider.velocity.x = spider.direction.x * (spider.speed * (up + down));
  spider.velocity.y = spider.direction.y * (spider.speed* (up + down));
  spider.position.add(spider.velocity);
  pushMatrix();
  translate(spider.position.x, spider.position.y);
  rotate(spider.direction.heading2D());
  imageMode(CENTER);
  image(spider.image, 0, 0); 
  popMatrix();
  if(right > 0){
    webCycle = 1;
  }
  else if(left < 0){
    webCycle = 2;
}
  else{
    webCycle = 3;
  }
  makePrey(randX, randY, webCycle);
  if(spider.position.x <= webXBound + 10 || spider.position.x <= webXBound - 10){
      if(spider.position.y <= webYBound + 15 || spider.position.y >= webYBound - 15){
        randX = random(0, 200);
        randY = random(0, 200);
      }
  }
  
}
void rotate2D(PVector v, float theta)
{
  float m = v.mag();
  float a = v.heading2D();
  a += theta;
  v.x = m * cos(a);
  v.y = m * sin(a);
}
void keyPressed()
{
    if (keyCode == RIGHT)
    {
      right = 1;
    }
    if (keyCode == LEFT)
    {
      left = -1;
    }
    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN) 
    {
      down = 1;
    }

}
void keyReleased()
{
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN) 
    {
      down = 0;
    }

}
void makeWeb(){
  //Axes
  line(0,400,400,0);
line(0,0,400,400);
line(400,200,0,200);
line(200,400,200,0);
// Inner Webbing
line(185,200,190,190);
line(200,185,190,190);
line(210,190,200,185);
line(215,200,210,190);
line(210,210,215,200);
line(200,215,210,210);
line(200,215,190,210);
line(190,210,185,200);
//
line(170,200,180,180);
line(170,200,180,220);
line(180,220,200,230);
line(200,230,220,220);
line(220,220,230,200);
line(230,200,220,180);
line(220,180,200,170);
line(200,170,180,180);
//
line(150,200,165,165);
line(165,165,200,145);
line(200,145,235,165);
line(235,165,250,200);
line(250,200,235,235);
line(235,235,200,250);
line(200,250,165,235);
line(165,235,150,200);
//
line(130,200,150,150);
line(150,150,200,120);
line(200,120,250,150);
line(250,150,270,200);
line(270,200,250,250);
line(250,250,200,270);
line(200,270,150,250);
line(150,250,130,200);
//
line(110,200,135,135);
line(135,135,200,95);
line(200,95,265,135);
line(265,135,290,200);
line(290,200,265,265);
line(265,265,200,290);
line(200,290,135,265);
line(135,265,110,200);
//
line(200,310,280,280);
line(280,280,310,200);
line(310,200,280,120);
line(280,120,200,70);
line(200,70,120,120);
line(120,120,90,200);
line(90, 200, 120, 280);
line(120, 280, 200, 310);
//
line(70, 200, 105, 105);
line(105, 105, 200, 50);
line(200, 50, 295, 105);
line(295, 105, 330, 200);
line(330, 200, 295, 295);
line(295, 295, 200, 330); 
line(200, 330, 105, 295);
line(105, 295, 70, 200);
//
line(50, 200, 90, 90);
line(90, 90, 200, 30);
line(200, 30, 310, 90); 
line(310, 90, 350, 200);
line(350, 200, 310, 310);
line(310, 310, 200, 350);
line(200, 350, 90, 310);
line(90, 310, 50, 200);
//
line(30, 200, 75, 75);
line(75, 75, 200, 10);
line(200, 10, 325, 75);
line(325, 75, 370, 200);
line(370, 200, 325, 325);
line(325, 325, 200, 370);
line(200, 370, 75, 325);
line(75, 325, 30, 200);
//
line(10, 200, 60, 60);
line(60, 60, 200, -10);
line(200, -10, 340, 60);
line(340, 60, 390, 200);
line(390, 200, 340, 340);
line(340, 340, 200, 390);
line(200, 390, 60, 340);
line(60, 340, 10, 200);
}

void makePrey(int x, int y, int z){
  webYBound = y - 15;
    for(int i = 0; i <= 10; i++){
      ellipse(x, y - 3 * i, 20, 1);
      if (z == 1 && i <= 5){
        x+=2;
       webXBound = x;   
      }
      else if(z == 1 && i >= 5){
        x -= 2;
      }
      if(z == 2 && i <= 5){
        x -= 2;
        webXBound = x;
      }  
      else if(z == 2 && i>= 5){
        x += 2;
      }
    }
  
}



