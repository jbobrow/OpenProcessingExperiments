

PFont frank;
PFont didot;
String myText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras molestie lorem sed erat accumsan sollicitudin. Etiam purus felis, commodo eget pellentesque nec, vehicula et mauris. Integer ligula eros, faucibus et feugiat aliquam, imperdiet a diam. Donec eu dolor sit amet lorem cursus scelerisque. Fusce orci justo, consectetur in posuere consequat, dapibus et ligula. Pellentesque sollicitudin magna ut lorem vehicula eleifend. Morbi sit amet turpis a nulla rhoncus pellentesque ac at metus. Suspendisse potenti.";

void setup() {
  size(500,500);
  smooth();
  frank = loadFont("FranklinGothic-Book-25.vlw");
  didot = loadFont("Didot-25.vlw");
 
}
void draw() {
  background(255);
  
  textFont(frank); 
  textAlign(LEFT, TOP);
  textSize(12);
 fill(2,211,216);
  text(myText, 50, 50, 400,400 );
  
  fill(0,109,196,50);
  
  textFont(didot);
  textSize(100);
  text("somthing",100,100);
  
 
  //fonts draw from the baseline
}

