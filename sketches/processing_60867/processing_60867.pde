
//Happy Go Lucky Solar System

PImage rainbow, wurst, ball, cat;


void setup() {
    size(500, 500);
    /*
    rainbow = requestImage("http://nitnatsnoc.org/upload/back.png");
    wurst = requestImage("http://nitnatsnoc.org/upload/wurst.png");
    ball = requestImage("http://nitnatsnoc.org/upload/basketball.png");
    cat = requestImage("http://nitnatsnoc.org/upload/cat.png");
    */
    
    rainbow = loadImage("back.png");
    wurst = loadImage("wurst.png");
    ball = loadImage("basketball.png");
    cat = loadImage("cat.png");
    
}
 
 
void draw() { 
  pushMatrix();
    imageMode(CORNER);
    image(rainbow, 0, 0, width, height); 
    
    imageMode(CENTER);
    translate(width/2, height/2);
    rotate(millis() * 0.001 * TWO_PI / 10.0);
    drawImage(wurst, 0.6);
    
    
    
    rotate(millis() * 0.001 * TWO_PI / 9.0);
    translate(180,0);
    rotate(millis() * 0.001 * TWO_PI/8); 
    drawImage(cat, 0.3);
    
    rotate(millis() * 0.001 * TWO_PI/6);
    translate(90,0);
    rotate(millis() * 0.001 * TWO_PI/4); 
    drawImage(ball, 0.2);
    
    
  popMatrix();
}

void drawImage(PImage _image, float _scale){
  imageMode(CENTER);
   image(_image, 0, 0, _scale*_image.width, _scale*_image.height);
}



