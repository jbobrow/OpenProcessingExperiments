
SpriteObject[] myimage = new SpriteObject[7];
int myimageIndex = 0;
int imageIndex = 0;
float timer = 0;
PImage window;
PImage iris;
int state = 0;

void setup()
{
  size(700, 700);
  
  myimage[0] = new SpriteObject("fallout.jpg");
  myimage[1] = new SpriteObject("zelda.jpg");
  myimage[2] = new SpriteObject("gta.jpg");
  myimage[3] = new SpriteObject("portal.jpg");
  myimage[4] = new SpriteObject("left4dead.jpg");
  myimage[5] = new SpriteObject("bioshock.jpg");
  myimage[6] = new SpriteObject("pokemon.png");
  
  for (int i = 0; i < 7; i += 1)
  {
    myimage[i].x = width / 2;
  }
  for (int i = 0; i < 7; i += 1)
  {
    myimage[i].y = height / 2;
  }
  for (int i = 0; i < 7; i += 1)
  {
    myimage[i].w = width;
  }
  for (int i = 0; i < 7; i += 1)
  {
    myimage[i].h = height;
  }

  window = requestImage("window.jpg");
  iris = requestImage("iris.JPG");
}

void draw()
{
  timer += 0.0167;
  if (state == 0)
  {
    if (timer > 1)
    {
      myimageIndex += 1;
      timer = 0;

    }
    if (myimageIndex >= 7)
    {
      myimageIndex = 0;
    }
    if (myimageIndex < 0)
    {
      myimageIndex = 7;
    }
    
    
    mouseClick();
    myimage[myimageIndex].render();
    gamer();
  }
  
  if (state == 1)
  {
    image(iris, 350, 350, 700, 700);
    dad();
  }
    
  image(window, 650, 650, 100, 100);
  


}

void dad()
{
  pushMatrix();
  fill(0, 0, 255);
  textSize(15);
  text("D", 200, 40);
  text("A", 200, 60);
  text("D", 200, 80);
  text("D", 200, 100);
  text("A", 200, 120);
  text("D", 200, 140);
  
  text("D", 220, 40);
  text("A", 240, 60);
  text("D", 260, 80);
  text("D", 260, 100);
  text("A", 240, 120);
  text("D", 220, 140);
  popMatrix();
  
  pushMatrix();
  textSize(15);
  text("D", 280, 140);
  text("A", 290, 120);
  text("D", 300, 100);
  text("D", 310, 80);
  text("A", 320, 60);
  text("D", 330, 40);
  
  text("D", 330, 40);
  text("A", 340, 60);
  text("D", 350, 80);
  text("D", 360, 100);
  text("A", 370, 120);
  text("D", 380, 140);
  popMatrix(); 
  
  pushMatrix();
  textSize(15);
  text("D", 315, 100);
  text("A", 330, 100);
  text("D", 345, 100);
  popMatrix();
  
  pushMatrix();
  fill(0, 0, 255);
  textSize(15);
  text("D", 410, 40);
  text("A", 410, 60);
  text("D", 410, 80);
  text("D", 410, 100);
  text("A", 410, 120);
  text("D", 410, 140);
  
  text("D", 430, 40);
  text("A", 450, 60);
  text("D", 470, 80);
  text("D", 470, 100);
  text("A", 450, 120);
  text("D", 430, 140);
  popMatrix();
}  

void gamer()
{
    pushMatrix();
    fill(255, 0, 0);
    textSize(15);
    text("AMER", 45, 100);
    text("G", 30, 100);
    text("A", 30, 120);
    text("M", 30, 140);
    text("E", 30, 160);
    text("R", 30, 180);
    text("GAMER", 30, 200);
    popMatrix();
   
    pushMatrix();
    fill(255, 0, 0);
    textSize(10);
    text("GAMER", 60, 170);
    text("G", 100, 170);
    text("A", 100, 180);
    text("M", 100, 190);
    text("E", 100, 200);
    text("R", 100, 210);
    popMatrix();
  
    pushMatrix();
    fill(255, 0, 0);
    textSize(15);
    text("G", 120, 200);
    text("A", 130, 175);
    text("M", 140, 150);
    text("E", 150, 125);
    text("R", 160, 100);
    text("G", 180, 100);
    text("A", 190, 125);
    text("M", 200, 150);
    text("E", 210, 172);
    text("R", 220, 200);
    popMatrix();
  
    pushMatrix();
    fill(255, 0, 0);
    textSize(12);
    text("GAMER", 155, 150);
    popMatrix();
  
    pushMatrix();
    fill(255, 0, 0);
    textSize(15);
    text("G", 240, 100);
    text("A", 240, 125);
    text("M", 240, 150);
    text("E", 240, 175);
    text("R", 240, 200);
    text("G", 320, 100);
    text("A", 320, 125);
    text("M", 320, 150);
    text("E", 320, 175);
    text("R", 320, 200);

    text("A", 250, 110);
    text("M", 260, 125);
    text("E", 270, 140);
    text("R", 280, 155);
    text("E", 290, 140);
    text("M", 300, 125);
    text("A", 310, 110);
    popMatrix();
  
    pushMatrix();
    fill(255, 0, 0);
    textSize(15);
    text("G", 350, 100);
    text("A", 350, 125);
    text("M", 350, 150);
    text("E", 350, 175);
    text("R", 350, 200);
    text("GAMER", 365, 100);
    text("GAMER", 365, 150);
    text("GAMER", 365, 200);
    popMatrix();
  
    pushMatrix();
    fill(255, 0, 0);
    textSize(15);
    text("G", 440, 100);
    text("A", 440, 125);
    text("M", 440, 150);
    text("E", 440, 175);
    text("R", 440, 200);
  
    text("A", 460, 105);
    text("M", 475, 110);
    text("E", 475, 135);
    text("R", 460, 145);
  
    text("G", 460, 160);
    text("A", 470, 170);
    text("M", 480, 180);
    text("E", 490, 190);
    text("R", 500, 200);
    popMatrix();
}
  

void mouseClick() 
  {
    if (mouseX >= 600 && mouseX <= 700) 
    {
      if (mouseY >= 600 && mouseY <= 700) 
      {
        if (mousePressed) 
        {
          state += 1;
        }
      }
    }
  }
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  float rotation = 0.0;
  float s = 1.0;
  boolean loaded = false;
      
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
         
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}





