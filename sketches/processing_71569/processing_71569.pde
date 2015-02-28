
// Cruz Martinez Julia Yesika
//Rene Armando Hernandez

PFont font1;
PFont font2;
void setup()
{
  size(1020, 110);
  font1 = loadFont ("Candara-48.vlw");
  textFont (font1);
  font2 = loadFont ("Bauhaus93-48.vlw");
  textFont (font2);
}

void draw()
{
  background(0, 0, 0);
  fill(0, 255, 255); 
   font1 = loadFont ("Candara-48.vlw");
  textFont (font1);
  text ("a b c d e f g h i j k l m n o p q r s t u v w x y z", 0, 0, mouseX, 100);
  fill(0, 0, 255);
   font2 = loadFont ("Bauhaus93-48.vlw");
  textFont (font2);
  text ("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z", 0, 39, mouseX, 100);
}


