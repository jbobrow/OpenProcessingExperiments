
//copyright Felipe Castelblanco
//hmw 13 / sources: http://icasualties.org/ & http://www.iraqbodycount.org/
// tech reference: http://blog.blprnt.com/blog/blprnt/tutorial-processing-javascript-and-data-visualization 


int numbersDec6 [ ] = {12087,11113,15471,28212,25030,9357,4704,4045,3661}; //Iraqui war casualities throughout 2011
int numbersDec7 [ ] = {486,849,846,822,904,314,149,60,53}; //US war casualities in throughout 2011
int numbersDec8 [ ] = {53,22,23,29,47,4,1,0,0}; //UK war casualities in throughout 2011

int years [] = {2003,2004,2005,2006,2007,2008,2009,2010,2011}; //years
 
void setup() {
  //instructions in here happen once when the sketch is run
  size(600,600,P3D);
  noStroke();
  
  
}
 
void draw() {
  
  background(0);
  lights();
  drawGraf ();
  info();

}

void drawGraf ()
{
  
  
  translate(width/2, height/2, mouseX/4);
  
 ////****** Iraq values *******// 
  for (int i = 0; i < numbersDec6.length; i++) {
    float c = map(numbersDec6[i], min(numbersDec6), max(numbersDec6), 0, 255);//color bars from the smallest number to the biggest of the array
    float w = map(numbersDec6[i], min(numbersDec6), max(numbersDec6), width*.05, height*.7); // determine height of bars form the smallest number to the biggest of the array
    //move out 200 pixels from the center
    pushMatrix();
        translate(50,0);
        rotateZ(map(mouseX, 0, width, 0, TWO_PI));
        fill(255, c, 0);//increment of color 
        text(numbersDec6[i], i+20,0);
        fill(255, 70);
        text(years[i], i+20,15);
        fill(255, c, 0, mouseX/2);//increment of color 
        box(20,20,w);   
    popMatrix();
    //after we draw each bar, turn the sketch a bit
    rotate(TWO_PI/numbersDec6.length);
  }
  
   ////****** US values *******// 
    for (int i = 0; i < numbersDec7.length; i++) {
    float c = map(numbersDec7[i], min(numbersDec7), max(numbersDec7), 0, 255);
    fill(c, 0, 255);
    float w = map(numbersDec7[i], 0, max(numbersDec7),  width*.05, height*.5);
    //move out 200 pixels from the center
    pushMatrix();
        translate(150, -100, -100);
        rotateZ(map(mouseX, 0, width, 0, HALF_PI)); 
        text(numbersDec7[i], i+40,0);
         fill(255,70);
        text(years[i], i+40,15);
        fill(c, 0, 255, mouseX/3);//increment of color
        box(40,20,w);
    popMatrix();
    //after we draw each bar, turn the sketch a bit
    rotate(TWO_PI/numbersDec7.length);
  }
  
  ////****** UK values *******// 
    for (int i = 0; i < numbersDec8.length; i++) {
    float c = map(numbersDec8[i], min(numbersDec7), max(numbersDec8), 0, 255);
    fill(0, 255, c);
    float w = map(numbersDec8[i], 0, max(numbersDec8),  width*.05, height*.3);
    //move out 200 pixels from the center
    pushMatrix();
        translate(250, -200, -200);
        rotateZ(map(mouseX, 0, width, 0, PI));
        //box(20,20,w); 
        text(numbersDec8[i], i+60,0);
         fill(255,70);
        text(years[i], i+60,15);
        fill(c, 255,0, mouseX/3);//increment of color
        box(10,20,w);
    popMatrix();
    //after we draw each bar, turn the sketch a bit
   rotate(TWO_PI/numbersDec8.length);
  }
}

void info()
{
  fill(250);
  text("Casuaities of War", -50,0);
  
  fill(250,0,0);
  text("Iraqi deaths", -250,250);
  fill(0,0,250);
  text("US deaths", -250,270);
  fill(0,250,0);
  text("UK deaths", -250,290);
}

