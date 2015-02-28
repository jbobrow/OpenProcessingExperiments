
/* @pjs preload="pannel01.jpg", "pannel02.jpg", "pannel02.1.jpg", "pannel03.jpg", "title.jpg", "macomic1.jpg";*/

PImage pannel01, pannel02, pannel03, pannel04, title, comic;
int myState = 0, myCounter = 200;

void setup() {
  size (600, 500);
  
  //load images
  pannel01 = loadImage("pannel01.jpg");
  pannel02 = loadImage("pannel02.jpg");
  pannel03 = loadImage("pannel02.1.jpg");
  pannel04 = loadImage("pannel03.jpg");
  title = loadImage("title.jpg");
  comic= loadImage("macomic1.jpg");
  
}


void draw() {

  myCounter = myCounter -1;
  
  background(0);
  
  switch(myState) {
    
    case 0:
    image(title, 0, 0);
    if(myCounter < 0) {
      myCounter = 60*5;
      myState = 1;
    }    
    break;
    
    case 1:
    image(comic, 0, 0);
    //image(pannel01, 0, 75);
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 2;
    }   
    break;
    
    case 2:
    image(comic, -600, 0);
    //image(pannel03, -500, 0);
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 3;
    }   
    break;
    
    case 3:
    image(comic, 0, -300);
    //image(pannel02, 0, 75);
        if(myCounter < 0) {
      myCounter = 60*5;
      myState = 4;
    }   
    break;
    
    case 4:
    image(comic, 0, 0, 600, 840);
    //image(pannel04, 0, 50);
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 5;
    }   
    break;
    
        case 5:
    image(comic, 0, -300, 600, 840);
    //image(pannel04, 0, 50);
        if(myCounter < 0) {
      myCounter = 60*5;
      myState = 0;
    }   
    break;
  }
}




