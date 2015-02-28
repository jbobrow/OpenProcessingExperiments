
PImage pic;
boolean filterApplied = false;

void setup()
{
  size(500, 400);
  pic = requestImage("pic.jpg");
}

void draw()
{
  if (pic.width > 0)
  {
    imageMode(CENTER);
    if(filterApplied == false)
    {
      image(pic, width / 2, height / 2, 500, 400);
      filter(POSTERIZE, 6);
    }
  }
  
  float x = 170;
  float y = 100;
  float prevx = x;
  float prevy = y;
  while (x < width)
  {
    x += random(10);
    y += random(-3, 3);
    line(prevx, prevy, x, 0);
    prevx = x;
    prevy = y;
  }
  
  float a = 0;
  float b = 333;
  float preva = a;
  float prevb = b;
  while (a < 80)
  {
    a += random(10);
    b += random(-3, 3);
    line(preva, prevb, a, 260);
    preva = a;
    prevb = b;
  }
  
  float c = 238;
  float d = height;
  float prevc = c;
  float prevd = d;
  while (c < 400)
  {
    c += random(10);
    d += random(-3, 3);
    line(prevc, prevd, c, 347);
    prevc = c;
    prevd = d;
  }
  
  fill(#313ACB);
  triangle(15, 331, 122, 249, 113, 395);
  triangle(122, 249, 113, 395, 230, 312);
  quad(122, 249, 230, 312, 237, 257, 177, 223);
  fill(#1A2086);
  triangle(113, 395, 230, 312, 178, 394);
  
  fill(#5A320C);
  quad(123, 0, 174, 162, 179, 94, 153, 0);
  quad(153, 0, 200, 0, 219, 49, 218, 115);
  fill(#402308);
  quad(153, 0, 218, 115, 205, 150, 179, 94);
  triangle(205, 150, 176, 199, 179, 94);
  
  fill(#7C5D24);
  quad(409, 127, 400, 146, 435, 198, 441, 160);
  quad(469, 227, 437, 337, 470, 361, 492, 314);
  fill(#5A320C);
  quad(435, 198, 441, 160, 469, 227, 459, 270);
  
  
   println("x: " + mouseX + " y: " + mouseY);
}


