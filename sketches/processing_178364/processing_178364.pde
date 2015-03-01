
/*
Final Project - 20141218 - Inspirational Quotes
*/

//I declare a variable of type PImage and I name it myXtree.
PImage myXtree;
PFont f;

// I setup my sketch, define the canvas size and load my image into the system. 
void setup() {
  size(800, 600);
  myXtree = loadImage("myXtree.jpg");
  f = createFont("Arial", 20, true);
}

// I draw my image and insert the quotes.
void draw() {
  image(myXtree, 0, 0);
  textFont(f, 36);
  fill(#FC6176);  
  text("Merry Christmas & A Happy New Year!!!", 100, 100);
  if (keyPressed) {
  fill(255);
  textFont(f, 20);
  switch(key) {
    case '1':
    text("Whether you think you can or think you can’t, you’re right. Henry Ford", 0, 200);
    break;
    case '2':
    text("Change your thoughts and you change your world. Norman Vincent Peale.", 200, 250);
    break;
    case '3':
    textSize(18);
    text("It’s not your circumstances that shape you, it’s how you react to your circumstances. Anne Ortlund", 5, 500);
    break;
    case '4':
    text("The best luck of all is the luck you make for yourself. Douglas MacArthur", 35, 180);
    break;
    case '5':
    textSize(17);
    text("A man is rich in proportion to the number of things which he can afford to let alone. Henry David Thoreau", 0, 300);
    break;
    case '6':
    text("There are no facts, only interpretations. Friedrich Nietzsche", 150, 350);
    break;
    case '7':
    text("Never stand begging for that which you have the power to earn. Miguel de Cervantes", 14, 200);
    break;
    case '8':
    text("A man is but the product of his thoughts. What he thinks, he becomes. Mahatma Gandhi", 19, 450);
    break;
  }
  }  
  }




