
/*
- - - - - - - - - 
WEATHER CLOCK 1.0 - Ricardov
 - - - - - - - - - 
 
 CONCEPT
 - - - - - - - - - 
 This is the part one of an idea about showing the variation of weather through the time.
 This will show the evolution of the temperature in a 24 hours day.
 
 
 DESCRIPTION
 - - - - - - - - - 
 A line will rotate to clock wise direction each minute, and its color value will represent the temperature in the moment.
 To get the data, it must be conected via web, but due time, just will get info from a list insidethe sketch.
 
 
 Pseudocode
 - - - - - - - - - 
 Read day-hour-minute data. 
 Start at 00:01 hrs
 Map temp to Color
 Draw and Rotate Line
 Paint Line color = temp. 
 Rotate line each second, minute, hour.
 Update line pos.
 Update line color.
 Ending 23:59:59 take new day data.
 
 Options: typography coloured w t color
 Store data in depth z by days.
 
 INSPIRATIONS 
 - - - - - - - - - 
 Industrious clock. Yugo Nakamura. - http://yugop.com/ver3/index.asp?id=3
 KHRONOS PROJECTOR. Alvaro cassinelli. - http://www.k2.t.u-tokyo.ac.jp/members/alvaro/Khronos/#VisualContent  
 
 */

int largoBarra = 200;
int mov = 0;
float theta= 0.0;

void setup() {
  smooth();
  size(600, 600);
  frameRate(60);
  background(50);
}


void draw() {
  int posX= width/2;
  int posY= height/2;
  theta += 0.01; 

  mov = mov+1;

  noStroke();
  translate(posX, posY);
  rotate(theta);
  forma(0, 0, mouseX/2, mouseX/12);
}

void forma(int x, int y, int colora, int tamX) {
  for (int i=0; i< 100; i= i+10) {

    noStroke();    
    fill(colora-i, mouseX/4, mouseX/3);
    rect(x+i, y-3, largoBarra, 3);

    stroke(250, 50, 50);
    ellipse(mouseX/2, y, 5, 5);

    //    fill(0, 0, 25);
    //  rect(x+i, y, 200, 1);
  }
}







