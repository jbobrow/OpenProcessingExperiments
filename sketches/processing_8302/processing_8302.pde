
// Assignment6: Puh-lay

int page = 0;
PFont font48, font20;
float xe = 0; //easing
float ye = 0;
float easing = 0.05;
float be = 0;
float angle = 0;
int b0Lx = 30; // button to start
int b0Ly = 250;   
int b0Lw = 25;    
int b0Lh = 25; 
int num = 220; // Linecode
float x[] = new float[num];
float y[] = new float[num];
int xD =0;
int yD =1;
float circleRadius = 25; // circ
int timer = 0; //timer 
int timer2 = 0;
int timer3 = 0;
int timer4 = 0;
int timergame = 0;
float glow = 0; 
float glow2 = 0;
float glow3 = 0; 
float glow4 = 0; 
float glow5 = 0; 
float glow6 = 0; 






void setup (){
  size(480, 320);
  smooth();
  cursor(CROSS);
  for (int i = 0; i < num; i++) {  
    x[i] = width/2 + 200;
    y[i] = height/2 + 100;
  }
  font48 = loadFont("BellGothicStd-Black-48.vlw");
  font20 = loadFont("BellGothicStd-Black-14.vlw");
}



void draw() { 
  if (page == 0) { 
    INTRO (); 
  }  
  else if (page == 1) { 
    CIRCINTRO (); 
  }  
  else if (page == 2) { 
    LINEINTRO (); 
  }  
  else if (page == 3) { 
    GAMEPREP (); 
  }  
  else if (page == 4) { 
    GAME ();  
  } 
  else if (page == 5) { 
    CWIN ();  
  }  
  else if (page == 6) { 
    LWIN ();  
  }  
  else if (page == 7) { 
    FAIL ();  
  }    
}//voidDraw ends here



void mousePressed() { 
  //  println(page);
  if (page == 0) { 
    if (overButton(b0Lx, b0Ly, b0Lw, b0Lh) == true) { 
      page = 4;    
    } 
    else {
      page = 1;
    }
  } 
  else if (page == 1) { 
    page = 2;
  } 
  else if (page == 2) { 
    page = 3;
  } 
  else if (page == 3) { 
    page = 4;
  } 
} //mousePressed ends

boolean overButton(int x, int y, int w, int h) { 
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) { 
    return true;  
  }  
  else { 
    return false;  
  } 
} //overbutton boolean ends





void INTRO (){
  background(0);
  fill(255, glow);
  if ((timer > 30) && (timer < 100)) {
    textAlign(CENTER);
    textFont (font20);
    text("The Game", width/2, 55);
  }
  if (timer > 60) {
    textAlign(CENTER);
    textFont(font48);
    text("Vice Versa", width/2, 100);
  }  
  if (timer > 100) {
    fill(150, glow2);
    textAlign(CENTER);
    textFont (font20);    
    text("Click to Continue", width/2, 127);
    glow2 ++;
  }
  stroke(255, 50);
  noFill();
  ellipseMode(CORNER);
  ellipse(30, 250, 25, 25);
  if ((mouseX>30) && (mouseX<55) && (mouseY>250) && (mouseY<275)) {
    fill(255, 100);
    textAlign(CORNER); 
    textFont(font20);   
    text("Skip instructions, play NOW", 65, 263, 300, 400);
  } 
  fill(255, 0, 0);
  timer ++;
  glow ++;
} //INRO ends here


void CIRCINTRO (){
  background(0);
  fill(255, glow3);
  if (timer2 > 30) {
    textAlign(CORNER);
    textFont (font20);
    text("Player1, the circle", 50, 50);
  }
  if (timer2 > 60) {
    text("Controled by the mouse", 50, 65);
  }
  if (timer2 > 90) {
    text("Objective is to reach the edges of the screen", 50, 80);
  }
  glow3 ++;
  timer2 ++;
} //circle intro ends  


void LINEINTRO (){
  background(0);
  fill(255, glow4);
  if (timer3 > 30) {
    textAlign(CORNER);
    textFont (font20);
    text("Player2, the Line", 50, 50);
  }
  if (timer3 > 60) {
    text("Controled by the arrow keys.", 50, 65);
  }
  if (timer3 > 90) {
    text("Objective is to keep circle enclosed for 1 minute", 50, 80);
  }
  if (timer3 > 130) {
    text("Click to start game", 50, 120);
  }
  glow4 ++;
  timer3 ++;
} //Line intro ends    


void GAMEPREP (){
  background(0);
  fill(255);
  if (timer4 > 30) {
    textAlign(CORNER);
    textFont (font20);
    text("Line, are you ready?", 50, 80);
  }
  if (timer4 > 70) {
    text("you have 10 secs to surround the circle ", 50, 100);
  }
  if (timer4 > 130) {
    text("while the circle is kept still", 50, 120);
  }
  if (timer4 > 160) {
    fill(0, glow5);
    rect(-10, -10, 500, 340);
    glow5 ++;
  }
  if (timer4 > 450) {
    fill(255);
    text("One Last thing,", 50, 140);
  }
  if (timer4 > 500) {
    text("The Line shall not touch the circle", 50, 160);
  }
  if (timer4 > 550) {
    text("and Vice Versa,", 50, 180);    
  }
  if (timer4 > 600) {
    fill(0, glow6);
    rect(-10, -10, 500, 340);
    glow6 ++;
  }
  if (timer4 > 900) {
    page = 4;
  }
  timer4 ++;
} //Line intro ends 





void GAME (){
  background(0);
  float targetX = mouseX; //Circle
  float targetY = mouseY; 
  xe += (targetX - xe) * easing;
  ye += (targetY - ye) * easing;
  float v = dist(mouseX, mouseY, pmouseX, pmouseY);
  float r = map(sin(radians(angle)), 0.0, 1.0, 0.75, 1.0);
  float b = map(v, 0.0, 5.0, 80.0, 255.0);
  float targetB = b;
  be += (targetB - be) * easing;
  noStroke();
  if (timergame <= 605){
    fill(255, 50);
    mouseX = constrain(mouseX, 235, 245);
    mouseY = constrain(mouseY, 155, 165);
    ellipse(mouseX, mouseY, circleRadius*r, circleRadius*r);
  }  
  else if (timergame > 605){
    fill(80, 80, be);
    ellipse(xe, ye, circleRadius*r, circleRadius*r);
    if ((xe < 10.0) || (xe > 470.0) || (ye < 10.0) || (ye > 310.0)) {
      page = 5;
    }
  } 
  if (timergame >= 6000){
    page = 6;
  }

  stroke(255); //Line
  strokeWeight(2);
  for(int i=1; i<num; i++) {
    line(x[i], y[i], x[i-1], y[i-1]);
    x[i-1] = x[i];
    y[i-1] = y[i];
    x[num-1] -= 0.015*xD; //line moves automatically 
    y[num-1] -= 0.015*yD;
  }
  if (circleLineIntersect(x[219], y[219], x[210], y[210], xe, ye, circleRadius*r) == true) { //more smaller segments more accurate
    page = 7;  
  }
  if (circleLineIntersect(x[210], y[210], x[200], y[200], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[200], y[200], x[190], y[190], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[190], y[190], x[180], y[180], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[180], y[180], x[170], y[170], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[170], y[170], x[160], y[160], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[160], y[160], x[150], y[150], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[150], y[150], x[140], y[140], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[140], y[140], x[130], y[130], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[130], y[130], x[120], y[120], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[130], y[130], x[120], y[120], xe, ye, circleRadius*r) == true) {
    page = 7;  
  }
  if (circleLineIntersect(x[120], y[120], x[110], y[110], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[110], y[110], x[100], y[100], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[100], y[100], x[90], y[90], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[90], y[90], x[80], y[80], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[80], y[80], x[70], y[70], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  } 
  if (circleLineIntersect(x[70], y[70], x[60], y[60], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[60], y[60], x[50], y[50], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[50], y[50], x[40], y[40], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }    
  if (circleLineIntersect(x[40], y[40], x[30], y[30], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[30], y[30], x[20], y[20], xe, ye, circleRadius*r) == true) {
    page = 7;  
  }
  if (circleLineIntersect(x[20], y[20], x[10], y[10], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }
  if (circleLineIntersect(x[10], y[10], x[0], y[0], xe, ye, circleRadius*r) == true) { 
    page = 7;  
  }

  if ((timergame > 0) && (timergame < 60)){
    text("10", 50, 50);
  }
  if ((timergame > 60) && (timergame < 120)){
    text("9", 50, 50);
  }
  if ((timergame > 120) && (timergame < 180)){
    text("8", 50, 50);
  }
  if ((timergame > 180) && (timergame < 240)){
    text("7", 50, 50);
  }  
  if ((timergame > 240) && (timergame < 300)){
    text("6", 50, 50);
  }
  if ((timergame > 300) && (timergame < 360)){
    text("5", 50, 50);
  }
  if ((timergame > 360) && (timergame < 420)){
    text("4", 50, 50);
  }
  if ((timergame > 420) && (timergame < 480)){
    text("3", 50, 50);
  }
  if ((timergame > 480) && (timergame < 540)){
    text("2", 50, 50);
  }
  if ((timergame > 540) && (timergame < 600)){
    text("1", 50, 50);
  }
  if ((timergame > 360) && (timergame < 420)){
    text("circle", 50, 75);
  }
  if ((timergame > 420) && (timergame < 480)){
    text("Ready", 50, 75);
  }
  if ((timergame > 480) && (timergame < 540)){
    text("Get Set", 50, 75);
  }
  if ((timergame > 540) && (timergame < 600)){
    text("GO!", 50, 75);
  }


  if (y[219] < 5) { //restrict activity of the line
    yD = 0;
    xD = 1;
  }
  if (x[219] < 5) {
    xD = 0;
    yD = -1;
  }
  if (y[219] > 315) {
    yD = 0;
    xD = -1;
  }  
  if (x[219] >  475) {
    xD = 0;
    yD = 1;
  }  



  println(y[219]);


  timergame ++;  
  angle ++;
  //println(timergame);
} //voidGame ends here



void keyPressed() {
  if ((key == 'a')||(keyCode == LEFT)) {
    xD = 1;
    yD = 0;
  } 
  else if ((key == 'd')||(keyCode == RIGHT)) {
    xD = -1;
    yD = 0;
  } 
  else if ((key == 's')||(keyCode == DOWN)) {
    xD = 0;
    yD = -1;
  } 
  else if ((key == 'w')||(keyCode == UP)) {
    xD = 0;
    yD = 1;
  } 
}

boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) { 
  float dx = x2 - x1; 
  float dy = y2 - y1; 
  float a = dx * dx + dy * dy; 
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy)); 
  float c = cx * cx + cy * cy; 
  c += x1 * x1 + y1 * y1; 
  c -= 2 * (cx * x1 + cy * y1); 
  c -= cr * cr; 
  float bb4ac = b * b - 4 * a * c; 
  //println(bb4ac); 
  if (bb4ac < 0) {  // Not intersecting 
    return false; 
  }  
  else { 
    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a); 
    float ix1 = x1 + mu*(dx); 
    float iy1 = y1 + mu*(dy); 
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a); 
    float ix2 = x1 + mu*(dx); 
    float iy2 = y1 + mu*(dy); 
    // The intersection points 
    //ellipse(ix1, iy1, 10, 10); 
    //ellipse(ix2, iy2, 10, 10); 
    float testX; 
    float testY; 
    // Figure out which point is closer to the circle 
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) { 
      testX = x2; 
      testY = y2;  
    } 
    else { 
      testX = x1; 
      testY = y1;  
    } 
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) { 
      return true; 
    } 
    else { 
      return false; 
    } 
  } 
} //boolean intersect code ends








void CWIN (){
  background(0);
  fill(255);
  textFont (font48);
  textAlign(CENTER);
  text("Circle Win", width/2, height/2);
}  


void LWIN (){
  background(0);
  fill(255);
  textFont (font48);
  textAlign(CENTER);
  text("Line Win", width/2, height/2);
}  


void FAIL (){
  background(0);
  fill(255);
  textFont (font48);
  textAlign(CENTER);
  text("You Have Failed", width/2, height/2);
}  













