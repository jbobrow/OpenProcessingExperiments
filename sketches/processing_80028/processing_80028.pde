
/**

 * tweaked from http://btk.tillnagel.com/tutorials/rss-feeds-processing.html
 * revised to ver2
 
 
 * Loads RSS feed and displays item images.
 * Move the mouse to rotate and scale the image wheel.
 * 
 * (c) 2008 Till Nagel, btk.tillnagel.com
 */

import processing.opengl.*;



// The items array
Item[] items;

void setup() {
  
  size(800, 800, OPENGL);

  print("Loading feed, and images ...");

  // Loads RSS feed and gets image of each item
  XML rss = loadXML("http://feeds.bbci.co.uk/news/rss.xml?edition=int");
  XML[] children  = rss.getChildren("channel/item/media:thumbnail");



  items = new Item[children.length];
  // Calculate degreeStep to arrange items equally on a circle
  float degreeStep = 360.0 / items.length;
  // Loads image and creates Item for each feed item
  for (int i = 0; i < items.length; i++) {
    String imageURL = children[i].getString("url");
    PImage img = loadImage(imageURL);
    items[i] = new Item(img, degreeStep * i, 300, 0);
  }

  println(" done.");
}

class Item {  
    PImage img;
    float degree;  
    int x;  
    int y;  
  
    // Creates a new Item with title, image, and position  
    Item(PImage img, float degree, int x, int y) {  
        this.img = img;  
        this.degree = degree;
        this.x = x;  
        this.y = y;  
    }  
      
    // Displays this item  
    void display() {  
        image(img, x, y);  
    }  
}  

void draw() {
  float degreeChange = (mouseX-width/2)/80.0;
  float distance = (mouseY-height/2)/80.0;

  background(0);
  translate(width/2, height/2);

  // Displays each item
  for (int i = 0; i < items.length; i++) {
    items[i].display();
    
    // Rotate it according to the vertical mouse position
    items[i].degree += degreeChange;
    // and move it according to the horizontal mouse position
    items[i].x += distance;
  }
}
