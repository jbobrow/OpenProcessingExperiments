
int counter;
PImage img;

void setup() {  //setup function called initially, only once
  size(550, 350);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  img = loadImage("http://www.mrwallpaper.com/wallpapers/Flower-Art-Paint.jpg");
}

void draw() {  //draw function loops 
  image(img, 0, 0, width/1, height/1);
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/5, height/5, 700*sin(counter), 800*sin(counter));
  }
}







