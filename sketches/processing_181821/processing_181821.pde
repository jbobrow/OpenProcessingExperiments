
void setup() {

  size(400, 400);
  fill(0);
}
void draw() {
  background(0, 125, 240);
  fill(255);
  noStroke();
  fill(0);
  textSize(25);
  text("Time:", 25, 100);
  text("Date:", 25, 150);
  int y =year();
  int d= day();
  int M = month();
  int s = second();
  int m = minute();  
  int h = hour();    
  //clock
  textSize(50);
  if (h>9) text(""+h, 95, 115);
  else text("0"+h, 95, 115);
  text(":", 155, 110);
  if (m>9) text(""+m, 167, 115);
  else text("0"+m, 167, 115);
  text(":", 228, 110);
  if (s>9) text(""+s, 244, 115);
  else text("0"+s, 244, 115);
  //date
  if (M<10) text("0"+M, 95, 165);
  else text(""+M, 95, 165);
  textSize(30);
  text("-", 158, 155);
  textSize(50);
  if (d<10) text("0"+d, 175, 165);
  else text(""+d, 175, 165);
  textSize(30);
  text("-", 235, 155);
  textSize(50);
  text(""+y, 250, 165);
  text(currentClass(),50,250);
}
String currentClass() {
  //  String[] periodNames= new String[] {
  //   "First Block", "Second Block", "Third Block", "Lunch", "Forth Block", "Fifth Block", "Sixth Block"
  //  };
  int m = minute();  
  int h = hour();
  textSize(50); 
  if (h==8)  return  "First Block";
  if (h==9) { 
    if (m<5) return "Passing Time";
    else return "Second Block";
  }
  if (h==10) { 
    if (m<35) return "Second Block";
    else if (m<40)  return "Passing Time";
    else return "Third Block";
  }
  return "Schools Out";
}



