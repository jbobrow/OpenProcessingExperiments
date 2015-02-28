

int miceDrawX = constrain(mouseX, 870, 160);
int miceDrawY = constrain(mouseY, 870, 80);


color colorLapiz = (0);

boolean here = false;
boolean clear = true;
boolean grid = false;

int anchoLapiz = 1;
PFont sysFont;
PFont eraser;
PImage neu;
PImage myDraw;
PImage linestroke;
PImage plus;
PImage minus;
PImage colorLapices;
int colorvalues;
int selecc = (125);

//change to any color?
int rb = (253);
int gb = (253);
int bb = (253);
int cont = (0);

color screenocolor = color (rb, gb, bb);

int del = (253);
int nodel = (0);


int downy = 170;
int accr = 80;
int papercolor = 0;


color rojo = color (247, 5,5);
color azul = color (12, 32, 237);
color verde = color (29, 180, 30);

color blanco = color (255, 255, 255);
color amarillo = color (254, 255, 3);
color negro = color (10, 10, 10);

//color free = color (r, g, b, cont);
//other colors
// color purpura = color (#7C0AF7);



int sizescreenX = 900;
int sizescreenY = 900;
int screencolor = 200;

void setup () {
  size (sizescreenX, sizescreenY);
background (screencolor);  


//title
sysFont = loadFont("SchoolHousePrintedA-36.vlw");  
textFont(sysFont);
fill (#55A051, 225);

text ("sKetchy pad", 700, 50, 200);
mouseX = 320;
  mouseY = 180;
  
}






void draw() {
  // icons
  
  //draw
  
    stroke(colorLapiz);
    strokeWeight(anchoLapiz);
    if(mousePressed && mouseX < 870 && mouseX > 180 && mouseY > 80 && mouseY < 870) {
  //  int miceDrawX = constrain(mouseX, 870, 160);
    if (miceDrawX != mouseX || miceDrawY != mouseY) {  
    //  int miceDrawY = constrain(mouseY, 870, 80);
    line(mouseX, mouseY, miceDrawX, miceDrawY);
  }
    }
miceDrawX = mouseX;
miceDrawY = mouseY;
  
//paper
strokeWeight(2);
stroke(77, 113, 137);
line (170, 80, 870, 80);
line (870, 80, 870, 870);
line (870, 870, 170, 870);
line (170, 870, 170, 80);

//grid
eraser = loadFont("StoneSansITCTT.vlw");
textFont (eraser, 25);
textMode (CENTER);
text ("gridpaper", width/2 - 55, 35);

line (width/2, 55, width/ 2 + 30, 55);
line (width/2, 65, width/ 2 + 30, 65);
line (width/2, 75, width/2 + 30, 75);

line (420, 55, 420, 75);
line (430, 55, 430, 75);
line (440, 55, 440, 75);


//grid button
if(mouseX > 440 && mouseX < 480 && mouseY > 40 && mouseY < 80 && mousePressed) {
    clear = true;
  }else{
    clear = false;
  }
  if (clear == true) { 
   //  FOR?  for (int i = 40; i < 80; i = i+5) {
  //line(30, i, 80, i);
//}  
      smooth ();
      strokeWeight (1);
      fill (0,0,0);
      stroke (0);
      for (int downy = 170; downy < 870; downy = downy + 10){
      line (downy, 80 , downy, 870);
      }
     // downy = constrain (downy, 170, 860);
      for (int accr = 80; accr < 870; accr = accr + 10){
      line (170, accr + 10, 870, accr + 10);
      }
      //accr = constrain (accr, 80, 860);
      
  }  

if (mouseX < 445 && mouseX > 415 && mouseY < 80 && mouseY > 40 && mousePressed){
  fill (rb, gb, bb);
   rect (170, 80, 700, 890);
  }
  
// new
neu = loadImage("neubutt.jpg");
  imageMode (CORNERS);
  image(neu, 170, 10, 320, 80);
  if(mousePressed && mouseX > 170 && mouseX < 320 && mouseY > 10 && mouseY< 80) {
    fill (screencolor);
    rect (170, 80, 870, 870); 
    anchoLapiz = 1;
  }


//stroke  

linestroke = loadImage("strokeline.jpg");
  imageMode (CORNERS);
  image(linestroke, 10, 80, 160, 140);
  
 
//minus
 minus = loadImage("minus.jpg");
imageMode (CORNERS);
image (minus, 10, 150, 70, 170);

    if (mouseX > 0 && mouseX < 80 && mouseY > 140 && mouseY < 180 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (10, 180, 70, 180);
    if(mousePressed) {
      anchoLapiz--;
    
  }
  }else{
    strokeWeight (5);
    stroke(rojo);
    line (10, 180, 70, 180);
  }
  
  // plus
  
 plus = loadImage("plus.jpg");
imageMode (CORNERS);
image (plus, 90, 145, 160, 180);

    if (mouseX > 80 && mouseX < 160 && mouseY > 145 && mouseY < 180 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (90, 180, 160, 180);
    if(mousePressed) {
      anchoLapiz++;
    
  }
  }else{
    strokeWeight (5);
    stroke(rojo);
    line (90, 180, 160, 180);
  }
  
  // color 
  
 colorLapices = loadImage("color.jpg");
imageMode (CORNERS);
image (colorLapices, 10, 200, 160, 260); 

//rojo    
noStroke();  
fill (rojo);
ellipseMode (CORNERS);
ellipse (10, 280, 60, 330);

    if (mouseX > 0 && mouseX < 70 && mouseY > 270 && mouseY < 340 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (10, 340, 60, 340);
    if(mousePressed) {
      colorLapiz = rojo;
    
  }
  }else{
    strokeWeight (5);
    stroke(rojo);
    line (10, 340, 60, 340); 
  }




 noStroke();    
//negro    
fill (negro);
ellipseMode (CORNERS);
ellipse (80, 280, 130, 330);

    if (mouseX > 80 && mouseX < 150 && mouseY > 270 && mouseY < 340 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(rojo);
    line (80, 340, 130, 340);
    if(mousePressed) {
      colorLapiz = negro;
    
  }
  }else{
    strokeWeight (5);
    stroke(negro);
    line (80, 340, 130, 340);
  }
  
noStroke();    
//azul   
fill (azul);
ellipseMode (CORNERS);

ellipse (10, 350, 60, 400);

    if (mouseX > 10 && mouseX < 70 && mouseY > 350 && mouseY < 400 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (10, 410, 60, 410);
    if(mousePressed) {
      colorLapiz = azul;
    
  }
  }else{
    strokeWeight (5);
    stroke(azul);
    line (10, 410, 60, 410);
  }
  

noStroke();  
//blanco  
fill (blanco);
ellipseMode (CORNERS);
ellipse (80, 350, 130, 400);

    if (mouseX > 80 && mouseX < 130 && mouseY > 350 && mouseY < 400 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (80, 410, 130, 410);
    if(mousePressed) {
      colorLapiz = blanco;
    
  }
  }else{
    strokeWeight (5);
    stroke(blanco);
    line (80, 410, 130, 410);
  }
noStroke();    
//verde

fill (verde);
ellipseMode (CORNERS);
ellipse (10, 420, 60, 470);

    if (mouseX > 10 && mouseX < 60 && mouseY > 420 && mouseY < 470 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (10, 480, 60, 480);
    if(mousePressed) {
      colorLapiz = verde;
    
  }
  }else{
    strokeWeight (5);
    stroke(verde);
    line (10, 480, 60, 480);
  }  
 noStroke();  
// 
fill (amarillo);
ellipseMode (CORNERS);
ellipse (80, 420, 130 , 470);

    if (mouseX > 80 && mouseX < 130 && mouseY > 420 && mouseY < 470 && mousePressed) {
    here = true;
  }else{
    here = false;
  }
  if (here == true) {
   strokeWeight (5);
    stroke(negro);
    line (80, 480, 130, 480);
    if(mousePressed) {
      colorLapiz = amarillo;
    
  }
  }else{
    strokeWeight (5);
    stroke(amarillo);
    line (80, 480, 130, 480);
  }  

// arrays ej.
//int[ ] numbers = { 90, 150, 30 };
//int a = numbers[0] + numbers[1]; // Sets variable a to 240
//int b = numbers[1] + numbers[2]; // Sets variable b to 180


  
//auto draw
/* myDraw = loadImage("myDraw.jpg");
  imageMode (CORNERS);
  image(myDraw, 10, 600, 160 , 660);
  if(mousePressed && mouseX > 10 && mouseX < 160 && mouseY > 600 && mouseY< 660) {
    fill (screencolor);
     
  }
*/
    
  
  
}







