
int currentPosition = 0;
PImage [] images;
Maxim maxim;
AudioPlayer player;


void setup()
{
  images = loadImages("Animation_data/Frame", ".jpg", 20);
  size(1080, 1080);
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("test.wav");
  player.setLooping(true);
  player.volume(0.4);
  rectMode(CENTER);

}

void draw()
{
  image(images[currentPosition], 300, 300);
  currentPosition += 1;
  if (currentPosition >= images.length)
  {
    currentPosition = 0;
  }
}

void mouseDragged()
{
  player.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  line(pmouseX, pmouseY,mouseX, mouseY);
  brush(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
}

void brush(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}

PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


