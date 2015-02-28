


/*
void draw(){

  noStroke();
  for (int y = 0; y < width; y += 10) {
    for (int x = 0; x < height; x += 10) {
      fill((x+y) * 1.5);
      rect(x, y, 10, 10);
    }
  }

}
*/

void setup() {
  
  size(800, 500);
}

void draw() { 

  int transpMult = 15; // default 15. positive
  int pmouseXdiff = abs(pmouseX-mouseX); // difference between mouse frames
  int transpX = (255-(transpMult*pmouseXdiff)); // transparency value of vertical elements
  int pmouseYdiff = abs(pmouseY-mouseY); // difference between mouse frames
  int transpY = (255-(transpMult*pmouseYdiff)); // transparency value of vertical elements
  int transpMin = 50; // default 50. minimum transparency value of crosshairs in motion. 0 to 255.
  float leanMult = 3; //default 3. positive, increases amount of lean when moving mouse
  int strokeMin = 12; // default 5. minimum stroke on crosshair
  int strokeMax = strokeMin*5; // default strokeMin*10. maximum stroke on crosshair
  
  int bgMult = 5; // default 3. inverse. multiplier for reduction of blurring effects on background
  int strR  =  0;
  int strG  =  32;
  int strB  =  64;
  

  

  

background (0,80,128); 


strokeCap(SQUARE);

noCursor(); 


// XXXXXX CURSOR OUTPUT  
// vertical crosshair blurring effect

//stroke effect
    if (pmouseXdiff > strokeMin)
      if (pmouseXdiff < strokeMax) 
        strokeWeight(pmouseXdiff);
      else 
        strokeWeight(strokeMax);
    else 
      strokeWeight(strokeMin);

//transparency effect 
    if (transpX > transpMin)
        stroke(strR,strG,strB, transpX);
    else
        stroke(strR,strG,strB, transpMin);
       
        

  line(  // top
    pmouseX+((pmouseX-mouseX) * leanMult), 
    0, 
    mouseX, 
    mouseY); 
  
  line(  // bottom
    pmouseX+((pmouseX-mouseX) * leanMult), 
    height, 
    mouseX, 
    mouseY); 

/*
strokeWeight(strokeMin*1.618);
stroke(strR,strG,strB,255);


for (int i = 30; i < width; i += 30) { // background lines
line(i,0,i,height);
}


for (int i = 0; i < width; i +=20) {stroke(0,0); // overlay gradient top
fill(255,255,255,100-i/4);
rect(0, i, width, 20);
}

for (int i = 0; i < height; i +=20) {stroke(0,0); // overlay gradient bottom
fill(32,16,0,200-i/2);
rect(0, height-20-i, width, 20);
}*/


/*
//HORIZONTAL CROSS
// horizontal lines blurring effect

    if (pmouseYdiff > strokeMin)    
      if (pmouseYdiff < strokeMax) strokeWeight(pmouseYdiff);
      else strokeWeight(strokeMax);
    else strokeWeight(strokeMin); 
     
    if (transpY > transpMin) stroke(255, transpY);
    else stroke(255, transpMin);
  
  
 line(  // left
    0,
    pmouseY+((pmouseY-mouseY) * leanMult), 
    mouseX, 
    mouseY
    ); 


  line(  // right
    width,
    pmouseY+((pmouseY-mouseY) * leanMult), 
    mouseX, 
    mouseY
    ); 
    
*/  


/*  
 WEIRD BUT INTERESTING INTERACTIONS
 line(  // left
    0,
    pmouseX+((pmouseX-mouseX) * leanMult), 
    mouseX, 
    mouseY); 
  println(transpX);


  line(  // right
    width,
    width-(pmouseX+((pmouseX-mouseX) * leanMult)), 
    mouseX, 
    mouseY); 
  println(transpX); */
} 



