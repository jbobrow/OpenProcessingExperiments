



NodeData[] NodeData1;
String[] lines;

int recordCount;
PFont body;
int s = 0;
int count = 0;
int num = 1; // Display this many entries on each screen.
int startingEntry = 0;  // Display from this entry number
PFont myFont;
PImage b;
RectButton rect1, rect2, rect3, rect4, rect5;
boolean locked = false;
boolean floor1 = false;
boolean floor2 = false;
boolean floor3 = false;
boolean floor4 = false;
boolean choice = true;
String number1 = "blah";


void setup() 
{
  recordCount = 0;
  size(633, 675);
  fill(255);
  b= loadImage("floor_plan_4.JPG");
  myFont = createFont("FFScala", 9);
  textFont(myFont);
  //noLoop();ww
  colorMode(HSB, 10);
  if (floor1 == true) {
    lines = loadStrings("sample2.txt");
  }
  else if (floor2==true) {
    lines = loadStrings("sample3.txt");
  }
  else if (floor3==true) {
    lines = loadStrings("sample4.txt");
  }
  else if (floor4 == true) {
    lines = loadStrings("sample5.txt");
  }
  if (floor1 == true || floor2 == true || floor3 == true || floor4 == true){
    NodeData1 = new NodeData[lines.length];
    for (int i = 0; i < lines.length; i++) {
      String[] pieces = split(lines[i], '\t'); // Load data into arrayif (pieces.length == 4) 
      NodeData1[recordCount] = new NodeData(pieces);
      recordCount++;


    }
  }
  s = second();

  color buttoncolor = color(204);
  color highlight = color(153);

  // Define and create rectangle button
  buttoncolor = color(1, 10, 10);
  highlight = color(2, 10, 10); 
  rect1 = new RectButton(150, 20, 50, buttoncolor, highlight, str('1'));

  // Define and create rectangle button
  buttoncolor = color(3, 10, 10);
  highlight = color(4, 10, 10); 
  rect2 = new RectButton(90, 20, 50, buttoncolor, highlight, str('2'));

  // Define and create rectangle button
  buttoncolor = color(5, 10, 10);
  highlight = color(6, 10, 10); 
  rect3 = new RectButton(150, 300, 50, buttoncolor, highlight, str('3'));

  // Define and create rectangle button
  buttoncolor = color(7, 10, 10);
  highlight = color(8, 10, 10); 
  rect4 = new RectButton(90, 300, 50, buttoncolor, highlight, str('4'));

  buttoncolor = color(9, 10, 10);
  highlight = color(6, 10, 10); 
  rect5 = new RectButton(100, 100, 50, buttoncolor, highlight, "BACK");

}

void draw() {

  update(mouseX, mouseY);
  if (choice == true) {
    background(1, 0, 10);
    rect1.display();
    rect2.display();
    rect3.display();
    rect4.display();
  }

  else if (floor1 == true || floor2 == true || floor3 == true || floor4 == true){
    choice = false;

    

    image(b, 0, 0);
    rect5.display();

    for (int i = 0; i <= (NodeData1.length-1); i++) {
      int thisEntry = startingEntry + i;



      fill(0, 10, 10);
      //println(NodeData1[thisEntry].humidity);
      text("Node" + NodeData1[thisEntry].name+" :  " + NodeData1[thisEntry].temp+", "+ NodeData1[thisEntry].humidity+", "+NodeData1[thisEntry].displacement, NodeData1[thisEntry].xvalue, NodeData1[thisEntry].yvalue); // Print name to con
      fill(NodeData1[thisEntry].temp*.1+6.5, 100, 100);
      rect(NodeData1[thisEntry].xvalue, NodeData1[thisEntry].yvalue, 10, 10);


    }
    if (s !=second()) {
      setup();
    }

  }

}



class NodeData {
  String name;
  float temp;
  int humidity;
  float displacement;
  float xvalue;
  float yvalue;

  public NodeData(String[] pieces) {
    name = pieces[0];
    temp = float(pieces[1]);
    humidity = int(pieces[2]);
    displacement = float(pieces[3]);
    xvalue = float(pieces[4]);
    yvalue = float(pieces[5]);
  }

}


class Button
{
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false; 
  String number1; 
  String number; 

  void update() 
  {
    if(over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() 
  {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }    
  }

  boolean over() 
  { 
    return true; 
  }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}


class RectButton extends Button
{
  RectButton(int ix, int iy, int isize, color icolor, color ihighlight, String number1) 
  {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
    number = number1;
  }

  boolean over() 
  {
    if( overRect(x, y, size, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }

  void display() 
  {
    stroke(255);
    fill(currentcolor);
    rect(x, y, size, size);
    fill(color(0,0,0));
    text(number, x, y);
  }
}



void update(int x, int y)
{
  if(locked == false) {

    rect1.update();
    rect2.update();
    rect3.update();
    rect4.update();
    rect5.update();
  } 
  else {
    locked = false;
  }
}
void mouseClicked() {


    if(rect1.pressed()==true) {
      floor1 = true;
      choice = false;
      setup();
      print ("True");
    } 
    else if(rect2.pressed()==true) {
      floor2 = true;
      choice = false;
      setup();
      redraw();
    }
    else if(rect3.pressed()==true) {
      floor3 = true;
      choice = false;
      setup();
 
    }
    else if(rect4.pressed()==true) {
      floor4 = true;
      choice = false;
      setup();

    }
    else if (rect5.pressed()==true) {
      choice = true;
      floor1 = false;
      floor2 = false;
      floor3 = false;
      floor4 = false;

      setup();

    }
  }



















