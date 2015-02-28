
/*
Draggable objects and handler example for Processing 2.0
Natalie Freed, March 2014

Buttons and user interfaces are from ControlP5 library
at http://www.sojamo.de/libraries/controlP5/

Pictures are taken from online sources at:
heart: http://www.publicdomainpictures.net/pictures/40000/nahled/red-heart-1362916005N5Z.jpg
spade: http://www.spades-cardgame.com/spades/images/bigspade.png
club: http://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/SuitClubs.svg/240px-SuitClubs.svg.png
diamond: http://www.clker.com/cliparts/R/b/c/N/A/N/diamond-cards-hi.png

Dueces Card Game Program by Karen Lo, 2014
*/

import controlP5.*;

PImage hearts;
PImage spades;
PImage clubs;
PImage diamonds;
int suit;
boolean p1;
boolean p2;
boolean p3;
boolean p4;
int playPressed = 0;
int playerPressed = 0;
// Strings that contain text for instructions page

String instructions = 
"First off, there are four suites. Spades > hearts > clubs > diamonds. Then there are values where 2 > A > K > Q > J and so on. The strength of a card is first determined by their value. If two cards have the same value, then the suites determine which one is higher. Hence, 3 of diamonds is the smallest and the player who holds this card gets to start first. The player is allowed to play a single card, a pair, or a poker hand (5 cards). They must play the same number of cards that the first player has played until everyone has passed. The winner of that round would get the choose a new number of cards to play. The goal is to play all your cards."; 

String pokerHands =
"As for the poker hands, there are 5 kinds. The weakest of them is a straight, that is 5 set of cards in sequence. The Dueces, however, are counted before Aces and thus the sequence 2,3,4,5,6 cannot be used. The magnitude of this hand is determined by the largest card in the sequence. The next weakest set is  a flush, that is all five cards must have the same suite. The order does not matter. Again, the magnitude of the hand is determined by the largest card in the set. Then comes the 3-of-a-kind, which is three cards of the same value and any pair. The magnitude of this hand is dependent of the triplet. Next is the 4-of-a-kind, where the player plays four cards of the same value with any other card. Again, the magnitude of this hand is determined on the quadruplet. Finally, the strongest poker hand is the straight flush. The player must have five cards in sequence of the same suite. Like the flush and the straight, the magnitude of the hand is determined by the largest card in the set.";

Deck deck;
Card card;
ControlP5 cp5;
DraggableHandler dHandler;

void setup() {
  size (500, 500);
  background (131, 206, 240);

  deck = new Deck();
  dHandler = new DraggableHandler(this);
  cp5 = new ControlP5(this);

  deck.makeStandardDeck();
  deck.fisherYatesShuffle();
  deck.repositionCards();
  callButtons();

//Loading images for suit
  hearts = loadImage("hearts.png");
  spades = loadImage("spades.png");
  clubs = loadImage("clubs.png");
  diamonds = loadImage("diamonds.png");

//Applying dhandler to all 52 cards
  for (int i=0; i<52; i++) {
    dHandler.addToEnd(deck.cards[i]);
  }

  textAlign(CENTER);
  textSize(50);
  text("Dueces", 150, 250);
}

void draw() {
  smooth();
  if (playPressed == 1) {
    background (131, 206, 240);
    textAlign(CENTER);
    textSize(50);
    text("Dueces", 150, 250);
  }
  if (playerPressed == 1) {
    background (131, 206, 240);
    deck.display();
  }
}

class Deck {
  int numberOfCards = 52;
  int margin = (width-(13*35))/2;

  Deck() {
  }


  Card[] cards = new Card[52];

//This function makes a standard deck of 52 cards with four suits,
//each with 13 values from A to 2.
  void makeStandardDeck() {

    for (int i=0; i<13; i++) {
      int suit = 4;
      cards[i] = new Card(suit, i+1, 35*i+margin, 250);
    }
    for (int i=0; i<13; i++) {
      int suit = 3;
      cards[i+13] = new Card(suit, i+1, 35*i+margin, 300);
    }
    for (int i=0; i<13; i++) {
      int suit = 2;
      cards[i+26] = new Card(suit, i+1, 35*i+margin, 350);
    }
    for (int i=0; i<13; i++) {
      int suit = 1;
      cards[i+39] = new Card(suit, i+1, 35*i+margin, 400);
    }
  }

//This displays the hand of each player. The variable within the
//if statements are booleans that become true when the respective
//button for each player is pressed.
  void display() {
    if (p1) {
      for (int i=0; i<13; i++) {
        cards[i].display();
      }
    } 
    if (p2) {
      for (int i=13; i<26; i++) {
        cards[i].display();
      }
    }
    if (p3) {
      for (int i=26; i<39; i++) {
        cards[i].display();
      }
    } 
    if (p4) {
      for (int i=39; i<52; i++) {
        cards[i].display();
      }
    } 
    else {
    }
  }

//This shuffles the cards with the Fisher-Yates Shuffle, which
//essentially shuffles by swapping the position of the cards.
  void fisherYatesShuffle() {
    int random;
    for (int i=0; i<52; i++) {
      random = int(random(52));
      Card temp = cards[i];
      cards[i] = cards[random];
      cards[random] = temp;
    }
  }

//After shuffling the cards, this function repositions each set of
//13 cards so the center of the screen.
  void repositionCards() {    
    for (int i=0; i<52; i++) {
      cards[i].yPos = 200;
      if (p1) {
        cards[i].xPos = (i)*35+margin;
      } 
      else if (p2) {
        cards[i].xPos = (i-13)*35+margin;
      } 
      else if (p3) {
        cards[i].xPos = (i-26)*35+margin;
      } 
      else if (p4) {
        cards[i].xPos = (i-39)*35+margin;
      }
    }
  }
}

class Card implements Draggable {
  int suit;
  int value;
  int row=1;
  int xPos;
  int yPos;
  PVector center;
  boolean dragged;
  PVector clickOffset; //offset of cursor from center

  Card(int tempSuit, int tempValue, int tempX, int tempY) {
    suit = tempSuit; 
    value = tempValue;
    xPos = tempX;
    yPos = tempY;
    center = new PVector(xPos/2, yPos/2);
  }

  boolean isOver(int x, int y)
  {
    //return true if distance between point and center is smaller than radius
    if (x>xPos && x<xPos+35)
    {
      if (y>yPos && y<yPos+50) {
        return true;
      } 
      else {
        return false;
      }
    }
    else
    {
      return false;
    }
  }


  void update() //move with mouse
  {
    if (dragged)
    {
      if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) //don't let it get away!
      {
        xPos = int(mouseX + clickOffset.x);
        yPos = int(mouseY+ clickOffset.y);
      }
    }
  }

  void setDragged(int fromX, int fromY)
  {
    println("dragging card");
    dragged = true;
    clickOffset = PVector.sub(new PVector(xPos, yPos), new PVector(fromX, fromY));
  }

  void releaseDragged()
  {
    dragged = false;
  }

//This displays the card with its respective suits and values.
  void display() {

    fill(255);
    rect(xPos, yPos, 35, 50, 7);

    if (suit == 4) {
      spades.resize(15, 15);
      image(spades, xPos+20, yPos+1);
    } 
    else if (suit == 3) {
      hearts.resize(12, 12);
      image(hearts, xPos+21, yPos+2);
    } 
    else if (suit == 2) {
      clubs.resize(15, 15);
      image(clubs, xPos+19, yPos+1);
    } 
    else if (suit == 1) {
      diamonds.resize(14, 14);
      image(diamonds, xPos+20, yPos+1);
    }

    textAlign(CENTER);
    textSize(20);

    if (suit%2 != 0) {
      fill(188, 15, 15);
    } 
    else {
      fill(0);
    }

    if (value<11 && value!=1) {
      text(value, xPos+17.5, yPos+35);
    } 
    else if (value == 1) {
      text("A", xPos+17.5, yPos+35);
    }
    else if (value == 11) {
      text("J", xPos+17.5, yPos+35);
    } 
    else if (value == 12) {
      text("Q", xPos+17.5, yPos+35);
    } 
    else if (value == 13) {
      text("K", xPos+17.5, yPos+35);
    }
  }
}

void callButtons() {

  cp5.addButton("back")
    .setPosition(430, 450)
      .setSize(50, 25)
        .hide()
          ;

  cp5.addButton("instructions")
    .setPosition(400, 150)
      .setSize(70, 25)
        ;


  cp5.addButton("play")
    .setPosition(400, 100)
      .setSize(70, 25)
        ;

  cp5.addButton("player1")
    .setPosition(100, height-height/4)
      .setSize(50, 25)
        .hide()
          ;

  cp5.addButton("player2")
    .setPosition(160, height-height/4)
      .setSize(50, 25)
        .hide()
          ;

  cp5.addButton("player3")
    .setPosition(220, height-height/4)
      .setSize(50, 25)
        .hide()
          ;

  cp5.addButton("player4")
    .setPosition(280, height-height/4)
      .setSize(50, 25)
        .hide()
          ;

  cp5.addButton("pokerhands")
    .setPosition(350, 450)
      .setSize(70, 25)
        .hide()
          ;

  cp5.addButton("reshuffle")
    .setPosition(width-width/4, height-height/4)
      .setSize(50, 25)
        .hide()
          ;
} 


public void back() {
  fill(255);
  //background (131, 206, 240);
  textAlign(CENTER);
  textSize(50);
  text("Dueces", 150, 250);
  cp5.getController("instructions").show();
  cp5.getController("play").show();
  cp5.getController("back").hide();
  cp5.getController("reshuffle").hide();
  cp5.getController("player1").hide();
  cp5.getController("player2").hide();
  cp5.getController("player3").hide();
  cp5.getController("player4").hide();
  cp5.getController("pokerhands").hide();
  playPressed = 1;
  playerPressed = 0;
}

public void instructions() {
  background (131, 206, 240);
  textAlign(LEFT);
  textSize(18);
  text(instructions, 20, 20, 480, 450);
  cp5.getController("instructions").hide();
  cp5.getController("play").hide();
  cp5.getController("back").show();
  cp5.getController("reshuffle").hide();
  cp5.getController("pokerhands").show();
  playPressed = 0;
}

public void play() {
  background (131, 206, 240);
  cp5.getController("back").show();
  cp5.getController("instructions").hide();
  cp5.getController("play").hide();
  cp5.getController("reshuffle").show();
  cp5.getController("player1").show();
  cp5.getController("player2").show();
  cp5.getController("player3").show();
  cp5.getController("player4").show();
  playPressed = 0;
}

public void player1() {
  background (131, 206, 240);
  p1 = true;
  p2 = false;
  p3 = false;
  p4 = false;
  deck.repositionCards();
  playerPressed = 1;
}

public void player2() {
  background (131, 206, 240);
  p1 = false;
  p2 = true;
  p3 = false;
  p4 = false;
  deck.repositionCards();
  playerPressed = 1;
}

public void player3() {
  background (131, 206, 240);
  p1 = false;
  p2 = false;
  p3 = false;
  p4 = true;
  deck.repositionCards();
  playerPressed = 1;
}

public void player4() {
  background (131, 206, 240);
  p1 = false;
  p2 = false;
  p3 = true;
  p4 = false;
  deck.repositionCards();
  playerPressed = 1;
}

public void pokerhands() {
  background (131, 206, 240);
  textAlign(LEFT);
  textSize(16);
  text(pokerHands, 20, 15, 480, 450);
  cp5.getController("instructions").hide();
  cp5.getController("play").hide();
  cp5.getController("back").show();
  cp5.getController("reshuffle").hide();
}

public void reshuffle() {
  background (131, 206, 240);
  deck.fisherYatesShuffle();
  deck.repositionCards();
}

interface Draggable
{
  void update();
  void display();
  void setDragged(int fromX, int fromY);
  void releaseDragged();
  boolean isOver(int x, int y);
}

public class DraggableHandler
{
  ArrayList<Draggable> draggables;
  Draggable currentDragged;
 
  DraggableHandler(PApplet app)
  {
    draggables = new ArrayList<Draggable>();
    currentDragged = null;
    app.registerMethod("draw", this);
    app.registerMethod("mouseEvent", this);
  }
 
  void addToEnd(Draggable d)
  {
    draggables.add(d);
  }
 
  void addToFront(Draggable d)
  {
    draggables.add(0, d); //add to index 0, shift all others
  }
 
  void remove(Draggable d)
  {
    draggables.remove(d);
  }
 
  void display()
  {
    for (int i=draggables.size()-1;i>=0;i--) //draw backwards so first will be on top
    {
      draggables.get(i).display();
    }
  }
 
  public void draw() //this draw is automatically called at the end of each draw()
  {
    for (int i=0;i<draggables.size();i++)
    {
      draggables.get(i).update();
    }
  }
 
  public void mouseEvent(MouseEvent event)
  {
    int x = event.getX();
    int y = event.getY();
 
    switch (event.getAction()) {
    case MouseEvent.PRESS:
      // choose top draggable to drag if clicked on
      if (currentDragged == null)
      {
        for (int i=0;i<draggables.size();i++)
        {
          if (draggables.get(i).isOver(x, y))
          {
            currentDragged = draggables.get(i);
            currentDragged.setDragged(x, y);
            break;
          }
        }
      }
      break;
    case MouseEvent.RELEASE:
      // release any dragged objects
      if (currentDragged != null)
      {
        currentDragged.releaseDragged();
        currentDragged = null;
      }
      break;
    case MouseEvent.CLICK:
      // 
      break;
    case MouseEvent.DRAG:
      // 
      break;
    case MouseEvent.MOVE:
      // 
      break;
    }
  }
}



