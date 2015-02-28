
// Mark Adam Webster Man
// by Daniel Jovanov

void setup() {
  size(480, 640);
} // setup()

/*
Make a "sketch" of a futurist man with curves, arcs, lines,
and even quads and triangles. Make that man based off of the atro-
cious box art for the original "Mega Man."

Jan 16
*/

/*
In order to eliminate confusion with coloring each primitive,
I must create a separate class for each primitive I want to make.
Integers r, g and b are the red, green and blue values respectively,
and the x, y, w and h integers are the x-coordinate, y-coordinate,
width and height respectively.
Jan 16
*/

void drawEllipse(int r, int g, int b, int x, int y, int w, int h) {
  fill(r,g,b);
  ellipse(x,y,w,h);
} // drawEllipse(r,g,b,x,y,w,h)

void drawArc(int r, int g, int b, float x, float y, float w, float h,
                    float start, float end) {
  fill(r,g,b);
  arc(x,y,w,h,start,end);  
} // drawArc(r,g,b,x,y,w,h,start,end)

void drawTriangle(int r, int g, int b, int x1, int y1, int x2,
                  int y2, int x3, int y3) {
  fill(r,g,b);
  triangle(x1,y1,x2,y2,x3,y3);
} // drawTriangle(r,g,b,x1,y1,x2,y2,x3,y3)

void drawQuad(int r, int g, int b, int x1, int y1, int x2, int y2,
              int x3, int y3, int x4, int y4) {
  fill(r,g,b);
  quad(x1,y1,x2,y2,x3,y3,x4,y4);  
} // drawQuad()

void drawRectangle(int r, int g, int b, int x, int y, int w,
                          int h) {
  fill(r,g,b);
  rect(x,y,w,h);
}

// On to drawing

void draw() {
  background(0,60,255);
  
  // body
  drawQuad(255,255,0,215,350,215,415,290,420,295,340);
  
  // pelvis
  drawTriangle(255,255,0,240,416,270,418,250,450);
  
  // legs
  
  // left
  drawQuad(0,0,120,215,415,240,416,250,450,205,470); // thigh
  // calf
  drawTriangle(255,255,0,215,415,205,470,185,490);
  drawQuad(0,0,120,205,470,185,490,185,520,210,520);
  // foot
  drawRectangle(255,255,0,160,520,50,20);
  
  // right
  drawQuad(0,0,120,290,418,270,417,250,450,296,460);
  // calf
  drawTriangle(255,255,0,290,418,296,460,310,470);
  drawQuad(0,0,120,296,460,310,470,310,500,296,500);
  // foot
  drawRectangle(255,255,0,296,500,40,20);
  
  //head
  drawEllipse(250,120,120,270,325,50,60);
  drawArc(0,0,120,270,320,50,50,PI,TWO_PI);
  drawTriangle(255,255,0,260,295,280,295,270,320);
  
  // eyebrows
  line(270,325,245,320);
  drawTriangle(0,0,0,270,325,295,320,295,325);
  
  // nose
  drawArc(255,150,120,270,335,10,20,PI+HALF_PI,TWO_PI+HALF_PI);
  
  // eyes
  drawEllipse(60,0,255,257,333,20,15); // left socket
  drawQuad(60,0,255,275,330,290,325,290,335,275,335);// right socket
  drawEllipse(255,255,0,264,333,7,7); // left pupil
  drawTriangle(255,255,0,275,335,282,335,282,340); // right pupil
  
  // mouth
  drawRectangle(255,0,0,260,345,20,7);
  
  //arms
  
  // left
  drawQuad(0,0,120,185,335,175,405,205,405,245,335);
  drawEllipse(0,0,120,215,350,70,50);
  drawArc(255,255,0,225,350,50,50,PI+HALF_PI,TWO_PI+HALF_PI);
  drawTriangle(0,0,120,175,405,205,405,190,425);
  // hand
  drawEllipse(0,0,180,190,415,30,30); 
  line(190,400,190,430);
  line(200,405,200,425);
  line(180,405,180,425);
  
  // right
  drawQuad(0,0,120,298,370,335,350,360,390,310,390);
  drawEllipse(0,0,120,315,350,50,50);
  drawArc(255,255,0,315,350,50,50,HALF_PI+QUARTER_PI,PI+HALF_PI+QUARTER_PI);
  drawTriangle(0,0,180,310,390,360,390,360,410);
  // hand
  drawQuad(0,0,180,310,390,360,410,300,410,290,390);
  
} // draw()
// end of file



