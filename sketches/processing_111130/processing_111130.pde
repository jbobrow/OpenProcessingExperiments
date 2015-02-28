
Button button;
Button toggleJokerButton;
Card card;

boolean jokers = true;
static int numDecks;

void setup() {
  size(600, 400);
  button = new Button(100, 325, 150, 75, "Select");
  toggleJokerButton = new Button(100, 100, 60, 70, "Jokers");
  card = null;
}

void draw() {
  background(0);
  button.display();
  toggleJokerButton.display();
  if (card != null) 
    card.display(int(0.6*width), int(0.5*height));
  fill(255);
  text("Decks created: " + numDecks, width-100, 20);
}

void mouseClicked() {
  if (toggleJokerButton.contains(mouseX, mouseY)) {
    if (toggleJokerButton.says("Jokers")) {
      toggleJokerButton.setText("No Jokers");
      jokers = !jokers;
    } 
    else {   
      toggleJokerButton.setText("Jokers");
      jokers = !jokers;
    }
  }
  if (button.contains(mouseX, mouseY)) {
    if (button.says("Select")) {
      Deck deck = new Deck(jokers);
      card = deck.cutForCard();
      button.setText("Reset");
    } 
    else {
      card = null;
      button.setText("Select");
    }
  }
}

class Button {

  private int x, y, w, h;
  private String textB;

  Button(int _x, int _y, int _w, int _h, String _text) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    textB = _text;
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(textB, x, y);
  }

  boolean contains(int _x, int _y) {
    if ( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
      return true;
    else
      return false;
  }

  boolean says(String s) {
    return textB.equals(s) ? true : false;
  }

  void setText(String _t) {
    textB = _t;
  }
}

class Card {
  String suit, value;
  
  Card(String suit, String value) {
    this.suit = suit;
    this.value = value;
  }

  void display(float h, float w) {
    fill(255);
    rect(h, w, 150, 250);
    textAlign(CENTER);
    fill(0);
    text(value, 360, 150);
    text(suit, 360, 250);
  }
}

class Deck {
  private boolean jokers;
  
  Deck()
  {
  }
  
  Deck(boolean jokers) {
    this.jokers = jokers;
  }
  
  Card cutForCard() {
    numDecks++;
    int numSuit;
    if (jokers)
      numSuit = (int) random(1,54);
    else
      numSuit = (int) random(1,52);
    int numValue;
    if (numSuit <=13 )
    {
      numValue = numSuit % 13;
      return new Card("Hearts", cardValue(numValue));
    }
    else if (numSuit >=14 && numSuit <= 26)
    {
      numValue = numSuit % 13;
      return new Card("Diamonds", cardValue(numValue));
    }
    else if (numSuit >=27 && numSuit <= 39)
    {
      numValue = numSuit % 13;
      return new Card("Spades", cardValue(numValue));
    }
    else if (numSuit >=40 && numSuit <= 52)
    {
      numValue = numSuit % 13;
      return new Card("Clovers", cardValue(numValue));
    }
    else
    {
      return new Card("Joker", "");
    }
  }
  
  String cardValue (float _f) {
    if ( _f == 1 )
      return "Ace";
    else if (_f >= 2 && _f <= 10)
      return (int) _f + "";
    else if (_f == 11)
      return "Jack";
    else if (_f == 12)
      return "Queen";
    else
      return "King";
  }
}


