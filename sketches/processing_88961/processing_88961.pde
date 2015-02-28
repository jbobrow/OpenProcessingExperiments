
// creado por Gerard 
PImage cat;
float x = 0.0;
float y = 100;
float catSpeed =1;

void setup() {
  size(192, 157); 
  background(0); 
  frameRate(50);
  noStroke();
  
  cat = loadImage("http://www.gifsgifs.net/gifs/gifs-nave-espacial.gif");

}

void draw () {

  fill(random(355), random(355), 35, 35);
  rect(random(width), random(height), 25, 25);
   stroke(255);
    for(int i = 0; i < 10; i++) {
        point(random(width), random(height));
        
   
    }

    image(cat, x, y);
    x = x + catSpeed; 
    
     if(x > width) {
        x = 0.0; 
        y = random(height);
    }
   
}



