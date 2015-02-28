
int columns = 7;

Picture [] pics = new Picture [columns];
Picture [] pics2 = new Picture [columns];
Picture [] pics3 = new Picture [columns-1];

PImage [] images = new PImage[columns * 3];


Spot [] spots = new Spot [columns];
Spot [] spots2 = new Spot [columns];
Spot [] spots3 = new Spot [columns];



//-----------------------------------SETUP-------------------------------

void setup() {
  size(505, 288);
  
  images[0]= loadImage ("pic1.jpg");
  images[1]= loadImage ("pic2.jpg");
  images[2]= loadImage ("pic3.jpg");
  images[3]= loadImage ("pic4.jpg");
  images[4]= loadImage ("pic5.jpg");
  images[5]= loadImage ("pic6.jpg");
  images[6]= loadImage ("pic7.jpg");
  images[7]= loadImage ("pic8.jpg");
  images[8]= loadImage ("pic9.jpg");
  images[9]= loadImage ("pic10.jpg");
  images[10]= loadImage ("pic11.jpg");
  images[11]= loadImage ("pic12.jpg");
  images[12]= loadImage ("pic13.jpg");
  images[13]= loadImage ("pic14.jpg");
  images[14]= loadImage ("pic15.jpg");
  images[15]= loadImage ("pic16.jpg");
  images[16]= loadImage ("pic17.jpg");
  images[17]= loadImage ("pic18.jpg");
  images[18]= loadImage ("pic19.jpg");
  images[19]= loadImage ("pic20.jpg");
  images[20]= loadImage ("pic21.jpg");
  
  for (int i = 0; i < pics.length; i++) {
   //randomSeed();
pics [i] = new Picture (images[int(random(images.length/3))], i*width/pics.length, 0);
}
for (int i = 0; i < pics2.length; i++) {
pics2 [i] = new Picture (images[int(random(images.length/3, + (images.length/3*2 )))], i*width/pics.length, 100);
}
for (int i = 0; i < pics3.length; i++) {
pics3 [i] = new Picture (images[int(random(images.length/3*2, images.length))], i*width/pics.length, 200);
}
  
 
  for(int j = 0; j <spots.length; j++){
   spots[j] = new Spot(j*width/spots.length, 0); 
}
  for(int j = 0; j <spots2.length; j++){
   spots2[j] = new Spot(j*width/spots.length, 100); 
}
  for(int j = 0; j <spots3.length; j++){
   spots3[j] = new Spot(j*width/spots.length, 200); 
}

}

//----------------------------------DRAW---------------------------------------

void draw() {
  background(255);
   /* for(int j = 0; j<spots.length; j++){
spots[j].show();
    }
    for(int j = 0; j<spots2.length; j++){
spots2[j].show();
    }
     for(int j = 0; j<spots3.length; j++){
spots3[j].show();
    }*/

  for (int i = 0; i < pics.length; i++) {
    pics[i].display();
    pics[i].drag(mouseX, mouseY);
  }
  for (int i = 0; i < pics2.length; i++) {
    pics2[i].display();
    pics2[i].drag(mouseX, mouseY);
  }
  for (int i = 0; i < pics3.length; i++) {
    pics3[i].display();
    pics3[i].drag(mouseX, mouseY);
  }
}

//---------------------------------MOUSE-PRESSED----------------------------------------

void mousePressed() {
  for (int i = 0; i < pics3.length; i++) {
    pics3[i].clickedOn();
  }
  for (int i = 0; i < pics.length; i++) {
    pics[i].clickedOn();
    pics2[i].clickedOn();
  }
  
}

//---------------------------------MOUSE-RELEASED---------------------------------------

void mouseReleased() {
  for (int i = 0; i < pics3.length; i++) { 
    pics3[i].stopDragging();
  }
  for (int i = 0; i < pics.length; i++) { 
    pics[i].stopDragging();
    pics2[i].stopDragging();
  }
  
  for (int i = 0; i < pics.length; i++) {
    for (int j = 0; j < spots.length; j++) {
      pics[i].check(spots3[j]);
      pics2[i].check(spots2[j]);
      pics2[i].check(spots[j]);
    }
  }
  
   for (int i = 0; i < pics2.length; i++) {
    for (int j = 0; j< spots2.length; j++) {
      pics[i].check(spots[j]);
      pics[i].check(spots2[j]);
      pics2[i].check(spots3[j]);
    }
  }
  for (int i = 0; i < pics3.length; i++) {
    for (int j = 0; j< spots3.length; j++) {
      pics[i].check(spots3[j]);
      pics2[i].check(spots3[j]);
      pics3[i].check(spots3[j]);
      pics3[i].check(spots2[j]);
      pics3[i].check(spots[j]);
    }
  }
}


//--------------------------------PICTURE CLASS--------------------------------------

class Picture {
  int x;
  int y;
  int w;
  int h;
  boolean on = false;
  int offsetX, offsetY;
  boolean dragging = false;
  PImage theImage;

 Picture(PImage tempImage, int _xpos, int _ypos){
    x = _xpos;
    y = _ypos;
    w = width/columns;
    h = 100;
    fill(int (random(0, 255)), int (random(0, 255)), int (random(0, 255)));
    offsetX = 0;
    offsetY = 0;
    theImage = tempImage;
  }

 void display() {
  // rect(x, y, w, h);
  image (theImage, x, y, w, h);
  }

 void clickedOn() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      on =!on;
      dragging = true;
    }
  }
 
 void check(Spot s) {
    if (dist(x,y, s.x, s.y) < 40) {
      x = s.x;
      y = s.y;
    }
  }
   
 void stopDragging() {
    dragging = false;
  }

 void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }
}

//-------------------------------------SPOT CLASS----------------------------------------

class Spot {
  int x;
  int y;
  int w;
  int h;

  Spot(int tempX,int tempY) {
    x = tempX;
    y = tempY;
    w = 100;
    h = 100;
  }
  
  void show(){
    fill(123);
    rect(x, 0, width, height);
    rect(x*100+0, 100, width, height);
    rect(x, 200, width, height);
  }
}


