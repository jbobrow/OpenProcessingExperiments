
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
 
 Deuces Card Game Program by Karen Lo, 2014
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
boolean kyletan; 
//a boolean variable for determining whether the starting index
// was greater than 12 or not.
int playPressed = 0;
int playerPressed = 0;

Deck deck;
Card card;
ControlP5 cp5;
DraggableHandler dHandler;

Card[] handP1 = new Card[13];
Card[] handP2 = new Card[13];
Card[] handP3 = new Card[13];
Card[] handP4 = new Card[13];

void setup() {
  size (500, 500);
  background (131, 206, 240);

  deck = new Deck();
  dHandler = new DraggableHandler(this);
  cp5 = new ControlP5(this);

  deck.makeStandardDeck();
  deck.fisherYatesShuffle();
  deck.repositionCards();
  deck.makePlayerHands(handP1, handP2, handP3, handP4);
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
  text("Deuces", 150, 250);
}

void draw() {
  smooth();
  if (playPressed == 1) {
    background (131, 206, 240);
    textAlign(CENTER);
    textSize(50);
    text("Deuces", 150, 250);
  }
  if (playerPressed == 1) {
    background (131, 206, 240);
    deck.display();
  }
}

/* The insert function is for determining where the card pressed will
be inserted into in a new array. Then it will return that new array. */

Card[] insert(Card[] cards, Card startingCard, int endingIndex) {
  Card[] newCards = new Card[cards.length];
  int startingIndex = -1;

  for (int i=0; i<cards.length; i++) {
    if (cards[i] == startingCard) {
      startingIndex = i;
    }
  }

  if (startingIndex != -1) {
    if (startingIndex < endingIndex) {
    } // if the startingIndex is less than the endingIndex, then...
    for (int i=0; i<cards.length; i++) {
      if (i<startingIndex) {
        newCards[i] = cards[i];
      } //the cards remain the same if i is before the startingIndex
      if (i>=startingIndex && i<endingIndex) {
        newCards[i] = cards[i+1];
      } 
/*if the cards are after or is at the startingIndex and before the
endingIndex, then those cards are shifted down 1 spot in the array*/
      if (i==endingIndex) {
        newCards[i] = cards[startingIndex];
      } //if i is at the endingIndex, then place the card there
      if (i>endingIndex) {
        newCards[i] = cards[i];
      } // the cards remain the same after the endingIndex
    }
    

    if (startingIndex > endingIndex) {
      // if startingIndex is after the endingIndex in the array
      for (int i=0; i<cards.length; i++) {
        if (i<endingIndex) {
          newCards[i] = cards[i];
        } // the cards before the endingIndex remain the same
        if (i == endingIndex) {
          newCards[i] = cards[startingIndex];
        } // the card is inserted into where i is at the endingIndex
        if (i>endingIndex && i<=startingIndex) {
          newCards[i] = cards[i-1];
        }
/* the cards between the endingIndex and the startingIndex are
  all shifted up 1 in the array */
        if (i>startingIndex) {
          newCards[i] = cards[i];
        } // the cards after the startingIndex remain the same
      }
    }

    if (endingIndex == startingIndex) {
      for (int i=0; i<cards.length; i++) {
        newCards[i] = cards[i];
      }
/* if the endingIndex is the same as the startingIndex, meaning the
  card was placed into the same position it originally was in, then
  all the cards remain the same */
    }
  }

  return newCards;
}

//All Buttons used are listed below in alphabetical order

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
  text("Deuces", 150, 250);
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
  cp5.getController("pokerhands").hide();
}

public void reshuffle() {
  background (131, 206, 240);
  deck.fisherYatesShuffle();
  deck.repositionCards();
  deck.makePlayerHands(handP1, handP2, handP3, handP4);
}

class Card implements Draggable {
  int suit;
  int value;
  int row=1;
  int xPos;
  int yPos;
  int margin = (width-(13*35))/2;
  float barXPos;
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
    int cardsInHand = 13;
    float var = map(mouseX, 0, width, 0, cardsInHand);
    int x = int(var);
    if (var>12) {
      kyletan = true;
    } 
    else {
      kyletan = false;
    }

    barXPos = 35*x+margin;

    if (dragged)
    { 
      if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) //don't let it get away!
      {
        xPos = int(mouseX + clickOffset.x);
        yPos = int(mouseY+ clickOffset.y);
      }
      fill(0);
      rect(barXPos, 195, 3, 60);
    }
  }

  void setDragged(int fromX, int fromY)
  {
    println("dragging card");
    dragged = true;
    clickOffset = PVector.sub(new PVector(xPos, yPos), new PVector(fromX, fromY));
  }

  void releaseDragged(Draggable releasedCard)
  {
    dragged = false;

    if (kyletan == true) { //if var is <12
      if (p1) {
        handP1 = insert(handP1, (Card) releasedCard, 12);
        print("barXPos: " + int(barXPos/35) + ". Array: ");
        for (int i=0; i<handP1.length; i++) {
          print(handP1[i].value + " ");
        }
      }
      if (p2) {
        handP2 = insert(handP2, (Card) releasedCard, 12);
      }
      if (p3) {
        handP3 = insert(handP3, (Card) releasedCard, 12);
      }
      if (p4) {
        handP4 = insert(handP4, (Card) releasedCard, 12);
      }
      deck.repositionHands();
    } 
/* Essentially, if the cursor ends on a position greater than 12,
  then this function will simply assume that the endingIndex is 12 */
    else {
      if (p1) {
        handP1 = insert(handP1, (Card) releasedCard, int(barXPos/35));
        print("barXPos: " + int(barXPos/35) + ". Array: ");
        for (int i=0; i<handP1.length; i++) {
          print(handP1[i].value + " ");
        }
      }
      if (p2) {
        handP2 = insert(handP2, (Card) releasedCard, int(barXPos/35));
      }
      if (p3) {
        handP3 = insert(handP3, (Card) releasedCard, int(barXPos/35));
      }
      if (p4) {
        handP4 = insert(handP4, (Card) releasedCard, int(barXPos/35));
      }
      deck.repositionHands();
    }
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

  void makePlayerHands(Card[] handP1, Card[] handP2, Card[] handP3, Card[] handP4) {
    for (int i=0; i<13; i++) {
      handP1[i] = cards[i];
      handP2[i] = cards[i+13];
      handP3[i] = cards[i+26];
      handP4[i] = cards[i+39];
    }
  }

  //This displays the hand of each player. The variable within the
  //if statements are booleans that become true when the respective
  //button for each player is pressed.
  void display() {
    if (p1) {
      for (int i=0; i<13; i++) {
        handP1[i].display();
      }
    } 
    if (p2) {
      for (int i=0; i<13; i++) {
        handP2[i].display();
      }
    }
    if (p3) {
      for (int i=0; i<13; i++) {
        handP3[i].display();
      }
    } 
    if (p4) {
      for (int i=0; i<13; i++) {
        handP4[i].display();
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

  void repositionHands() {
    if (p1) {
      for (int i=0; i<handP1.length; i++) {
        handP1[i].xPos = (i)*35+margin;
        handP1[i].yPos = 200;
      }
    }
    if (p2) {
      for (int i=0; i<handP2.length; i++) {
        handP2[i].xPos = (i)*35+margin;
        handP2[i].yPos = 200;
      }
    }
    if (p3) {
      for (int i=0; i<handP3.length; i++) {
        handP3[i].xPos = (i)*35+margin;
        handP3[i].yPos = 200;
      }
    }
    if (p4) {
      for (int i=0; i<handP4.length; i++) {
        handP4[i].xPos = (i)*35+margin;
        handP4[i].yPos = 200;
      }
    }
  }
}


// Draggable Interface with Draggable Handler Class

interface Draggable
{
  void update();
  void display();
  void setDragged(int fromX, int fromY);
  void releaseDragged(Draggable d);
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
        currentDragged.releaseDragged(currentDragged);
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

