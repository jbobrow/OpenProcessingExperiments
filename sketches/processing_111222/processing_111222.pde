
Button button;
Card card;

void setup() {
  size(600,400);
  button = new Button(100, 325, 150, 75, "Select");
  card = null;
}

void draw() {
  background(0);
  
  button.display();
  
  if (card != null) {
    card.display(int(0.6*width), int(0.5*height));
  }
  
  fill(255);
  text(this.getDeckCount(), 100, 100);
}

void mouseClicked() {
  if (button.contains(mouseX, mouseY)) {
    if (button.says("Select")) {
      Deck deck = new Deck();
      card = deck.cutForCard();
      button.setText("Reset");
    } else {
      card = null;
      button.setText("Select");
    }
  }
  
}
class Button {

 int x, y, w, h;
 String txt;
  
 public Button(int x, int y, int w, int h, String txt){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.txt = txt;
 } 
 
 public void setText(String txt) {
   this.txt = txt; 
 }
 
 void display(){
  rectMode(CENTER);
  fill(255);
  rect(x, y, w, h);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(24);
  text(this.txt, x, y);
 }
 
 public boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
 
 public boolean says(String txt) {
  return this.txt.toLowerCase().equals(txt.toLowerCase()); 
 }
  
  
}
class Card {
  
 private String suite;
 private String rank;

 public Card(String suite, String rank) {
  this.suite = suite;
  this.rank = rank; 
 }
 
 void display(int x, int y) {
   fill(255);
   rect(x, y, 150, 300);
   fill(0);
   textSize(24);
   text(this.suite, x, y-50);
   text(this.rank, x, y+50);
 }
 
}
import java.util.Random;

static int deckCount = 0;
public static int getDeckCount(){
 return deckCount; 
}

class Deck {

  boolean joker = false;
  
  String A = "A";
  String two = "two";
  String three = "three";
  String four = "four";
  String five = "five";
  String six = "six";
  String seven = "seven";
  String eight = "eight";
  String nine = "nine";
  String ten = "ten";
  String jack = "jack";
  String queen = "queen";
  String king = "king";
  String joke = "joker";

  String hearts = "hearts";
  String diamonds = "diamonds";
  String clubs = "clubs";
  String spades = "spades";
    
   public Deck() {
     deckCount++;
   } 
   
   public Deck(boolean joker) {
     this.joker = joker;
     deckCount++;
   }
   
   public Card cutForCard() {
     String _suite = "";
     String _rank = "";
     int max;
     int min = 1;
     
     // Determine if the deck contains jokers
     if (joker == true) {
      max = 14; 
     } else {
      max = 13; 
     }
     
     // Get random selection for suite and rank
     int r = randInt(min, max);
     int s = randInt(min, 4);
     
     // Determine the suite
     if (s == 1) {
       _suite = hearts;
     } else if (s == 2) {
       _suite = diamonds;
     } else if (s == 3) {
       _suite = clubs;
     } else if (s == 4) {
       _suite = spades;
     }
     
     // Determine the rank
     if (r == 1) {
       _rank = A;
     } else if (r == 2) {
       _rank = two;
     } else if (r == 3) {
       _rank = three;
     } else if (r == 4) {
       _rank = four;
     } else if (r == 5) {
       _rank = five;
     } else if (r == 6) {
       _rank = six;
     } else if (r == 7) {
       _rank = seven;
     } else if (r == 8) {
       _rank = eight;
     } else if (r == 9) {
       _rank = nine;
     } else  if (r == 10) {
       _rank = ten;
     } else if (r == 11) {
       _rank = jack;
     } else if (r == 12) {
       _rank = queen;
     } else if (r == 13) {
       _rank = king;
     } else if (r ==14) {
       _rank = joke;
     }  
    
     return new Card(_suite, _rank);
   }
   
  public int randInt(int min, int max) {
      return (int) random(min, max);
  }
    
}



