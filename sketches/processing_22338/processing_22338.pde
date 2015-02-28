
/**
 * when mouse clicked green leaf objects multiply faster
 * when cursor moved black rectangle flashes
 * 
 * MOUSE
 * position x/y         : area position
 * left click           : multple green objects
 * 
 * KEYS
 * 1-3                  : area size
 * s                    : save png
 */

PImage img;

int tileCountX = 10;
int tileCountY = 10;
int tileCount = tileCountX*tileCountY;
PImage[] imageTiles = new PImage[tileCount];

int tileWidth, tileHeight;

int cropX = 0;
int cropY = 0;

int i=0;

boolean selectMode = true;
boolean randomMode = false; 

//define sketch size, load image, no cursor visible
void setup() {
  size(1000, 600); 
  img = loadImage("image.jpg");
  image(img, 0, 0);
  noCursor();

  tileWidth = width/tileCountY;
  tileHeight = height/tileCountX;
}

//define variables for green objects
void vex(int a, int b, int c, int x, int y, int z){
if(a>0){
    stroke(197+random(-30,30),241+random(-30,30),78+random(-30,30),b+20);}
else{stroke(random(255),b-50);}
    strokeWeight(c);
 line(x,y,x,y+z);
 line(x+z-random(10),y+random(10),x,y+z);
 line(x-z+random(10),y+random(10),x,y+z); 
}

//draw elements
void draw() {
  if (selectMode == true) {
    // in selection mode, a black selection rectangle is drawn over the image
    cropX = constrain(mouseX, 0, width-tileWidth);
    cropY = constrain(mouseY, 0, height-tileHeight);    
    image(img, 0, 0);
    noFill();
    stroke(000);
    rect(cropX, cropY, tileWidth, tileHeight);
  } 
  if(i<1000){
vex(int(random(-10,10)),int (random(100)), int(random(25)),int(random(-30,width)),int(random(-10,height)),int(random(10,30)));
i++;
}
  else {
    // reassemble image
    int i = 0;
    for (int gridY = 0; gridY < tileCountY; gridY++){
      for (int gridX = 0; gridX < tileCountX; gridX++){
        image(imageTiles[i], gridX*tileWidth, gridY*tileHeight);
        i++;
      }
    }

  }

}

void cropTiles() {
  tileWidth = width/tileCountY;
  tileHeight = height/tileCountX;
  tileCount = tileCountX * tileCountY;
  imageTiles = new PImage[tileCount];

  int i = 0;
  for (int gridY = 0; gridY < tileCountY; gridY++){
    for (int gridX = 0; gridX < tileCountX; gridX++){
      if (randomMode){
        cropX = (int) random(mouseX-tileWidth/2, mouseX+tileWidth/2);
        cropY = (int) random(mouseY-tileHeight/2, mouseY+tileHeight/2);
      }
      cropX = constrain(cropX, 0, width-tileWidth);
      cropY = constrain(cropY, 0, height-tileHeight);
      imageTiles[i++] = img.get(cropX, cropY, tileWidth, tileHeight);
    }
  }
}


void mouseMoved() {
  selectMode = true;
}

void mouseReleased(){
  selectMode = false; 
  cropTiles();
}



void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");

  if (key == 'r' || key == 'R') {
    randomMode = !randomMode;
    cropTiles();
  }

  if (key == '1'){
    tileCountY = 10;
    tileCountX = 10;
    cropTiles();
  }
  if (key == '2'){
    tileCountY = 50;
    tileCountX = 50;
    cropTiles();
  }
  if (key == '3'){
    tileCountY = 100;
    tileCountX = 100;
    cropTiles();
  }
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

