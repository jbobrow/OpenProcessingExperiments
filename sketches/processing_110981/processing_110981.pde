
/* @pjs preload="img/back.png, img/blackJoker.png, img/redJoker.png, img/clubs/ace.png, img/clubs/two.png, img/clubs/three.png, img/clubs/four.png, img/clubs/five.png, img/clubs/six.png, img/clubs/seven.png, img/clubs/eight.png, img/clubs/nine.png, img/clubs/ten.png, img/clubs/jack.png, img/clubs/queen.png, img/clubs/king.png, img/hearts/ace.png, img/hearts/two.png, img/hearts/three.png, img/hearts/four.png, img/hearts/five.png, img/hearts/six.png, img/hearts/seven.png, img/hearts/eight.png, img/hearts/nine.png, img/hearts/ten.png, img/hearts/jack.png, img/hearts/queen.png, img/hearts/king.png, img/spades/ace.png, img/spades/two.png, img/spades/three.png, img/spades/four.png, img/spades/five.png, img/spades/six.png, img/spades/seven.png, img/spades/eight.png, img/spades/nine.png, img/spades/ten.png, img/spades/jack.png, img/spades/queen.png, img/spades/king.png, img/diamonds/ace.png, img/diamonds/two.png, img/diamonds/three.png, img/diamonds/four.png, img/diamonds/five.png, img/diamonds/six.png ,img/diamonds/seven.png, img/diamonds/eight.png, img/diamonds/nine.png, img/diamonds/ten.png, img/diamonds/jack.png, img/diamonds/queen.png, img/diamonds/king.png"; */ 

Button button;
Button joker;
Button numDecks;
Card card;
Deck deck;
int numDeck;
PImage cardFace;

void setup() {
  size(600, 400);
  button = new Button(100, 325, 150, 75, "Select");
  joker = new Button(500, 325, 150, 75, "52 Card Deck");
  deck = new Deck(joker.says("52 Card Deck"), 0);
  card = new Card();
}

void draw() {
  background(0);
  button.display();
  joker.display();
  card.display(int(0.6*width), int(0.5*height));
}

void mouseClicked() {
  if (button.contains(mouseX, mouseY)) {
    if (button.says("Select")) {
      numDeck++;
      deck = new Deck(joker.says("52 Card Deck\n with 2 jokers"), numDeck);
      card = deck.cutForCard();
      button.setText("Reset");
    } 
    else {
      card = new Card();
      button.setText("Select");
    }
  }

  if (joker.contains(mouseX, mouseY)) {
    if (joker.says("52 Card Deck")) {
      joker.setText("52 Card Deck\n with 2 jokers");
    } 
    else {
      joker.setText("52 Card Deck");
    }
  }
}

class Button {
  
  private int x,y,w,h;
  private String words;
  
  Button(int _x, int _y, int _w, int _h, String _text) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    words = _text; 
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(words, x, y);
  }
  
  boolean contains(int _x, int _y) {
   if( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
      return true;
    else
      return false;
  }
  
  boolean says(String s) {
    return text.equals(s) ? true : false;
  }
  
  void setText(String _t) {
    words = _t;  
  }
  
}

class Card {

  String suit;
  String rank;
  // random(min,max) max is exclusive, though the +1 to the value
  int randomCard;
  String location;
  
  Card(){
    suit = "Press \"Select\" to cut a card from the deck";
    rank = "";
    location = "img/back.png";
  }
    

  Card(boolean joker) {
    if (joker) {
      randomCard = (int)random(1, 55);
    } 
    else {
      randomCard = (int)random(1, 53);
    }

    if (randomCard <=13) {
      suit=" of Hearts";
      location = "img/hearts";
    }
    if (randomCard >13 && randomCard <=26) {
      suit=" of Clubs";
      location = "img/clubs";
    }
    if (randomCard >26 && randomCard <=39) {
      suit=" of Spades";
      location = "img/spades";
    }
    if (randomCard >39 && randomCard <=52) {
      suit=" of Diamonds";
      location = "img/diamonds";
    }

    switch(randomCard % 13) {
    case 1:
      rank = "Ace";
      location+= "/ace.png";
      break;

    case 2:
      rank = "Two";
      location+= "/two.png";
      break;

    case 3:
      rank = "Three";
      location+= "/three.png";
      break;

    case 4:
      rank = "Four";
      location+= "/four.png";
      break;

    case 5:
      rank = "Five";
      location+= "/five.png";
      break;

    case 6:
      rank ="Six";
      location+= "/six.png";
      break;

    case 7:
      rank ="Seven";
      location+= "/seven.png";
      break;

    case 8:
      rank ="Eight";
      location+= "/eight.png";
      break;

    case 9:
      rank ="Nine";
      location+= "/nine.png";
      break;

    case 10:
      rank ="Ten";
      location+= "/ten.png";
      break;

    case 11:
      rank ="Jack";
      location+= "/jack.png";
      break;

    case 12:
      rank ="Queen";
      location+= "/queen.png";
      break;

    case 0:
      rank ="King";
      location+= "/king.png";
      break;
    }
    if (randomCard == 53) {
      rank = "Red ";
      suit="Joker";
      location= "img/redJoker.png";
    }
    if (randomCard == 54) {
      rank = "Black ";
      suit = "Joker";
      location= "img/blackJoker.png";
    }
  }




  void display (int x, int y)
  {
    fill(255);
    image(loadImage(location),x-43,y-135);
    text(rank+suit+"\n There have been "+deck.decks()+" decks used so far", x, y);
  }
}

class Deck {

  Card cardDrawn;
  boolean hasJokers;
  

  Deck(int numDecks)
  {
    hasJokers = false;  
  }
  
  Deck(boolean jokers,int numDecks)
  {
    hasJokers = jokers;  
  }


  Card cutForCard() {
    cardDrawn = new Card(hasJokers);
   
    return cardDrawn;
  }
  int decks() {
    
    return numDeck;
  }
}



