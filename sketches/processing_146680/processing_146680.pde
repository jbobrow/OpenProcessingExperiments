
Dots dots;
PFont text1;

void setup() {
    size(650, 500); 
    dots = new Dots(100,80,40);
    dots.process();
    text1 = loadFont ("Courier10PitchBT-Roman-48.vlw");
 
 Text();
}

void draw() {
}


  void mousePressed() { 
  dots.process();
  Text();    
}
void Text(){
  fill(255);
  noStroke();
  textAlign(LEFT);
  textFont(text1, 54);
  text("PROCESSING", 50,75);
  text("Corso Base", 50,120 );
  textFont(text1, 24);
  text("      by MakeRn Lab", 50,150);
  textFont(text1, 20);
  text("Presentazione Corso + Prima Lezione", 50,200);
  text("17 Maggio @ FromMarketToMakers 2014 ", 50,225);
  text("@ GrottaRossa - Via Della Lontra, 40 - Rimini", 50,250);
  text("18 - 23 - 24 Maggio", 50,290);
  text("ORE 19:00 - 21:00", 50,315);
  text("@ MakeRn Lab - Via Cagni, 14 - Rimini", 50,340);
  textFont(text1, 24);
  text("www.makern.it", 50,390);
  if (mousePressed == true) {
    fill(255,0,0);
    noStroke();
    textFont(text1, 30);    
    text("SKILL YOURSELF!", map(mouseX,0,width,0,width-260),mouseY);
  }
}
class Dots {
  int num, diam, dist;

  Dots(int num, int diam, int dist){
    this.num = num;
    this.diam = diam;
    this.dist = dist;
  }

 void process() {
  int myArray[][]  = new int[num][2]; 
  background(8, 16, 26);
    for (int i = 0; i < num; i++) {
      int x = (int) random(random(0,width-50), width);
      myArray[i][0] = x;
      int y;
      if (x >= width-200) {
          y = (int) random(random(70), height);
      } 
      else {
          y = (int) random(random(height-90,height-30), height);
      } 
      myArray[i][1] = y;
  }
 
  for (int i = 0; i < num; i++) {
      int x = myArray[i][0]; 
      int y = myArray[i][1];
      noStroke();
      fill(30, 100, 200, 40);  
      float d = random(diam);
      ellipse(x, y, d, d);
      stroke(255);
      strokeWeight(2);
      point(x, y);
      strokeWeight(0.5); 
      for (int j = i; j < num; j++) {
          int x1 = myArray[j][0];
          int y1 = myArray[j][1];
          if (abs(x - x1) < dist && abs(y - y1) < dist)
              line(x, y, x1, y1);      
      }
    }  
  }  
}


