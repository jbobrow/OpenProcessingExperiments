
// Jeff Chien
// DESMA 28 Interactivity Workshop 5
// Images credit to:
// http://www.flickr.com/photos/preef/108059315/
// http://www.flickr.com/photos/music_embassy/7179436424/in/photostream/
// http://www.flickr.com/photos/azriadnan/1818312422/in/photostream/
// Font credit to:
// http://openfontlibrary.org/en/font/gnutypewriter

// I really wanted an enum...
public class RPSHand
{
  final int index;
  final PImage img;
  private RPSHand(int index, String imgPath)
  {
    this.index = index;
    this.img = loadImage(imgPath);
  }
  public float scale(RPSHand other)
  {
    if(index == other.index)
      return(random(0.1f, 0.15f));
    else if((index + 1) % 3 == other.index)
      return(random(0.05f, 0.08f));
    else
      return(random(0.3f, 0.4f));
  }
}

RPSHand[] hands = new RPSHand[3];

void setup() {
  size(600, 300);
  smooth();
  frameRate(1);
  imageMode(CENTER);
  hands[0] = new RPSHand(0, "rock.png");
  hands[1] = new RPSHand(1, "paper.png");
  hands[2] = new RPSHand(2, "scissor.png");
}
 
void draw() {
  background(0);
  
  float x0, y0, x1, y1, s0, s1;
  int h0 = (int)random(3);
  int h1 = (int)random(3);
  do
  {
    x0 = random(width);
    y0 = random(height);
    x1 = random(width);
    y1 = random(height);
    s0 = hands[h0].scale(hands[h1]);
    s1 = hands[h1].scale(hands[h0]);
  }
  while(dist(x0, y0, x1, y1) < (s0 + s1) * 500);
  
  pushMatrix();
  translate(x0, y0);
  scale(s0);
  rotate(atan2(y1 - y0, x1 - x0));
  fill(200, 0, 0);
  rect(-550, -550, 1100, 1100);
  image(hands[h0].img, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(x1, y1);
  scale(s1);
  rotate(atan2(y0 - y1, x0 - x1));
  fill(0, 0, 200);
  rect(-550, -550, 1100, 1100);
  image(hands[h1].img, 0, 0);
  popMatrix();
}

