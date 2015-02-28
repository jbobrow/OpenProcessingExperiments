
//////////////////////////////////////////////////
//CONTROLS:
//Keyboard - Press N or n for "New" (will display a new randomly generated material pattern)
//Keyboard - Press ENTER (will display the gradient heat map based on the material pattern)
//Keyboard - Press BACKSPACE (will go back to the material pattern)
//Keyboard - Press C or c for "Color" (will display the pixel color pattern used to generate the gradient heat map)
//Keyboard - Press UP ARROW (will increase the rural air temperature (max temp set at 100°F))
//Keyboard - Press DOWN ARROW (will decrease the rural air temperature (min temp set at 0°F))

//Mouse - LEFT BUTTON click (will display the ST (Surface Temp) of the material where clicked and RT (Rural Air Temp) on top of the gradient map)
//Mouse - RIGHT BUTTON click (will display the ST (Surface Temp) of the material where clicked and RT (Rural Air Temp) on top of the material map)
//////////////////////////////////////////////////


//////////////////////////////////////////////////
int numColor = 8;
Color[] col = new Color[numColor];
Overlay[] over = new Overlay [600];
Rectangle[] rec = new Rectangle [600];
//////////////////////////////////////////////////
int temp = 65;  //set the temperature  
float[] alb = {0.115, 0.125, 0.165, 0.225, 0.250, 0.275, 0.300, 0.675};  
//1.asphalt/tar/gravel || 2.corrugated metal || 3.trees || 4.concrete/red-brown tile || 5.colored paint || 6.grass || 7.brick/stone || 8.white paint/reflective roof
//alb represents the albedos absorption value of the materials 
float[] values = {((1/alb[0])+((temp-32)/1.8)), ((1/alb[1])+((temp-32)/1.8)), ((1/alb[2])+((temp-32)/1.8)), ((1/alb[3])+((temp-32)/1.8)), ((1/alb[4])+((temp-32)/1.8)), ((1/alb[5])+((temp-32)/1.8)), ((1/alb[6])+((temp-32)/1.8)), ((1/alb[7])+((temp-32)/1.8))};  
//values converts the temp into celcius to calculate the surface temp of the materials
int[] newTemp = {(round(((values[0]*1.8)+32))),(round(((values[1]*1.8)+32))),(round(((values[2]*1.8)+32))),(round(((values[3]*1.8)+32))),(round(((values[4]*1.8)+32))),(round(((values[5]*1.8)+32))),(round(((values[6]*1.8)+32))),(round(((values[7]*1.8)+32)))};
//newTemp converts the values of celcius back to fahrenheit
int tRed[] = {(round((map((newTemp[0]), 2, 116, 0, 255)))), (round((map((newTemp[1]), 2, 116, 0, 255)))), (round((map((newTemp[2]), 2, 116, 0, 255)))), (round((map((newTemp[3]), 2, 116, 0, 255)))), (round((map((newTemp[4]), 2, 116, 0, 255)))), (round((map((newTemp[5]), 2, 116, 0, 255)))), (round((map((newTemp[6]), 2, 116, 0, 255)))), (round((map((newTemp[7]), 2, 116, 0, 255))))};
int tGreen[] = {(round((map(1, 1, 8, 100, 150)))), (round((map(2, 1, 8, 100, 150)))), (round((map(3, 1, 8, 100, 150)))), (round((map(4, 1, 8, 100, 150)))), (round((map(5, 1, 8, 0, 50)))), (round((map(6, 1, 8, 100, 150)))), (round((map(7, 1, 8, 100, 150)))), (round((map(8, 1, 8, 100, 150))))};
int tBlue[] = {(round((map((newTemp[0]), 2, 116, 100, 255)))), (round((map((newTemp[1]), 2, 116, 100, 255)))), (round((map((newTemp[2]), 2, 116, 100, 255)))), (round((map((newTemp[3]), 2, 116, 100, 255)))), (round((map((newTemp[4]), 2, 116, 100, 255)))), (round((map((newTemp[5]), 2, 116, 100, 255)))), (round((map((newTemp[6]), 2, 116, 100, 255)))), (round((map((newTemp[7]), 2, 116, 100, 255))))};
//RGB values for the gradient map are calculated using the new surface temp (newTemp[]) of the materials mapped for an increase of air temp to show more pink hues and a decrease of air temp to show more blue hues  
//////////////////////////////////////////////////
PFont fontA;  //load font to display the ST and RT values on the screen 
//////////////////////////////////////////////////


//////////////////////////////////////////////////
void setup(){
  size(900,600,P3D);
  colorMode(RGB);
  background(0);
  fontA = loadFont("index.vlw");  //load the font type file for use (must be in the sketch folder with the .pde file)
  textFont(fontA, 25);
  noStroke();
  col[0] = new Color((tRed[0]),(tGreen[0]),(tBlue[0]), loadImage ("t.bmp")); //load the asphalt/tar/gravel image file for use (must be in the sketch folder with the .pde file)
  col[1] = new Color((tRed[1]),(tGreen[1]),(tBlue[1]), loadImage ("c.bmp")); //load the corrugated metal image file for use (must be in the sketch folder with the .pde file)
  col[2] = new Color((tRed[2]),(tGreen[2]),(tBlue[2]), loadImage ("v.bmp")); //load the trees image file for use (must be in the sketch folder with the .pde file)
  col[3] = new Color((tRed[3]),(tGreen[3]),(tBlue[3]), loadImage ("r.bmp")); //load the concrete/red-brown tile image file for use (must be in the sketch folder with the .pde file)
  col[4] = new Color((tRed[4]),(tGreen[4]),(tBlue[4]), loadImage ("p.bmp")); //load the colored paint image file for use (must be in the sketch folder with the .pde file)
  col[5] = new Color((tRed[5]),(tGreen[5]),(tBlue[5]), loadImage ("g.bmp")); //load the grass image file for use (must be in the sketch folder with the .pde file)
  col[6] = new Color((tRed[6]),(tGreen[6]),(tBlue[6]), loadImage ("b.bmp")); //load the brick/stone image file for use (must be in the sketch folder with the .pde file)
  col[7] = new Color((tRed[7]),(tGreen[7]),(tBlue[7]), loadImage ("w.bmp")); //load the awhite paint/reflective roof image file for use (must be in the sketch folder with the .pde file)
  //color array values and corresponding images relate to order of array for temperatures
  int index = 0;
  while(index<600){
    for (int x=15; x<width; x+=30){
      for (int y=15; y<height; y+=30){
        rec[index] = new Rectangle(x, y, loadImage ("g.bmp"));
        index++;}}}  //draws 600 rectangles at 30x30 pixels (order drawn starts at top left and goes down to top of next column)
  randomColor();  //assigns each rectangle a random color value
  for (int o=0; o<over.length; o++){
    over[o] = new Overlay(rec[o].xMid, rec[o].yMid);}  //offsets a rectangle to create the gradient map using the middle point and color of each rectangle drawn for each vertex   
  for (int i=0; i<rec.length; i++){
    rec[i].imagedisplay();}  //overlays an image corresponding to the color value        
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//random color generator to display a new material map pattern (i.e. for use in keyPressed N or n) 
void randomColor(){
  for (int i=0; i<rec.length; i++){
    int c = int(random(0,8));
    rec[i].r = col[c].r;
    rec[i].g = col[c].g;
    rec[i].b = col[c].b;
    rec[i].matimage = col[c].img;
    rec[i].colorIndex = c;
    
    rec[i].display();}
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//resets the state of the last generated pattern (i.e. for use in BACKSPACE)
void updateColor(){
  for (int i=0; i<rec.length; i++){
    int c = rec[i].colorIndex;
    
    rec[i].r = col[c].r;
    rec[i].g = col[c].g;
    rec[i].b = col[c].b;
    
    rec[i].display();}
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//need to keep for program to run although is empty function
void draw(){ 
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//updates the values of the temperature after pressing up or down arrows and displays the ST and RT values on the screen
void mousePressed(){
  float[] values = {((1/alb[0])+((temp-32)/1.8)), ((1/alb[1])+((temp-32)/1.8)), ((1/alb[2])+((temp-32)/1.8)), ((1/alb[3])+((temp-32)/1.8)), ((1/alb[4])+((temp-32)/1.8)), ((1/alb[5])+((temp-32)/1.8)), ((1/alb[6])+((temp-32)/1.8)), ((1/alb[7])+((temp-32)/1.8))};  
  int[] newTemp = {(round(((values[0]*1.8)+32))),(round(((values[1]*1.8)+32))),(round(((values[2]*1.8)+32))),(round(((values[3]*1.8)+32))),(round(((values[4]*1.8)+32))),(round(((values[5]*1.8)+32))),(round(((values[6]*1.8)+32))),(round(((values[7]*1.8)+32)))};
  for (int i=0; i<rec.length; i++){
    rec[i].display();}
  
  //if click left mouse button, will display the ST and RT values on the gradient map pattern
  //starts with loading the color pixel boxes seen with keyPressed C or c, grabs the color pixel info of the RGB, compares it to the color value stored for the rectangle and then displays the correct temp value 
  if ((mousePressed == true) && (mouseButton == LEFT)){
    color a = get(mouseX, mouseY);
    int getR = ((a >> 16) & 0xFF);
    int getG = ((a >> 8) & 0xFF);
    int getB = (a & 0xFF);              
    if ((getR == col[0].r) && (getG == col[0].g) && (getB == col[0].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[0], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);
      println(newTemp[0]);}
    if ((getR == col[1].r) && (getG == col[1].g) && (getB == col[1].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[1], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[1]);}       
    if ((getR == col[2].r) && (getG == col[2].g) && (getB == col[2].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[2], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[2]);}   
    if ((getR == col[3].r) && (getG == col[3].g) && (getB == col[3].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[3], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[3]);}        
    if ((getR == col[4].r) && (getG == col[4].g) && (getB == col[4].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[4], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[4]);}        
    if ((getR == col[5].r) && (getG == col[5].g) && (getB == col[5].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[5], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[5]);}      
    if ((getR == col[6].r) && (getG == col[6].g) && (getB == col[6].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[6], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[6]);}     
    if ((getR == col[7].r) && (getG == col[7].g) && (getB == col[7].b)){
      gradient();
      fill(0,0,0,255);
      text("ST="+newTemp[7], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[7]);}}

//if click right mouse button, will display the ST and RT values on the image map pattern
//starts with loading the color pixel boxes seen with keyPressed C or c, grabs the color pixel info of the RGB, compares it to the color value stored for the rectangle and then displays the correct temp value 
  if ((mousePressed == true) && (mouseButton == RIGHT)){
    color a = get(mouseX, mouseY);
    int getR = ((a >> 16) & 0xFF);
    int getG = ((a >> 8) & 0xFF);
    int getB = (a & 0xFF);              
    if ((getR == col[0].r) && (getG == col[0].g) && (getB == col[0].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[0], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);
      println(newTemp[0]);}
    if ((getR == col[1].r) && (getG == col[1].g) && (getB == col[1].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[1], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[1]);}       
    if ((getR == col[2].r) && (getG == col[2].g) && (getB == col[2].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[2], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[2]);}   
    if ((getR == col[3].r) && (getG == col[3].g) && (getB == col[3].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[3], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[3]);}        
    if ((getR == col[4].r) && (getG == col[4].g) && (getB == col[4].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[4], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[4]);}        
    if ((getR == col[5].r) && (getG == col[5].g) && (getB == col[5].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[5], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[5]);}      
    if ((getR == col[6].r) && (getG == col[6].g) && (getB == col[6].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[6], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[6]);}     
    if ((getR == col[7].r) && (getG == col[7].g) && (getB == col[7].b)){
      for (int i=0; i<rec.length; i++){
        rec[i].imagedisplay();}
      fill(0,0,0,255);
      text("ST="+newTemp[7], mouseX, mouseY);
      text("RT="+temp, mouseX, mouseY+30);      
      println(newTemp[7]);}}      
}      
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//setup to draw the 600 rectangles with a height and width of 30x30 pixels drawn from the center point of the rectangle, and links it to a material image
class Rectangle{
  int xMid, yMid;  //set the dimension parameters of the rectangle
  int ht = 30;
  int wd = 30;
  int r, g, b;
  int colorIndex;
  PImage matimage;

  Rectangle(int xpos, int ypos, PImage material){
    xMid = xpos;
    yMid = ypos;
    matimage = material;}

  void display(){  
    rectMode(CENTER); 
    fill(r, g, b); 
    rect(xMid, yMid, ht, wd);}
  
  void imagedisplay(){  
    rect(xMid, yMid, ht, wd);
    image (matimage, (xMid-15), (yMid-15),30,30);}
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//setup the color of each rectangle to link to a specific corresponding image of temperature value
class Color{
  int r, g, b;  //set the dimension parameters of the rectangle
  PImage img;

  Color(int rRec, int gRec, int bRec, PImage ig){     
    r = rRec;
    g = gRec;
    b = bRec;
    img = ig;}
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//sets up the overlay offset rectangle pattern for the gradient map
class Overlay{
  int x, y;
  int ht = 30;
  int wd = 30; 
  int temp = 75;  //set the temperature 
  Overlay(int xpos, int ypos){
    x = xpos;
    y = ypos;}    
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//updates all temperature values if the up or down arrow keys are pressed
void updateTemp(){
  float[] values = {((1/alb[0])+((temp-32)/1.8)), ((1/alb[1])+((temp-32)/1.8)), ((1/alb[2])+((temp-32)/1.8)), ((1/alb[3])+((temp-32)/1.8)), ((1/alb[4])+((temp-32)/1.8)), ((1/alb[5])+((temp-32)/1.8)), ((1/alb[6])+((temp-32)/1.8)), ((1/alb[7])+((temp-32)/1.8))};  
  int[] newTemp = {(round(((values[0]*1.8)+32))),(round(((values[1]*1.8)+32))),(round(((values[2]*1.8)+32))),(round(((values[3]*1.8)+32))),(round(((values[4]*1.8)+32))),(round(((values[5]*1.8)+32))),(round(((values[6]*1.8)+32))),(round(((values[7]*1.8)+32)))};
  int tRed[] = {(round((map((newTemp[0]), 2, 116, 0, 255)))), (round((map((newTemp[1]), 2, 116, 0, 255)))), (round((map((newTemp[2]), 2, 116, 0, 255)))), (round((map((newTemp[3]), 2, 116, 0, 255)))), (round((map((newTemp[4]), 2, 116, 0, 255)))), (round((map((newTemp[5]), 2, 116, 0, 255)))), (round((map((newTemp[6]), 2, 116, 0, 255)))), (round((map((newTemp[7]), 2, 116, 0, 255))))};
  int tGreen[] = {(round((map(1, 1, 8, 100, 150)))), (round((map(2, 1, 8, 100, 150)))), (round((map(3, 1, 8, 100, 150)))), (round((map(4, 1, 8, 100, 150)))), (round((map(5, 1, 8, 0, 50)))), (round((map(6, 1, 8, 100, 150)))), (round((map(7, 1, 8, 100, 150)))), (round((map(8, 1, 8, 100, 150))))};
  int tBlue[] = {(round((map((newTemp[0]), 2, 116, 100, 255)))), (round((map((newTemp[1]), 2, 116, 100, 255)))), (round((map((newTemp[2]), 2, 116, 100, 255)))), (round((map((newTemp[3]), 2, 116, 100, 255)))), (round((map((newTemp[4]), 2, 116, 100, 255)))), (round((map((newTemp[5]), 2, 116, 100, 255)))), (round((map((newTemp[6]), 2, 116, 100, 255)))), (round((map((newTemp[7]), 2, 116, 100, 255))))};
  col[0] = new Color((tRed[0]),(tGreen[0]),(tBlue[0]), loadImage ("t.bmp"));
  col[1] = new Color((tRed[1]),(tGreen[1]),(tBlue[1]), loadImage ("c.bmp"));
  col[2] = new Color((tRed[2]),(tGreen[2]),(tBlue[2]), loadImage ("v.bmp"));
  col[3] = new Color((tRed[3]),(tGreen[3]),(tBlue[3]), loadImage ("r.bmp"));
  col[4] = new Color((tRed[4]),(tGreen[4]),(tBlue[4]), loadImage ("p.bmp"));
  col[5] = new Color((tRed[5]),(tGreen[5]),(tBlue[5]), loadImage ("g.bmp"));
  col[6] = new Color((tRed[6]),(tGreen[6]),(tBlue[6]), loadImage ("b.bmp"));
  col[7] = new Color((tRed[7]),(tGreen[7]),(tBlue[7]), loadImage ("w.bmp"));
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//updates the gradient map based on the revised color values when the temperature increases or decreases using the up and down arrow keys
void gradient(){
    background(0);
    updateTemp();
    updateColor();
    noStroke(); 
    noFill();
    for (int i=0; i<579; i++){
      if(( i == 19)||(i == 39) ||(i==59)||(i==79)|| (i ==99)|| (i==119) ||(i==139) ||(i==159)||(i==179)|| (i ==199)||( i == 219)||(i == 239) ||(i==259)||(i==279)|| (i ==299)||( i == 319)||(i == 339) ||(i==359)||(i==379)|| (i ==399)||( i == 419)||(i == 439) ||(i==459)||(i==479)|| (i ==499)||( i == 519)||(i == 539) ||(i==559)){
        i+=1;}
      int j = i+1;
      int k = i+21;
      int l = i+20;
      beginShape(QUADS);
      fill(rec[i].r,rec[i].g,rec[i].b);
      vertex(over[i].x,over[i].y,0);
      fill(rec[j].r,rec[j].g,rec[j].b);
      vertex(over[j].x,over[j].y,0);
      fill(rec[k].r,rec[k].g,rec[k].b);
      vertex(over[k].x,over[k].y,0);
      fill(rec[l].r,rec[l].g,rec[l].b);
      vertex(over[l].x,over[l].y,0);
      endShape(CLOSE);}
}
//////////////////////////////////////////////////


//////////////////////////////////////////////////  
//N or n for 'new' - sets up a new random pattern of material images
void keyPressed(){
  if ((key == 'n') || (key == 'N')){
    randomColor();
    for (int i=0; i<rec.length; i++){
      rec[i].imagedisplay();}}   

//displays the gradient map for surface temperatures
  if(key == ENTER){
    gradient();}
      
//goes back to the material pattern map last generated
  if(key == BACKSPACE){
    for (int i=0; i<rec.length; i++){
      rec[i].imagedisplay();}}    

//displays the color pixel map used to generate the gradient map      
  if ((key == 'c') || (key == 'C')){
    for (int i=0; i<rec.length; i++){
      rec[i].display();}}

//uses the arrow keys to increase or decrease the air temperature values      
  if (key == CODED) {
    if (keyCode == UP) {
      temp = temp+5;
      gradient();
      updateTemp();     
      if (temp >= 100){
        temp = 100;
         gradient();
         updateTemp();}  
      println("rural temperature "+temp);}
    else if (keyCode == DOWN) {
      temp = temp-5;
      gradient();
      updateTemp();     
      if (temp <= 0){
        temp = 0;
        gradient();
        updateTemp();}  
      println("rural temperature "+temp);}} 
}
//////////////////////////////////////////////////

