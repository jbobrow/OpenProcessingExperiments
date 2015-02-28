
/* @pjs font="times.ttf"*/
PFont font;

//x value
int[] x = { 102, 70, 84, 102,   119, 136 };
//y value
int[] y = { 31, 87, 115,  122,  115, 87 };

void setup() {
  font = loadFont("times.ttf");
  textFont(font, 12);
  size(400, 800);
  background(#A9D1E3);

}

void draw() {
  
pushStyle();
drawTearDrop(100, 100);
popStyle();

text("testing 123", 200, 200);

text("is this really working?", 300, 250);
text("i think processing is messing with me.", 0, 300);
text("or perhaps it was randomly disappearing txt.", 50, 350);

pushStyle();
fill(0);
text("let's see if I can change color.", 20, 400);
popStyle();

pushStyle();
fill(#B4B40D);
text("oops, ended up changing all font color. Better fix it.", 40, 450);
popStyle();

pushStyle();
fill(#0E760F);
text("can I change text size?", 50, 500, width / 2, 80);
popStyle();

pushStyle();
fill(#E315C8);
text("grr....... that should have worked. tricky x and y values.", 10, 550, 400, 12);
popStyle();

pushStyle();
fill(#3D15E3);
textFont(font, 15);
text("lemme try again.", 80, 600, 400, 16);
popStyle();

pushStyle();
fill(255, 0, 0);
text("hey!!! this isn't even the right font type!!!", 150, 700);
popStyle();

  /*print("x: ");
  println(mouseX);
  print("y: ");
  println(mouseY);*/
}



void drawTearDrop(float xOffset, float yOffset) {  
  noStroke();
  fill(#15CBCA);
  beginShape(); 
                
 for (int i = 0; i < x.length; i++)
 {
 
  vertex(x[i] + xOffset, y[i] + yOffset); 
 }
 endShape(CLOSE);   
  
}




