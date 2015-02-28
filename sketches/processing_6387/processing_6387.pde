
public static final int IMG_QUANT = 43;

Vector preloaded;
PFont font;
float currentX;
float currentY;
int counter;

 void setup() {
  font = loadFont("courier.vlw");
  currentX = 0;
  currentY = 0;
  counter = 0;
  size(350,480);
  preLoad();
}

 void draw() {
  background(255);
  printOne((Vector)preloaded.elementAt(counter));
  counter++;
  if(counter == IMG_QUANT){
    counter = 0;
  }
  delay(50);
}

 void mousePressed(){
  println(mouseX + " " + mouseY);
}

 void preLoad(){
  preloaded = new Vector();
  for (int i = 1; i < IMG_QUANT + 1; i++) {
    Vector imgTxt = arrayToVector(loadStrings("face/man(" + i + ").txt"));
    preloaded.add(imgTxt);
  }
  println(preloaded.size());
}

 Vector arrayToVector(String[] array){
  Vector output = new Vector();
  for (int i = 0; i < array.length; i++) {
    output.add(array[i]);
  }
  return output;
}

 void printOne(Vector oneImage){
  currentX = 30;
  textFont(font, 8);
  fill(0, 0, 0);
  for (int i = 0; i < oneImage.size(); i++) {
    text((String)oneImage.elementAt(i), currentX, currentY);
    currentY = currentY + 8;			
  }		
  resetXY();
}

public void resetXY(){
  currentX = 0;
  currentY = 0;
}


