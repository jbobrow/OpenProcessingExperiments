
Card[] card = new Card[50]; // Create array of card objects
Integer[] symbols = {11, 12, 21, 22, 31, 32, 41, 42, 51, 52, 61, 62}; // Use numbers to represent faces of cards
//"Red_Color", "Red_Text", "Green_Color", "Green_Text", "Blue_Color", "Blue_Text", "Yellow_Color", "Yellow_Text", "Orange_Color", "Orange_Text", "Pink_Color", "Pink_Text"

int cardWidth = 150, cardHeight = 150, cardTextSize = (cardWidth / 5);
int leftMargin = 20, topMargin = 20, cardSpacing = 10, rightMargin = leftMargin + (cardWidth * 4) + (cardSpacing * 4); // Used for formatting how cards are displayed
int tempXpos = leftMargin, tempYpos = topMargin; // Temporary variables used to build/draw cards

int cardNum = 0; // Counter to keep track of which card object is being created
int numSelectedCards = 0; // Used to allow only two cards to be displayed at once
int firstCard, firstCardSymbol, secondCard, secondCardSymbol; // Used to check if a match has been found
int numMoves = 0; // Keep track of how many moves the player has made

void setup() {
  size(800, 600);
  background(255);

  textFont(createFont("ComicSansMS-Bold-48", cardTextSize));

  Collections.shuffle(Arrays.asList(symbols)); // Shuffle array elements

  // Draw cards to screen
  for (int row=0;row<3;row++) {
    for (int col=0;col<4;col++) {
      card[cardNum] = new Card();
      card[cardNum].createCard(symbols[cardNum]); // Assign each card a symbol
      cardNum++;
    }

    // Move to next row
    tempXpos = leftMargin;
    tempYpos += (cardHeight + cardSpacing);
  }
}

void draw() {
  noStroke();
  fill(255);
  rect(rightMargin,0,200,200);

  fill(0);
  textAlign(LEFT);
  text("Moves: " + numMoves, rightMargin, topMargin + (cardHeight * 0.2));
  stroke(0);
}

void mousePressed() {
  int clickXpos = mouseX, clickYpos = mouseY; // Get co-ords of mouse click

  // If two cards are already revealed, loop through all cards and hide any unpaired cards
  if (numSelectedCards >= 2) {
    for (int i=0;i<cardNum;i++) {
      card[i].setSelected(false);
      card[i].drawCard();
    }
    numSelectedCards = 0;
  }
  else {
    int cardXposStart, cardXposEnd, cardYposStart, cardYposEnd; // Used to store co-ords of edges of the cards

    // Loop through each card, finding its clickable area (to check if mouse click is inside its area)
    for (int i=0;i<cardNum;i++) {
      // Only check cards that have not yet been matched
      if (card[i].getPaired() == false) {
        cardXposStart = card[i].getXpos(); // Get x pos of origin of card
        cardXposEnd = card[i].getXedge(); // Get horizontal edge of card
        cardYposStart = card[i].getYpos(); // Get y pos of origin of card
        cardYposEnd = card[i].getYedge(); // Get vertical edge of card

        // Check if mouse click is within card area
        if ((clickXpos > cardXposStart && clickXpos < cardXposEnd) &&
          (clickYpos > cardYposStart && clickYpos < cardYposEnd)) {

          // Only allow click if card is still hidden
          if (card[i].getSelected() == false) {
            // If click is within a card, redraw the card to show its colour
            card[i].setSelected(true);
            card[i].drawCard();
            numSelectedCards++; // Record that a card has been selected
            numMoves++;

            // Exploit integer division to extract first digit and detect matched cards 
            if (numSelectedCards == 1) {
              // Record card number and card symbol of first card clicked
              firstCard = i;
              firstCardSymbol = (card[i].getSymbol())/10;
            }
            else if (numSelectedCards == 2) {
              // Record card number and card symbol of second card clicked
              secondCard = i;
              secondCardSymbol = (card[i].getSymbol())/10;

              // If symbols match
              if (firstCardSymbol == secondCardSymbol) {
                // Record in card objects that they have been paired
                card[firstCard].setPaired(true);
                card[secondCard].setPaired(true);
              }
            }
          }
        }
      }
    }
  }
}

class Card
{
  int symbol, cardXpos, cardYpos, cardXedge, cardYedge;
  boolean selected, paired;

  Card() {
    selected = false;
    paired = false;
  }

  void createCard(int tempSymbol) {
    symbol = tempSymbol;
    cardXpos = tempXpos;
    cardXedge = cardXpos + cardWidth;
    cardYpos = tempYpos;
    cardYedge = cardYpos + cardHeight;

    fill(0);
    rect(tempXpos, tempYpos, cardWidth, cardHeight);
    tempXpos += (cardWidth + cardSpacing); // Change x pos ready for next card to be drawn
  }

  //********** Accessor methods **********//
  int getXpos() {
    return cardXpos;
  }

  int getYpos() {
    return cardYpos;
  }

  int getXedge() {
    return cardXedge;
  }

  int getYedge() {
    return cardYedge;
  }

  boolean getSelected() {
    return selected;
  }

  boolean getPaired() {
    return paired;
  }

  int getSymbol() {
    return symbol;
  }
  //**************************************//

  //********** Mutator methods **********//
  void setSelected(boolean select) {
    selected = select;
  }

  void setPaired(boolean pair) {
    paired = pair;
  }
  //*************************************//

  void drawCard() {
    String cardText = "";
    if (paired == false) { // Only redraw cards that have not been already matched
      if (selected == true) {
        // Choose correct fill depending on the card's assigned colour
        switch(symbol) {
        case 11: 
          fill(255, 0, 0);
          break;
        case 12: 
          fill(255);
          cardText = "Red";
          break;
        case 21: 
          fill(0, 255, 0);
          break;
        case 22: 
          fill(255);
          cardText = "Green";
          break;
        case 31: 
          fill(0, 0, 255);
          break;
        case 32: 
          fill(255);
          cardText = "Blue";
          break;
        case 41: 
          fill(255, 255, 0);
          break;
        case 42: 
          fill(255);
          cardText = "Yellow";
          break;
        case 51: 
          fill(255, 128, 0);
          break;
        case 52: 
          fill(255);
          cardText = "Orange";
          break;
        case 61: 
          fill(255, 0, 128);
          break;
        case 62: 
          fill(255);
          cardText = "Pink";
          break;
        default:
          break;
        }
      }
      // Draw card face down (represented by black fill)
      else if (selected == false) {
        fill(0);
        rect(cardXpos, cardYpos, cardWidth, cardHeight);
      }

      // Exploit integer maths to extract second digit using modulus function
      if (symbol%10 == 1) {
        rect(cardXpos, cardYpos, cardWidth, cardHeight);
      }
      else if (symbol%10 == 2) {
        textAlign(CENTER);
        text(cardText, cardXpos + (cardWidth/2), cardYpos + (cardHeight/2));
      }
    }
  }
}

