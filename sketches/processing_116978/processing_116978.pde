
/* @pjs preload= "tiger.jpg"; */
PImage image;
String name = "tiger";

void setup() {
  size(1000, 750);
  image = loadImage(name+".jpg");
  noStroke();
  background(255);
  rectMode(CENTER);
  frameRate(45);
}

void draw() {
  if (mousePressed){ 
    drawShape(mouseX, mouseY, pmouseX, pmouseY);
  }  
}


void keyPressed(){
  //filters
  if (key == 'b'){
    filter(BLUR); //blurry filter
  }
  if (key == 'g'){
    filter(GRAY); //shift to grayscale
  }
  if (key == 'e'){
    filter(ERODE); //reduce the light areas
  }
  if (key == 'd'){
    filter(DILATE); //increase the light areas
  }
  
  //Reset image
  if( key =='w'){
    background(255); //paint screen white
  }
  if( key =='z'){
    background(0); //paint screen black
  }
  if(key == 'i'){
    pushMatrix();
    image(image,0,0); //show image
    popMatrix();
  }
  
  //save image
  if (key == 's'){
    saveFrame(image+".jpg"); //save image as .jpg
  }
}

void drawShape(int x, int y, int px, int py){
  color c = image.get(x, y);
  fill(c, 102);
  float speed = abs(x-px) + abs(y-py);
    if (key == 'q'){
     rect(x, y, speed, speed);
    }
    if (key == 'c'){
      ellipse(x, y, speed, speed);
    } 
    if (key == 't'){
      triangle(x, y - (sqrt(3)/3)*speed, x + speed/2, y + (sqrt(3)/6)*speed, x - speed/2, y + (sqrt(3)/6)*speed);
    }
}





