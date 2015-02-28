
int moveHorizontal = 0;
int moveVertical = 5;
int replacementHorizontal = 5;
int replacementVertical = 5;

int moveHorizontal2 = 0;
int moveVertical2 = 5;
int replacementHorizontal2 = 6;
int replacementVertical2 = 6;

int moveHorizontal3 = 0;
int moveVertical3 = 5;
int replacementHorizontal3 = 7;
int replacementVertical3 = 7;

int moveHorizontal4 = 0;
int moveVertical4 = 5;
int replacementHorizontal4 = 8;
int replacementVertical4 = 8;

void setup() {
  size(500,200);
}

void draw() {
  background(0);
  
    moveHorizontal = moveHorizontal + replacementHorizontal;
    ellipse(moveHorizontal, moveVertical, 50, 50);
    
    fill(209,235,255);
    
    if (moveHorizontal >= width) {
    //println("I'm Here!");
    replacementHorizontal = replacementHorizontal * -1;
    }
    
    if (moveHorizontal <=0)  {
    //println("its working!");
    replacementHorizontal = replacementHorizontal * -1;
    }
    
    moveVertical = moveVertical + replacementVertical;
    if (moveVertical <=0)  {
    replacementVertical = replacementVertical * -1;
    }
    
     if (moveVertical >=height)  {
    replacementVertical = replacementVertical * -1;
    }
    
    
    //println(replacement);
    
    
    
    
    
    moveHorizontal2 = moveHorizontal2 + replacementHorizontal2;
    ellipse(moveHorizontal2, moveVertical2, 50, 50);
    
    fill(170,219,255);
    
    if (moveHorizontal2 >= width) {
    //println("I'm Here!");
    replacementHorizontal2 = replacementHorizontal2 * -1;
    }
    
    if (moveHorizontal2 <=0)  {
    //println("its working!");
    replacementHorizontal2 = replacementHorizontal2 * -1;
    }
    
    moveVertical2 = moveVertical2 + replacementVertical2;
    if (moveVertical2 <=0)  {
    replacementVertical2 = replacementVertical2 * -1;
    }
    
     if (moveVertical2 >=height)  {
    replacementVertical2 = replacementVertical2 * -1;
    }
    
    
    
    
    
    moveHorizontal3 = moveHorizontal3 + replacementHorizontal3;
    ellipse(moveHorizontal3, moveVertical3, 50, 50);
    
    fill(126,200,255);
    
    if (moveHorizontal3 >= width) {
    //println("I'm Here!");
    replacementHorizontal3 = replacementHorizontal3 * -1;
    }
    
    if (moveHorizontal3 <=0)  {
    //println("its working!");
    replacementHorizontal3 = replacementHorizontal3 * -1;
    }
    
    moveVertical3 = moveVertical3 + replacementVertical3;
    if (moveVertical3 <=0)  {
    replacementVertical3 = replacementVertical3 * -1;
    }
    
     if (moveVertical3 >=height)  {
    replacementVertical3 = replacementVertical3 * -1;
    }
    
    
    
    
    moveHorizontal4 = moveHorizontal4 + replacementHorizontal4;
    ellipse(moveHorizontal4, moveVertical4, 50, 50);
    
    fill(72,177,255);
    
    if (moveHorizontal4 >= width) {
    //println("I'm Here!");
    replacementHorizontal4 = replacementHorizontal4 * -1;
    }
    
    if (moveHorizontal4 <=0)  {
    //println("its working!");
    replacementHorizontal4 = replacementHorizontal4 * -1;
    }
    
    moveVertical4 = moveVertical4 + replacementVertical4;
    if (moveVertical4 <=0)  {
    replacementVertical4 = replacementVertical4 * -1;
    }
    
     if (moveVertical4 >=height)  {
    replacementVertical4 = replacementVertical4 * -1;
    }
    
    
    
    
    
    
    
}
