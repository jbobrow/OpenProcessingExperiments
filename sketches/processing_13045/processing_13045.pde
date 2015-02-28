
 /* Reginal Cherislin
    CST 112
    Move Ellipse and Rect with  MouseX & KeyPressed   */
         
int x;
int y;
int mx;
int my;

void setup() {        //do 1 start
  size(600,600);
  smooth();
  x = width/2;        //set width to x to middle
  y = height/2;       //set height to y to middle
}                            //do 1 end

void draw() {                     // do 2 start
  background(255);
  mx = mouseX;               // set mouseX to mx
  my = mouseY;               // set mouseY to my
    fill(12,12,244);
  rectMode(CENTER);
  rect(x,y,200,200);        //x and y is set to screen's middle

  fill(244,244,3);
  ellipse(mx,my,200,200);   // mx is set to mouseY and my is set to mouseX
}                               // do 2 end

void keyPressed() {          //   do 3
  x =  mouseX;                        // keyPressed x set to mouseX
  y = mouseY;                         // keyPressed y set to mouseY
   }                                     // end  do 3
                
