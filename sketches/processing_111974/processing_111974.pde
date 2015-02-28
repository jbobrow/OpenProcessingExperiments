
Button button;
Button jokersButton;
Card card;
boolean jokers = false;
  
void setup() {
  size(600,400);
  button = new Button(100, 325, 150, 75, "Select");
  jokersButton = new Button(100, 225, 150, 75, "Jokers Off");
  card = null;
}
  
void draw() {
  background(0);
  button.display();
  jokersButton.display();
  fill(255);
  text("Number of decks created: " + getNumDecksCreated() + "",120,50);
  if (card != null)
    card.display(int(0.6*width), int(0.5*height));
}
  
void mouseClicked() {
    
    
  if (jokersButton.contains(mouseX, mouseY)) {
    if (jokersButton.says("Jokers Off")) {
        
      jokersButton.setText("Jokers On");
      jokers = !jokers;
    } else {
      jokersButton.setText("Jokers Off");
      jokers = !jokers;
    }
  }
    
  if (button.contains(mouseX, mouseY)) {
    if (button.says("Select")) {
      Deck deck = new Deck(jokers);
      card = deck.cutForCard();
      button.setText("Reset");
    } else {
      card = null;
      button.setText("Select");
    }
  }
    
}
class Button {
  
 private int x, y, w, h;
 private String buttonText;
  
 Button(int _x, int _y, int _w, int _h, String _text) {
   x = _x;
   y = _y;
   w = _w;
   h = _h;
   buttonText = _text;
 }
  
 void display() {
   fill(255);
   rectMode(CENTER);
   rect(x, y, w, h);
   stroke(0);
   fill(0);
   textAlign(CENTER, CENTER);
   text(buttonText, x, y);
 }
  
 boolean contains(int _x, int _y) {
   if ( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
     return true;
   else
     return false;
 }
  
 boolean says(String s) {
   return buttonText.equals(s) ? true : false;
 }
  
 void setText(String _t) {
   buttonText = _t;
 }
}
class Card{

private String suit;
private String value;

public Card(String suit, String value)
{
  this.suit = suit;
  this.value = value;
}

void display(int x, int y)
{
  fill(255);
  rectMode(CENTER);
  rect(x,y,300,400);  //background
  
  fill(0);
  textAlign(CENTER,CENTER);
  text(value,x,y);
  text(suit,x,y+20);
}

}
private static int numDecksCreated = 0;
public static int getNumDecksCreated()
  {
    return numDecksCreated;
  }
class Deck
{
  private boolean hasJokers = false;
  //static int numDecksCreated = 0;
    
  public Deck()
  {
    numDecksCreated++;
  }
    
  public Deck(boolean hasJokers)
  {
    this.hasJokers = hasJokers;
    numDecksCreated++;
  }
  
  Card cutForCard()
  {
    String cardSuit = "";
    String cardValue = "";
    int rng;  //random number god
    int rngMod;
    if(hasJokers=true)
    {
      rng = int(random(1,54));
    }
    else
    {
      rng = int(random(1,52));
    }
    
    if (rng < 14)
    {
      cardSuit = "Spades";
    }
    else if (rng < 27)
    {
      cardSuit = "Clubs";
    }
    else if (rng < 40)
    {
      cardSuit = "Hearts";
    }
    else if (rng < 53)
    {
      cardSuit = "Diamonds";
    }
    else
    {
      return new Card("","Joker");
    }
    if (rng%13==0)
    {
      cardValue = "Ace";
    }
    else if (rng%13==12)
    {
      cardValue="King";
    }
    else if (rng%13==11)
    {
      cardValue="Queen";
    }
    else if (rng%13==10)
    {
      cardValue="Jack";
    }
    else
    {
      cardValue=rng%13+1 + "";
    }
    
    return new Card(cardSuit, cardValue);
  }
  
}


