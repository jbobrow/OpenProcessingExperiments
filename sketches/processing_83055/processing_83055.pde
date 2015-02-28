
// pointillism
PImage img;

int posX;
int posY;

void setup(){
  img = loadImage("new_slides02.jpg");
  //tint(0, 153, 204, 126);  // Tint blue and set transparency  
  size(img.width, img.height);   
  imageMode(CENTER);
  image(img, width/2, height/2);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();          // Cover with random circles
  for (int i=0; i<20000; i++) addPoint();
}

void addPoint(){
  // Add a random filled circle to image
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 7, 7);
}

void draw(){
  //addPoint(); //Add more dots Randomly
  
  loadPixels();
  color pixel = get(mouseX,mouseY);
  noStroke();
  fill(pixel);
  
  /* // Action when you click mouse
  if(mousePressed == true) {
 
    posX=mouseX-(mouseX%20);
    posY=mouseY-(mouseY%20);
    ellipse(posX, posY, 25, 25);
    //rect(posX,posY,30,30);
  }*/
  
  
  /*
  for ( int i = 0; i < 1000; i++) {

    int x = int(random(0, width));
    int y = int(random(0, height));

    float diagonal = dist(0, 0, width, height);
    float tempSize = dist(mouseX, mouseY, x, y);
    float rectSize = map(tempSize, 0, diagonal, 1, 100);

    color getColor = img.get(x, y);
    fill(getColor, 50);
    rect(x, y, rectSize, rectSize);
  }*/
}


void mouseMoved(){
  posX=mouseX-(mouseX%20);
  posY=mouseY-(mouseY%20);
  ellipse(posX, posY, 25, 25);
}




