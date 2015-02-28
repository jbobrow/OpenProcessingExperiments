
ArrayList<Card> deck = new ArrayList<Card>();
int wcard = 50, hcard = 75;
ArrayList<PImage> pics = new ArrayList<PImage>();
ArrayList<PImage> pics2 = new ArrayList<PImage>();


void setup() {
  size(325, 475);
  background(255, 255, 255);
  //deck.add(new Card("A", 25, 75, pics.get(0)));
  //deck.add(new Card("2",100,75,loadImage("2.bmp")));
  pics.add(loadImage("A.bmp"));
  pics.add(loadImage("2.bmp"));
  pics.add(loadImage("3.bmp"));
  pics.add(loadImage("4.bmp"));
  pics.add(loadImage("5.bmp"));
  pics.add(loadImage("6.bmp"));
  pics.add(loadImage("7.bmp"));
  pics.add(loadImage("8.bmp")); 
  
  pics2.add(loadImage("A.bmp"));
  pics2.add(loadImage("2.bmp"));
  pics2.add(loadImage("3.bmp"));
  pics2.add(loadImage("4.bmp"));
  pics2.add(loadImage("5.bmp"));
  pics2.add(loadImage("6.bmp"));
  pics2.add(loadImage("7.bmp"));
  pics2.add(loadImage("8.bmp")); 
  pics = switchOrder(pics);
  pics2 = switchOrder(pics2);
  deck.add(new Card("A", 25, 75, pics.get(0),false));
  deck.add(new Card("2",100,75,pics.get(1),false));
  deck.add(new Card("3",175,75,pics.get(2),false));
  deck.add(new Card("4",250,75,pics.get(3),false));
  deck.add(new Card("5",25,175,pics.get(4),false));
  deck.add(new Card("6",100,175,pics.get(5),false));
  deck.add(new Card("7",175,175,pics.get(6),false));
  deck.add(new Card("8",250,175,pics.get(7),false));
  
  deck.add(new Card("A", 25, 275, pics2.get(0),false));
  deck.add(new Card("2",100,275,pics2.get(1),false));
  deck.add(new Card("3",175,275,pics2.get(2),false));
  deck.add(new Card("4",250,275,pics2.get(3),false));
  deck.add(new Card("5",25,375,pics2.get(4),false));
  deck.add(new Card("6",100,375,pics2.get(5),false));
  deck.add(new Card("7",175,375,pics2.get(6),false));
  deck.add(new Card("8",250,375,pics2.get(7),false));
  
  
}

void draw() {
  //iterate through pics and paint images on screen as a test:
  /*float x = 0; */
  for(int i = 0 ; i < deck.size(); i ++){
    if(deck.get(i).getFliped()==true){
       deck.get(i).render();
    }
  }
  
  
}
public ArrayList<PImage> switchOrder (ArrayList<PImage> picture)
{
  
   ArrayList<PImage> newOne = new ArrayList<PImage>();
   
   while(picture.size()>0){
       int a=(int) random(picture.size());
       newOne.add( picture.get(a));
       picture.remove(a);
   }
   return newOne;
}
void mousePressed()
{
  if (mouseButton == LEFT ) {
     
    for ( int i = 0; i < deck.size() ; i++)
    {
      Card temp = (Card)deck.get(i);
      int x = temp.getX();
      int y = temp.getY();
      int w = temp.getX()+wcard;
      int h = temp.getY()+hcard;
      if ( mouseX >= x && mouseX <= w &&
           mouseY >= y && mouseY <= h) {
             temp.setFliped();
             
             println("flipping over card " + temp);
             
             
         }
    }
  }
} 


public class Card {
  private PImage i;
  private int x, y;
  private String value;
  private boolean fliped;
  
  
  public void render(){
    if(getFliped()==false){
      rect(getX(),getY(),wcard,hcard);
    }else{
      image(i,x,y);
    }
  }
  
  public Card(String v, int xx, int yy, PImage a , boolean f) {
    x = xx;
    y = yy;
    i = a;
    //i.resize(wcard,hcard);
    value = v;
    fliped = f;
    //rect(x,y,wx,wy);
    //
  }
  void setFliped(){
    fliped = !fliped;
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  String getV(){
    return value;
  }
  boolean getFliped(){
    return fliped;
  }
}



