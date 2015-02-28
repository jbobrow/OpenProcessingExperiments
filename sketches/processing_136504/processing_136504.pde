
int myState = 0;
PImage cover;
PImage page1;
PImage page2;
PImage page4;
PImage page5;
PImage page6;
PImage page7;
PImage page8;
PImage page9;
PImage end;
void setup() {
  size(1000, 700);
  
  cover = loadImage("cover.png");
  page1 = loadImage("page1.png");
  page2 = loadImage("page2.png");
  page4 = loadImage("page4.png");
  page5 = loadImage("page5.png");
  page6 = loadImage("page6.png");
  page7 = loadImage("page7.png");
  page8 = loadImage("page8.png");
  page9 = loadImage("page9.png");
  end = loadImage("end.png");
}

void draw() {
  background (0);
  switch(myState) {
    
    case 0:
    image(cover, 500, 0);
    break ;
    
    case 1:
    image(page1, 0, 0);
    break ;
    
    case 2:
    image(page2, 0, 0);
    break ;
    
    case 3:
    image(page4, 0, 0);
    break ;
    
    case 4:
    image(page5, 0, 0);
    break ;
    
    case 5:
    image(page6, 0, 0);
    break ;
    
    case 6:
    image(page7, 0, 0);
    break ;
    
    case 7:
    image(page8, 0, 0);
    break ;
    
    case 8:
    image(page9, 0, 0);
    break ;
    
    case 9:
    image(end, 0, 0);
    break ;

    
  }
}

void mousePressed() {

  myState = (myState + 1) ; 
  if(myState > 9) {
    myState = 0;
  }
}
 


