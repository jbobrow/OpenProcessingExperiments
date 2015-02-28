
  PImage img;
   void setup() {
    size(600,600);
    img = loadImage("e.jpg");  
  }
  void draw() {
      
    image(img, mouseX, 0);  
    rect(mouseX,150,100,300);
    fill(10);
    noStroke();

  
  
  int rect_x = round( map(mouseX, 0,width, width,200) );
  rect( rect_x,200, 50,50 );
  stroke(40);
   }


