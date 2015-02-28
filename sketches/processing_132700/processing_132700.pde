
// Erste Versuche mit draw und Text...

void setup(){
 size(120,120);
 //stroke(150);
}

void draw()
{
  background(40);
  PFont dialog;
  dialog = loadFont("Dialog.bold-18.vlw");
  // textSize(20);
  textFont(dialog);
  text("Hello Text World!", 24,48,85,100);
  fill(#448100);
  line(22,44,88,44);
  line(88,44,88,100);
  line(88,100,22,100);
  line(22,100,22,44);
  stroke(#2040f0);
  strokeWeight(2);
}


