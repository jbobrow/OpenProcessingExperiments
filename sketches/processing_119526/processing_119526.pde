
PFont times;
PFont comic;

float[] numbers = new float[6];
SpriteObject[] images = new SpriteObject[6];
float timer = 0;
float textTimer = 0;
int imageIndex = 0;
int textIndex = 0;
int mode = 0;

String a = "To most people, I seem like";
String b = "        a shy, withdrawn person.";
String c = "          I prefer to listen";
String d = "rather than talk.";
String e = "And no matter what I do,";
String f = "           no matter who I talk to...";
String g = "my social awkwardness";
String h = "               gets the better of me.";
String i = "   My                         show";
String i2 = "faults                     through.";
String j = "I can't";
String k = "be the";
String l = "person that I";
String m = "want";
String n = "to be...";
String o = "But the kind of person";
String p = "       I really am...";
String q = "is someone who wants";
String r = "                to help people!";
String s = "Underneath my lack";
String t = "       of social skills...";
String u = "I have the strength to do";
String v = "             what I need to do.";
String w = "  I                              be a";
String w2 = "can                           person";
String x = "who";
String x2 = "helps";
String y = "people around";
String y2 = "me to";
String z = "smile!";
 
void setup()
{
  size(500, 500);
  
  times = createFont("Blackoak Std", 24);
  comic = createFont("Comic Sans MS", 24);
   
  images[0] = new SpriteObject("red.png");
  images[1] = new SpriteObject("green.png");
  images[2] = new SpriteObject("yellow.png");
  images[3] = new SpriteObject("chivalry.png");
  images[4] = new SpriteObject("caring.png");
  images[5] = new SpriteObject("hands.png");
  
}

 
void draw()
{

  timer += 0.0167;
  textTimer += 0.0167;
  
  fill(0);
  textSize(6);
  textFont(comic);
   
  if (timer > 8)
  {
    timer = 0;
    imageIndex += 1;
  }
  
  if (textTimer > 4)
  {
    textTimer = 0;
    textIndex += 1;
  }
  
  if (imageIndex >= 6)
  {
    imageIndex = 0;
    textIndex = 0;
  }
   
  images[imageIndex].render();
  
  if (textIndex == 0)
  {
    pushMatrix();
    text(a, 20, 80);
    text(b, 30, 120);
    popMatrix();
  }
  
  if (textIndex == 1)
  {
    pushMatrix();
    text(c, 100, 180);
    text(d, 120, 220);
    popMatrix();
  }
  
  if (textIndex == 2)
  {
    pushMatrix();
    text(e, 100, 310);
    text(f, 120, 350);
    popMatrix();
  }
  
  if (textIndex == 3)
  {
    pushMatrix();
    text(g, 50, 400);
    text(h, 70, 440);
    popMatrix();
  }
  
  if (textIndex == 4 || textIndex == 5)
  {
    pushMatrix();
    text(i, 110, 80);
    text(i2, 110, 110);
    text(j, 90, 290);
    text(k, 140, 250);
    text(l, 190, 210);
    text(m, 330, 250);
    text(n, 360, 290);
    popMatrix();
  }
  
  if (textIndex == 6)
  {
    pushMatrix();
    text(o, 20, 80);
    text(p, 30, 120);
    popMatrix();
  }
  
  if (textIndex == 7)
  {    
    pushMatrix();
    text(q, 20, 150);
    text(r, 30, 190);
    popMatrix();
  }
  
  if (textIndex == 8)
  {    
    pushMatrix();
    text(s, 50, 50);
    text(t, 60, 90);
    popMatrix();
  }
  
  if (textIndex == 9)
  {    
    pushMatrix();
    text(u, 130, 60);
    text(v, 140, 100);
    popMatrix();
  }
  
  if (textIndex == 10 || textIndex == 11)
  {
    pushMatrix();
    text(w, 110, 280);
    text(w2, 110, 310);
    text(x, 90, 420);
    text(x2, 140, 450);
    text(y, 180, 480);
    text(y2, 330, 450);
    text(z, 360, 420);
    popMatrix();
  }
   
}
 
 
class SpriteObject
{
  float x = width / 2;
  float y = height / 2;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
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


