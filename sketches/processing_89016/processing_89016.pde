
//Creat per Pau.A

PImage doraemon;
float x = 0.0;
float y = 100;
float doraemonSpeed = 2;

void setup() {
  size(200, 160); 
  background(0);
  frameRate(30);
  
 //imatge
  doraemon = loadImage("http://www.kiyo.es/menuk/doraemon.jpg");

}

void draw () {
    background(0);
    
    //estrellas 
    stroke(255);
    fill(255,0,0);
    for(int i = 0; i < 10; i++) {
        point(random(width), random(height));
        
    }
    
    
    image(doraemon, x, y);
    x = x + doraemonSpeed; 
    
    if(x > width) {
        x = 0.0; 
        y = random(height);
    }
}


