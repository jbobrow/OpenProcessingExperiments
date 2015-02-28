
ArrayList<Card> deck = new ArrayList<Card>();
int wcard = 50, hcard = 75;
ArrayList<PImage> pics = new ArrayList<PImage>();
ArrayList<PImage> pics2 = new ArrayList<PImage>();
boolean state = true;
int time = 900;
int t, tmin, tsec, tlimit = 60;
int count = 0;
Card c1, c2;
int match = 0;
float timeLeft = 60.0;


void setup() {
  size(325, 475);
  background(255, 255, 255);
  frameRate(100);


  //deck.add(new Card("A", 25, 75, pics.get(0)));
  //deck.add(new Card("2",100,75,loadImage("2.bmp")));
  PImage ima1 = loadImage("A.bmp");
  PImage ima2 = loadImage("2.bmp");
  PImage ima3 = loadImage("3.bmp");
  PImage ima4 = loadImage("4.bmp");
  PImage ima5 = loadImage("5.bmp");
  PImage ima6 = loadImage("6.bmp");
  PImage ima7 = loadImage("7.bmp");
  PImage ima8 = loadImage("8.bmp");

  pics.add(ima1);
  pics.add(ima2);
  pics.add(ima3);
  pics.add(ima4);
  pics.add(ima5);
  pics.add(ima6);
  pics.add(ima7);
  pics.add(ima8);

  pics2.add(ima1);
  pics2.add(ima2);
  pics2.add(ima3);
  pics2.add(ima4);
  pics2.add(ima5);
  pics2.add(ima6);
  pics2.add(ima7);
  pics2.add(ima8);
  pics = switchOrder(pics);
  pics2 = switchOrder(pics2);
  deck.add(new Card( 25, 75, pics.get(0), false));

  deck.add(new Card( 100, 75, pics.get(1), false));
  deck.add(new Card( 175, 75, pics.get(2), false));
  deck.add(new Card( 250, 75, pics.get(3), false));
  deck.add(new Card( 25, 175, pics.get(4), false));
  deck.add(new Card( 100, 175, pics.get(5), false));
  deck.add(new Card( 175, 175, pics.get(6), false));
  deck.add(new Card( 250, 175, pics.get(7), false));

  deck.add(new Card( 25, 275, pics2.get(0), false));
  deck.add(new Card( 100, 275, pics2.get(1), false));
  deck.add(new Card( 175, 275, pics2.get(2), false));
  deck.add(new Card( 250, 275, pics2.get(3), false));
  deck.add(new Card( 25, 375, pics2.get(4), false));
  deck.add(new Card( 100, 375, pics2.get(5), false));
  deck.add(new Card( 175, 375, pics2.get(6), false));
  deck.add(new Card( 250, 375, pics2.get(7), false));
}

void draw() {
  //iterate through pics and paint images on screen as a test:
  /*float x = 0; */

  fill(255);
  rect(25, 10, 180, 55);
  //put text of time left inside the rectangle
  fill(0);
  //t = tlimit *1000 - millis();
  timeLeft -= .01;
  // 60 stands for seconds in a minute, 1000 stands for milliseconds in a second
  count = (int) Math.round( timeLeft);


  textSize(20);
  text("Time: "+ count, 30, 35);
  /* if(c1.getPic() != c2.getPic()){
   c1.setFliped();
   c2.setFliped();
   }*/
  if (timeLeft <= 0) {
    textSize(20);
    text("Game Over!", 150, 35);
    noLoop();
  }
  if (match == 8) {
    textSize(20);
    text("You Win", 230, 35);
    noLoop();
  }



  if (state == true) {

    PImage ima = loadImage("back.jpg");
    image(ima, 25, 75);
    image(ima, 100, 75);
    image(ima, 175, 75);
    image(ima, 250, 75);
    image(ima, 25, 175);
    image(ima, 100, 175);
    image(ima, 175, 175);
    image(ima, 250, 175);
    image(ima, 25, 275);
    image(ima, 100, 275);
    image(ima, 175, 275);
    image(ima, 250, 275);
    image(ima, 25, 375);
    image(ima, 100, 375);
    image(ima, 175, 375);
    image(ima, 250, 375);
  }
  for (int i = 0; i<deck.size();i++) {
    if (deck.get(i).getFliped()==true) {
      deck.get(i).render();
    }
  }
}

public ArrayList<PImage> switchOrder (ArrayList<PImage> picture)
{

  ArrayList<PImage> newOne = new ArrayList<PImage>();

  while (picture.size ()>0) {
    int a=(int) random(picture.size());
    newOne.add( picture.get(a));
    picture.remove(a);
  }
  return newOne;
}
void mousePressed()
{
  println(match);
  if (mouseButton != LEFT ) return;

  for ( int i = 0; i < deck.size() ; i++)
  {
    Card temp = (Card)deck.get(i);
    int x = temp.getX();
    int y = temp.getY();
    int w = temp.getX()+wcard;
    int h = temp.getY()+hcard;
    if ( mouseX >= x && mouseX <= w &&
      mouseY >= y && mouseY <= h) {


      if (c1 == null) {
        c1 = temp;
        c1.setFliped();
      } 
      else if (c2 == null) {
        c2 = temp;
        c2.setFliped();
      }
      else if (c1.getPic() != c2.getPic()) {
        c1.setFliped();
        c2.setFliped();
        c1 = null;
        c2 = null;
      }
    } //done checking through cards

    //check for match if 2 cards selected
    if (c1!= null && c2 != null) {
      if (c1.getPic() == c2.getPic()) {

        if (c1.getX( )== c2.getX()&& c1.getY()==c2.getY()) {
          c1.setFliped();
          c2.setFliped();
          c1 = null;
          c2 = null;
        }

        else {
          removeCard(c1);
          image(c2.getPic(), c2.getX(), c2.getY());
          removeCard(c2);
          c1 = null;
          c2 = null;
          match++;
        }
      }
    }
  }
}


void removeCard(Card ka) {
  for ( int i = 0; i < deck.size() ; i++)
  {
    Card temp = (Card)deck.get(i);
    int x = temp.getX();
    int y = temp.getY();

    if (ka.getX() == x && ka.getY() == y) {
      deck.remove(i);
    }
  }
}

public class Card {
  private PImage i;
  private int x, y;
  private String value;
  private boolean fliped;

  public Card(int xx, int yy, PImage a, boolean f) {
    x = xx;
    y = yy;
    i = a;
    //i.resize(wcard,hcard);

    fliped = f;
    //rect(x,y,wx,wy);
    //
  }
  void setFliped() {
    fliped = !fliped;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }

  boolean getFliped() {
    return fliped;
  }
  PImage getPic() {
    return i;
  }
  public void render() {

    image(i, x, y);
  }
}


