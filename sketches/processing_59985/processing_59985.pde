
/*

Simple grid with rectangles.

@author Rafael Rinaldi (rafaelrinaldi.com)
@since Apr 20, 2012

*/

int PADDING = 2;
int ITEM_SIZE = 25;
int MAX_ITEMS = width / ITEM_SIZE;

int pX = PADDING;
int pY = PADDING;

void setup() {
  
  size(300, 300);
  
  noStroke();
  
  // Looping through Y.
  while(pY < height - ITEM_SIZE) {
    
    pX = PADDING;
    
    // Looping through X.
    while(pX < width - ITEM_SIZE) {
    
      fill(0);
      rect(pX, pY, ITEM_SIZE, ITEM_SIZE);
    
      pX += ITEM_SIZE + PADDING;
    
    }
    
    pY += ITEM_SIZE + PADDING;
    
  }
  
}

