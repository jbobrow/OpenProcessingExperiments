
float x,y;
float r=0, i=0;

color strokeColor = #000000;

class MyButton {
  int x, y;
  int buttonWidth = 64;
  int buttonHeight = 32;
  color clr;
  boolean selected = false;
  MyButton(int _x, int _y, color _clr)
  {
    x = _x;
    y = _y;
    clr = _clr;
  }
  
  void checkClick() {
    if (mouseX >= x && mouseX < x+buttonWidth &&
        mouseY >= y && mouseY < y+buttonHeight) {
      strokeColor = clr;
      selected = true;
    } else {
      selected = false;
    }
    
  }
  
  void render() {
    fill(clr);
    if (selected) {
      stroke(50);
    } else {
      stroke(clr);
    }
    rect(x,y,buttonWidth,buttonHeight);
  }

}

MyButton b1, b2, b3, b4, b5, b6, b7,b8;

void setup()
{
  size(800,600);
  b1 = new MyButton(10,10,#FF0000);
  b2 = new MyButton(100, 10, #00FF00);
  b3 = new MyButton(10, 100, #0000FF);
  b4 = new MyButton (100, 100, #E60EBE);
  b5 = new MyButton (100, 200, #800080);
  b6 = new MyButton (10, 200, #000000);
  b7 = new MyButton (10,300, #FFD400);
  b8 = new MyButton (100,300,#FF8000);

 
  background(255);
 
}

void draw() {
  
  b1.render();
  b2.render();
  b3.render();
  b4.render();
  b5.render();
  b6.render();
  b7.render();
  b8.render();

stroke(0,0,0); 
line(770,20,770,580);
line(200,20,200,580);
line(200,580,770,580);
line(200,20,770,20);

if (key=='1') {// Stroke weight selection
    strokeWeight(2);
  }
  if (key=='2') {
    strokeWeight(4);
  }
  if (key=='3') {
    strokeWeight(6);
  }
  if (key=='4') {
    strokeWeight(8);
  }
  if (key=='5') {
    strokeWeight(10);
  }

  else {
    r=r+10; //Stroke quantity
    i=i-6;
  }

  
 
}

void mouseDragged()
{
  stroke(strokeColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed() 
{
  b1.checkClick();
  b2.checkClick();
  b3.checkClick();
  b4.checkClick();
  b5.checkClick();
  b6.checkClick();
  b7.checkClick();
  b8.checkClick();
 
}

