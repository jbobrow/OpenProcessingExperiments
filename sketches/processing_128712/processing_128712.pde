
int[] trail_x;
int[] trail_y;
int index = 0;
int lastX, lastY;
int w = 60;
int h = 60;
float t = 0.0;
float inc = 0.01;
int[]xpos = new int[50];
int[]ypos = new int[50];
color pencolor = #0C48F5;  //blue
float oldX, oldY; 
float yPos = 0.0; 

void setup()
{
  size(940,600,JAVA2D);
  background(70);
  strokeWeight(5);
  smooth();
  colorMode(HSB);
  trail_x = new int[50];
  trail_y = new int[50];
  for(int i =0; i<xpos.length; i++){
    xpos[i] = 0;
    ypos[i] = 0;}
}

void draw()
{
  if(mousePressed ==true);{}
  
  if(keyPressed == true) {  //Move the left player up.
  if(key ==' '){
  background(70);
  }}
  
  if(keyPressed == true) {  //Move the left player up.
    if(key =='1'){
    colorMode(HSB);
    noStroke();
    for (int i=0; i < trail_x.length; i++) {
    int pos = (index+i) % trail_x.length; // always end with the last mouse position to avoid the "jumping" effect
    fill(map(i, 1, trail_x.length, 200, 100), 255, 255, 200);  // we can use the counter for color and size  
    ellipse(trail_x[pos], trail_y[pos], 40-i, 40-i); 
    }}
  
  if(keyPressed == true) {
  if(key =='2'){
  colorMode(RGB);
  noStroke();
  ellipse(mouseX,mouseY,130, 130);
  fill(250,random(0,250),250);
  }}
  
  if(keyPressed == true) {  //CUBES
  if(key =='3'){
  noStroke();
  colorMode(RGB);
  ellipse(mouseX,mouseY,60, 60);
  fill(random(0,255),mouseY/4,mouseX/4);
  }}
  
  if(keyPressed == true) {  //Move the left player up.
  if(key =='4'){
  colorMode(HSB);
  noStroke();
  lastX = mouseX;
  lastY= mouseY; 
  float r = random(1, 500);
  stroke(r,r,r,540);
  strokeWeight(1); 
  noFill();

  
  ellipse(lastX, lastY, 200, 200);
 }}
 
  if(keyPressed == true) {  //Move the left player up.
  if(key =='5'){
  colorMode(RGB);
  noStroke();
  ellipse(mouseX+random(-50,50),mouseY+random(-50,50),3,3);
  fill(random(1,255),mouseX,0);
 }}
 
  if(keyPressed == true) {  //Move the left player up.
  if(key =='6'){
  colorMode(RGB);
  noStroke();
  lastX = mouseX;
  lastY= mouseY; 
  float r = random(1, 20);
  stroke(0,255,0);
  strokeWeight(1); 
  noFill();
  ellipse(lastX, lastY, r, r);
 }}
 
 
  if(keyPressed == true) {  
  if(key =='7'){
    float c = noise(t)*width/2;
  t += inc;
  noStroke();
  colorMode(HSB);
  fill(c,255,random(255));
  /// for beginning row 
  for(int x = 0; x<=width; x+=w)
    for(int y = 0; y<=height; y+=h*2)       if(mouseX > x-w/2 && mouseX <= x+w/2)         if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x-w/2,y+h,x+w/2,y+h);
  /// for shifted row
  for(int x = -w/2; x<=width; x+=w)
    for(int y = h; y<=height; y+=h*9)       if(mouseX > x-w/2 && mouseX <= x+w/2)         if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x-w/2,y+h,x+w/2,y+h);
  /// for inverted beginning row 
  for(int x = 0; x<=width; x+=w)
    for(int y = 0; y<=height; y+=h*2)       if(mouseX > x && mouseX <= x+w)         if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x+w,y,x+w/2,y-h);
 
  /// for inverted shifted row 
  for(int x = -w/2; x<=width; x+=w)
    for(int y = h; y<=height; y+=h*2)       if(mouseX > x && mouseX <= x+w)         if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x+w,y,x+w/2,y+h);
 }}
 
 
   if(keyPressed == true) {
  if(key =='8'){
   colorMode(HSB);
   
  /// SHIFT
  for(int i=0; i<xpos.length-1; i++){
    xpos[i]= xpos[i+1];
    ypos[i]= ypos[i+1];
  }
   
  /// NEW LOC
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
   
  // DRAW
  for(int i=1; i<xpos.length; i++){     strokeWeight(255-i*5);     stroke(random(255-i,200),255-i*5,255-i*5);     line(xpos[i],ypos[i],xpos[i-1],ypos[i-1]);   }}}        if(keyPressed == true) {  //Move the left player up.   if(key =='9'){   colorMode(RGB);   stroke(pencolor);    strokeWeight(2);   line (mouseX, mouseY, oldX, oldY);   oldX=mouseX;   oldY=mouseY;  }}      if(keyPressed == true) {  //Move the left player up.   if(key =='0'){   colorMode(RGB);   stroke(0);   strokeWeight(1);   line(mouseX, mouseY, width, mouseY);  }}      ///////BACKGROUND/////////   if(keyPressed == true) {       if(key =='!'){       colorMode(RGB);      //blue-background     background(500);   }}         if(keyPressed == true) {       if(key =='@'){       colorMode(RGB);      //red-background     background(250, 0, 0);   }}         if(keyPressed == true) {       if(key =='#'){       colorMode(RGB);      //green-background     background(0, 250, 0);   }}         if(keyPressed == true) {       if(key =='$'){       colorMode(RGB);      //cyan-background     background(0, 250, 250);   }}       if(keyPressed == true) {     if(key =='%'){     colorMode(RGB);      //yellow-background   background(250, 250, 0);   }}       if(keyPressed == true) {       if(key =='^'){       colorMode(RGB);      //magenta-background     background(250, 0, 250);   }}       if(keyPressed == true) {       if(key =='&'){       colorMode(RGB);      //white-background     background(250, 250, 250);   }}       if(keyPressed == true) {       if(key =='*'){       colorMode(RGB);      //cyan-background     background(0);   }}       if(keyPressed == true) {       if(key =='('){       colorMode(RGB);      //cyan-background     background(175);   }}       if(keyPressed == true) {       if(key ==')'){       colorMode(RGB);      //cyan-background     background(100,100,100);   }}       if(mousePressed ==false);   {   }  }} void mouseMoved() {   trail_x[index] = mouseX;   trail_y[index] = mouseY;   index++;   if (index >= trail_x.length) index = 0;
}
