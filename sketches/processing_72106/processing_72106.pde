
int counter;

float a = 700;
float ab = 700;
float valuea = 25; //green circle initial location  
float valueaUpdated;//
float valueWidth=10;///see below
float valueWidthUpdated; //green animated circle width
float valueRightY = 700;//circle upper L
float valueRightX= 1200;
float valueRightXUpdated;
float valueRightYUpdated;
int pos = 25;
int widtha = 10;
color myfill = color(204, 204, 51, 1);
color color2= color (125, 250, 250, 1);
float circleW = 50;
float circleH = 50;
float speedW = 10;///Position, this variable as in any other variable is a postiion in the plane
float speedH = 5;///
float speedPostH= 10;
float speedPostW = 5;
float Aline= 0;
float Bline=0;
float Aspeed=10;
float Bspeed =12;
float circPostW= 300;
float circPostH=300;

void setup () {
  size(700, 700);
  background (214, 225, 200);
}


void draw() {

  //fill (210, 215, 180, 10);///
  //rect (width, height, 1170, 670);

  /// arc, need to place in upper r corner
  noStroke();
  fill(250, 180, 100, 5);
  arc(700, 0, mouseY, mouseX, QUARTER_PI, PI+PI);

  //light black circle in background-self animated
  noStroke();
  valueRightY= valueRightY-10;
  valueRightYUpdated= valueRightY-10;
  valueRightX= valueRightX-10;
  valueRightXUpdated= valueRightX-10;
  fill (0, 10);
  ellipse (valueRightYUpdated, valueRightY-10, valueRightXUpdated, valueRightX-10);
  valueRightY=valueRightYUpdated;

  ///line:  horizontal
  frameRate(30);
  strokeWeight (20);
  stroke (120, 95, 35, 5);
  line (0, mouseY, 700, mouseY);

  //ellipse runs diag. w/ mouse movement
  frameRate(40);
  noStroke();
  fill (255, 255, 205, 10);
  ellipse (mouseX, mouseX, mouseY, mouseY); 

  //Arc bottom R
  frameRate(40);
  strokeWeight (0);  
  stroke (200, 134, 95, 25); 
  fill (200, 134, 95, 5);
  arc (a, a, pmouseX, pmouseY, PI, PI+PI); 

  ///green walking circle///
  //pos = 25;
  //widtha = 10;
  
  valueaUpdated= valuea+10;
  valueWidthUpdated= valueWidth+10;
  noStroke();
  fill(myfill);
  ellipse (pos,pos, widtha, widtha+2);
  pos+=10;
  widtha+=10;
  
  if (pos > 300) {
    myfill=(color2);
  }
  if (pos > 700){
    pos= 130;
      //light black circle in background-self animated
  noStroke();
  valueRightY= valueRightY-10;
  valueRightYUpdated= valueRightY-10;
  valueRightX= valueRightX-10;
  valueRightXUpdated= valueRightX-10;
  fill (0, 10);
  ellipse (valueRightYUpdated, valueRightY-10, valueRightXUpdated, valueRightX-10);
  valueRightY=valueRightYUpdated;
    
  }
}
  //create an if that will bounce the green ball back but change its color

void mouseDragged() {


  ///I make yellow bottom R corner light blue when I press top R side 
  if (mouseX > 350) {
    fill (204, 205, 255, 5);
    //fill (25, 130, 20, 10);
    noStroke();
    triangle (0, 0, 600, 700, 0, 700);
  }
  //pink triangle mousePress on upper R 
  if (mouseY < 350) {
    //fill (0);
    fill (205, 152, 24, 5);
    noStroke ();
    triangle (0, 130, 400, 700, 0, 700);
  }


  ////this makes yellow on the Upper Right hand Side when Press Bottom L
  if (mouseX < 250) {
    fill(205, 103, 20, 5);
    // fill (125, 200, 130, 5);
    noStroke();
    triangle (700, 0, 700, 700, 0, 0);
  }

  //blue triangle
  if (mouseY>250) {
    //fill (0, 5);
    fill (53, 104, 151, 5);
    noStroke();
    triangle (100, 0, 700, 200, 700, 0);
  }
}
void keyPressed() {

  //replace bkgrnd
  noStroke();
  fill (75, 75, 74, 10);
  rect (height, width, height, width);
  println(mouseX);
  println(mouseY);
  fill (100, 200, 200);
  noStroke();
  rect (width, height, width, height);

  //make this line move vertically or horizontally.
  Aline= 10+1;
  Bline += Bspeed;
  Aline += Aspeed;
  stroke (120);
  line (Aline, Bline, width, height);

  //purple ellipse large
  circleH += speedH ; ///cmd for optimal codign definig verb thing
  circleW += speedW;// Variabl ++ (adds one to each frame )
  fill (150, 100, 134, 1);
  noStroke();
  ellipse (circleW, circleH, 300, 200);
  
  ///end of drawe sans conditionals

  ///Don't know what this is actually doing.....it did alter the  returning objects' range...
  if (circleW > width || circleW <0) {
    speedH = random(100, 100);///when input here
    speedW = random (100, 10);///when input here
    speedH = speedH* (-1);
    speedW *= (-1);


    ///uses same variable as purple ellipse, but creates a triangle each time the ellipse regenerates in bottom R corner
    circleW= 0;
    circleH= 0;
    while (circleW < width) {
      circleW= circleW + 20;
      circleH= circleH + 20;
      noStroke();
      fill (100, 200, 40, 10);
      triangle (circleW, circleH, height, 500, 100, 10);

      //creates 2nd triangle in bottom R corner each time the ellipse regenerates in bottom R corner

      fill (250, 175, 200, 10);
      triangle (circPostW, circPostH, 100, 10, 70, height);
    
        
    if (circPostW< 10) {
      speedPostH= random(10, 20);
      speedPostW = random (5, 10);
      speedPostH = speedPostH* (-1);
      speedPostW *= (-1);


      circPostH = 0;
      circPostW =0;
      while (circPostW> 10) {
        circPostH  = circPostH + 20;
        circPostW = circPostW + 20;
        fill (50, 175, 200, 10);
        triangle (0, 0, 400, 200, 30, 200);
      
      
      ///make; when the line reaches height or width. it return.
      Aline=100;
      Bline=100;

      if (Aline > width || Bline > height) {
        Aline *= -1;
        Bline *= -1;

        line (Aline, 0, 0, Bline);
        
      }
    }
  }
}

}
}
