
simpleCard card[] = new simpleCard[52]; //card images
cardSlot slot[][] = new cardSlot[14][4]; //homes for those cards
cardSlot dragger; //home for the card being dragged around

float scalar;  //used to scale cards uniformly
float marg = 15.0, gap = 3.0;  //minimum margin around screen and distance between cards
float cW, cH;  //card width and card height
int mode = 0; //0=deal, 1=remove aces, 2=user moves, 3=EOR, remove misaligned cards, 4=redeal, 5=lost, 6=won
int heartBeat = 0, aceCnt = 0, alignCnt = 0, dealCnt = 0, roundCnt = 0; //various counters
String message = ""; //floating message
boolean bShowMessage = false; //flag for displaying message
int halfW, halfH; //midscreen position

// ****************************************************************************
// *** setup
// ****************************************************************************

void setup() {
  size(800,400);
  smooth();
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(1);
  
  //get midscreen position for floating messages
  halfW = width/2;
  halfH = height/2;
  
  //setup cards
  for(int c=0; c<13; c++) {
    card[c] = new simpleCard("s",c+1);
    card[c+13] = new simpleCard("h",c+1);
    card[c+26] = new simpleCard("c",c+1);
    card[c+39] = new simpleCard("d",c+1);
  }
  
  //note a card's width and height
  cW = card[0].face.width/2.0;
  cH = card[0].face.height/2.0;
  
  //initial shuffle
  shuffle();
  
  //set scalar
  float rowH = (height - marg*3.0)/4.0;
  float colW = (width - marg*2.0)/13.0;
  scalar = min(rowH/(cH + gap), colW/(cW + gap));
  
  //setup grid slots and offscreen slots
  for (int r=0; r<4; r++) {
    slot[13][r] = new cardSlot(0, 0, width*2, height/2);
    slot[13][r].bMainGrid = false;
    for (int c=0; c<13; c++)
      slot[c][r] = new cardSlot(c, r, c*colW+marg+colW/2, r*rowH+marg*2+rowH/2);
  }
  
  //setup dragger slot (for mouse interaction)
  dragger = new cardSlot(0, 0, 0, 0);
  dragger.bMainGrid = false;
}


// ****************************************************************************
// *** draw
// ****************************************************************************

void draw() {
  int gap = 0;
  background(80,128,100);
  
  //draw the stationary cards
  for (int r=0; r<4; r++)
    for (int c=0; c<14; c++)
      if (mode == 6)
        slot[c][r].twitch();
      else
        slot[c][r].show_static();
        
  //draw the cards in motion
  for (int r=0; r<4; r++)
    for (int c=0; c<14; c++)
      slot[c][r].show_motion();

  //draw message
  float s = sin(radians(heartBeat+1));
  if(s > 0 && bShowMessage) {
    textSize(s*100);
    fill(0);
    text(message, halfW+1, halfH+1);
    fill(50,80,200);
    text(message, halfW, halfH);
  } 
  else bShowMessage = false;
  
  //draw title
  fill(40,85,60);
  textSize(14);  
  text("Gaps - A Solitaire Game", 95, 15);
  text("by Chinchbug", width-65, 15);  
  
  //main control and timing loop
  switch (mode) {
    
    case 0: //initial deal
      gap = 8; //time between card throws (good:10)
      for (int r=0; r<4; r++)
        for (int c=0; c<13; c++)
          if (heartBeat == (r*13+c)*gap)
            slot[c][r].assign(r*13+c, width/2, height+120);
      if (heartBeat > (3*13+12)*gap) {
        mode++;
        heartBeat = -1;
        message = "Round "+(roundCnt+1);
        bShowMessage = true;
      }
      break;
      
    case 1: //pull aces
      gap = 1;
      for (int r=0; r<4; r++)
        for (int c=0; c<13; c++)
          if (heartBeat == (r*13+c)*gap && card[slot[c][r].idx].val == 1) {
            slot[13][aceCnt++].assign(slot[c][r].idx, slot[c][r].pos.x, slot[c][r].pos.y);
            slot[c][r].idx = -1;
          }
      if (heartBeat > (3*13+12)*gap) {
        mode++;
      }
      break;
      
    case 2: //primary game time; do the mouse thing and watch for end of round
      dragger.pos.x = mouseX;
      dragger.pos.y = mouseY;
      dragger.show_static();
      kingLockCheck();
      break;
      
    case 3: //visually remove misaligned cards
      gap = 2;
      for (int r=0; r<4; r++)
        for (int c=0; c<13; c++)
          if (heartBeat == (r*13+c)*gap && !slot[c][r].bAligned) {
            slot[c][r].oldX = slot[c][r].pos.x;
            slot[c][r].pos.x += width;
            slot[c][r].assign(slot[c][r].idx, slot[c][r].oldX, slot[c][r].pos.y);
          }
      if (heartBeat-20 > (3*13+12)*gap) {
        shuffle();
        mode++;
        heartBeat = -1;
        dealCnt = 0;
        for (int r=0; r<4; r++)
          for (int c=0; c<13; c++)
            if (!slot[c][r].bAligned) {
              slot[c][r].pos.x = slot[c][r].oldX;
            }
        if (roundCnt < 3)
          message = "Round "+ (roundCnt+1);        
        else if (roundCnt == 3) message = "Last Round!";
        bShowMessage = true;
      }
      break;
      
    case 4: //re-deal misaligned cards
      gap = 5;
      for (int r=0; r<4; r++)
        for (int c=1; c<13; c++)
          if (heartBeat == (r*13+c)*gap && !slot[c-1][r].bAligned)
            slot[c][r].assign(dealCnt++, width/2, height+120);
      if (heartBeat > (3*13+12)*gap) {
        mode = 2;
        heartBeat = -1;
      }
      break;
      
    case 5: //lost - drop cards
      for (int r=0; r<4; r++)
        for (int c=0; c<13; c++)
          if (slot[c][r].pos.y < height + cH)
            slot[c][r].pos.y += float(heartBeat)/70;
      break;
  }
  
  heartBeat++;
}

// ****************************************************************************
// *** kingLockCheck()
// ****************************************************************************

void kingLockCheck() {
  //counts the empty slots (gaps) that follows the kings and responds accordingly
  boolean kingLast = false;
  int slotsLocked = 0;
  int alignCnt = 0;
  
  if (dragger.idx == -1) {
    
    for (int r=0; r<4; r++) { 
      for (int c=0; c<13; c++)
        if(slot[c][r].idx != -1) kingLast = card[slot[c][r].idx].val == 13;
        else if(kingLast) slotsLocked++;
      kingLast = false;
    }
    
    if (slotsLocked == 4) {
      for (int r=0; r<4; r++)
        if(slot[11][r].bAligned) alignCnt++;
      if (alignCnt == 4) {
        message = "You Win!";
        bShowMessage = true;
        heartBeat = 0;
        mode = 6;
      }
      else {
        if (roundCnt < 3) {
          mode = 3;
          heartBeat = -1;
          roundCnt++;
        }
        else {
          message = "You Lose!";
          bShowMessage = true;
          mode = 5;
          heartBeat = 0;
        }
      }
    }
  }
}

// ****************************************************************************
// *** shuffle
// ****************************************************************************

void shuffle() {
  simpleCard temp[] = new simpleCard[52];
  int mCnt = 0, aCnt = 0;
  
  if(mode == 0) { //fresh deck... move all cards to temp
    arrayCopy(card, temp); 
    mCnt = 52;
  }
  else { //only move misaligned cards to temp
    for (int r=0; r<4; r++)
      for (int c=0; c<13; c++)
        if(!slot[c][r].bAligned && slot[c][r].idx != -1) {
          temp[mCnt++] = card[slot[c][r].idx];
          slot[c][r].idx = -1;
        }
    //move aligned cards to temp "on top of" misaligned cards
    for (int r=0; r<4; r++)
      for (int c=0; c<13; c++)
        if(slot[c][r].bAligned) {
          temp[mCnt+aCnt] = card[slot[c][r].idx];
          slot[c][r].idx = mCnt+aCnt++;
        }
  }
  
  //actual shuffling part...
  for (int i = mCnt-1; i>=0; i--) { //go through deck from mCnt card to first card
    int rand = int(random(i+1)); //pick a random card from those that still need to be picked
    arrayCopy(temp, rand, card, mCnt-1-i, 1); //copy the random card from temp to card deck
    arrayCopy(temp, rand+1, temp, rand, mCnt-1-rand); //remove the random card from temp
  }
  
  if (mode != 0)
    //at this point, temp only contains the aligned cards.  Move them too...
    arrayCopy(temp, mCnt, card, mCnt, 48-mCnt);
}

// ****************************************************************************
// *** mousePressed()
// ****************************************************************************

void mousePressed() {
  //picks up the card (with the dragger slot)
  if(dragger.idx == -1 && mode == 2)
    for (int r=0; r<4; r++)
      for (int c=0; c<13; c++)
        if (slot[c][r].mouseOver() && !slot[c][r].bAligned) {
          dragger.idx = slot[c][r].idx;
          dragger.lastSlot = slot[c][r];
          slot[c][r].idx = -1;
        }
}

// ****************************************************************************
// *** mouseReleased()
// ****************************************************************************

void mouseReleased() {
  //checks for legal moves and re-assigns card to new slot
  boolean bDropped = false;
  if(dragger.idx != -1) {
    for (int r=0; r<4; r++)
      for (int c=0; c<13; c++)
        if (slot[c][r].mouseOver() && slot[c][r].idx == -1) {
          boolean bLegal = false;
          if(c == 0 && card[dragger.idx].val == 2) bLegal = true;
          if(c > 0) if(slot[c-1][r].idx != -1)
            if (card[dragger.idx].suit.equals(card[slot[c-1][r].idx].suit) && card[dragger.idx].val == card[slot[c-1][r].idx].val+1) 
              bLegal = true;
          if (bLegal) {
            slot[c][r].assign(dragger.idx, dragger.pos.x, dragger.pos.y);
            dragger.idx = -1;
            bDropped = true;
          }
        }
    if(!bDropped) {
      dragger.lastSlot.assign(dragger.idx, dragger.pos.x, dragger.pos.y);
      dragger.idx = -1;
    }
  }
}

// ****************************************************************************
// *** shadow()
// ****************************************************************************
 
void shadow(float x, float y, float r) {
  //used for drawing a subtle shadow under moving cards
  fill(0,50);
  noStroke();
  pushMatrix();
    translate(x, y);
    rotate(r);
    rect(0, 0, cW*scalar, cH*scalar);
  popMatrix();
}

// ****************************************************************************
// *** cardSlot class
// ****************************************************************************

class cardSlot {
  //the slots provide a "home" for the cards
  int idx = -1; //this is the index of the card in this slot (e.g. deck[idx]), -1 = none
  int row, col; //slots are layed out in a matrix of rows and columns
  PVector pos = new PVector(0,0); //this is the screen position of the slot...
  float oldX = 0; //the slot occasionally moves horizontally and it easier to remember where it came from than figuring it all out again...  
  PVector off = new PVector(0,0); //this keeps track of where the card is relative to the slot
  PVector stp = new PVector(0,0);  //size and direction of step
  int steps = 0; //how many "steps" the card is from home, so we can synch the movement with our spin (multiply by PI)
  boolean bMainGrid = true; //differentiates between the main 4x13 grid and the other cardSlot instances (dragger and offscreen slots)
  boolean bAligned = false; //flags slots that hold a correctly placed card
  cardSlot lastSlot; //we only use this with the dragger instance for a quick way to handle illegally dropped cards
  
  cardSlot(int c, int r, float x, float y) {
    row = r;
    col = c;
    pos.x = x;
    pos.y = y;
  }
  
  void assign(int index, float currX, float currY) {
    //whenever assigned, a card always starts from somewhere else (currX & currY) and needs to "land" on the slot...
    idx = index;
    off.x = currX - pos.x;
    off.y = currY - pos.y;
    steps = int(sqrt(off.x*off.x+off.y*off.y)/20.0); //we could use off.mag() here, but PVector's .mag sometimes fails
    stp.x = off.x;
    stp.y = off.y;
    stp.div(steps);
    //check for alignment...
    if(bMainGrid)
      for (int i=col; i<13; i++) {
        if (i == 0) slot[0][row].bAligned = card[slot[0][row].idx].val == 2;
        else
          if (slot[i-1][row].idx != -1 && slot[i][row].idx != -1) 
            slot[i][row].bAligned = card[slot[i][row].idx].val == card[slot[i-1][row].idx].val+1 && card[slot[i][row].idx].suit.equals(card[slot[i-1][row].idx].suit) && slot[i-1][row].bAligned;
        if (!slot[i][row].bAligned) break;
      }
  }
    
  boolean mouseOver() {
    //returns true if the mouse is over this slot while drawing a handy-dandy selection indicator
    if (mouseX > pos.x - cW*scalar/2 && mouseX < pos.x + cW*scalar/2 && mouseY > pos.y - cH*scalar/2 && mouseY < pos.y + cH*scalar/2) {
      if (mode == 2 && bMainGrid && idx != -1 && !bAligned) {
        stroke(0);
        strokeWeight(3);
        noFill();
        rect(pos.x, pos.y, cW*scalar, cH*scalar);
      }
      return true;
    } else return false;
  }
  
  void twitch() {
    //I wanted to come up with a more flashy victory effect, but sorta' ran out of steam
    if (idx != -1) card[idx].show(pos.x, pos.y, radians(random(-5,5)));
  }
  
  void show_static() {
    //display the card (or rectangle) if the card's stationary
    if(idx == -1) {
      if(mode == 1 || mode == 2)
        if (bMainGrid) {
          noFill();
          stroke(60,108,80);
          strokeWeight(1);
          rect(pos.x, pos.y, cW*scalar, cH*scalar);
        }
    } 
    else if (steps == 0) {
        card[idx].show(pos.x, pos.y, 0);
        if (bAligned) {
          stroke(100,200,100);
          strokeWeight(3);
          noFill();
          rect(pos.x, pos.y, cW*scalar, cH*scalar);
        }
    }
    mouseOver();
  }
  
  void show_motion() {
    //display the card if it in motion
    if(idx != -1 && steps > 0) {
      shadow(pos.x+off.x+11, pos.y+off.y+11, -radians(steps*15));
      card[idx].show(pos.x+off.x, pos.y+off.y, -radians(steps*15));
      off.sub(stp);
      steps--;
    }
  }
}

// ****************************************************************************
// *** simpleCard class
// ****************************************************************************

class simpleCard {
  PImage face; //holds the card face image
  String suit; //s=spades, h=hearts, c=clubs, d=diamonds
  int val; //1=ace - 13=king
  
  simpleCard(String s, int v) {
    suit = s;
    val = v;
    face = loadImage(s+v+".png"); //(e.g h4.png = four of hearts image)
  }
  
  void show(float x, float y, float r) {
    //nothing fancy here, just show it where you're told to...
    pushMatrix();
      translate(x, y);
      rotate(r);
      image(face, 0, 0, cW*scalar, cH*scalar);
    popMatrix();
  }
  
}

