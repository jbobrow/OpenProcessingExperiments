
PImage bean;
float alpha = 255;
boolean increment = false;

void setup()
{
  size(500,500);
  String url = "http://i.imgur.com/Nv14USB.jpg";
  bean = loadImage(url, "jpg");
}

void draw()
{
  
  if (alpha >= 255)
  {
    increment = false;
  } else if (alpha <= 0)
  {
    increment = true;
  }
  
  if(increment)
  {
    alpha += 5;
  } else {
    alpha -= 5;
  }
  
  
  background(0);
  image(bean, 0, 0);
  
  fill(0, alpha);
  rect(0,0,width,height);
 
}
