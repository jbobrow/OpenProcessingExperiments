
PFont bootFont;

void setup(){
  
    size(214,168);
  background(1,74,120);
  smooth();
  
  

// rectangles
noStroke();
fill(43,175,126);
rect(160,100,30,30);
rect(160,60,30,30);
rect(160,20,30,30);
rect(200,20,30,30);
rect(200,100,30,30);
rect(200,60,30,30);
rect(120,60,30,30);


strokeWeight(5);
stroke(0,0,0);
fill(214,215,220);
ellipse(150,-4,140,110);
ellipse(200,200,20,20);
ellipse(300,20,20,20);
ellipse(500,400,20,20);


noStroke();
fill(0,0,0);
ellipse(180,-15,80,70);
ellipse(200,200,20,20);
ellipse(300,20,20,20);
ellipse(500,400,20,20);


// test points tan shape

fill(244,240,231);

ellipse(210,110,10,10);
ellipse(125,50,10,10);
ellipse(75,110,10,10);
ellipse(100,170,10,10);
ellipse(100,170,10,10);
ellipse(210,170,10,10);


// test points red main shape

fill(217,77,50);

ellipse(130,50,10,10);
ellipse(50,30,10,10);
ellipse(15,75,10,10);
ellipse(50,120,10,10);
ellipse(50,170,10,10);


// test points black swirl line

fill(0,0,0);

ellipse(130,50,5,5);
ellipse(50,30,5,5);
ellipse(15,75,5,5);
ellipse(50,120,5,5);
ellipse(80,90,5,5);
ellipse(50,60,5,5);
ellipse(30,80,5,5);
ellipse(50,100,5,5);

  

  
  bootFont = createFont("garamond", 30, true);
  
  textFont(bootFont);
  
  fill(230,250,4);
  
  text("The Artist,",  10,30);
  text("Picasso is",  30,50);
  text("alive in the",  13,70);
  
  bootFont = createFont("helvetica", 50, true);
  
  textFont(bootFont);
 
  fill(230,250,4);
  text("digital",  2,110);
  
 
  
  fill(230,250,4);
  text("future.",  72,145);


}



void draw(){
  
}





