
int s = 400;                                            //
int c = 0;                                              //
int flag = 0;

void setup(){
  size(500,500);                                      // setting the size of the canvas
  smooth();                                           // making all the lines smooth
  background(200);                                    // setting the background color
  ellipseMode(RADIUS);                                // turning on radius mode
}
void draw(){
  background(200);                                    // keeping background the same as ice cream moves  
  
  //icecream scoops
  noStroke();                                         // turning outline of shapes(stroke) off
  fill(106,245,137);                                  // coloring scoop 1 
  ellipse(70+c, 60+s, 55, 55);                        // making scoop 1
 
  fill(56,213,240);                                   // coloring scoop 2
  ellipse(140+c, 60+s, 55, 55);                       // making scoop 2
 
  fill(206,129,237);                                  // coloring scoop 3
  ellipse(110+c, 90+s, 60, 60);                       // making scoop 3
    
  //cherry
  stroke(0);                                          // setting the stroke to "on" for the stem
  
  line(103+c, 10+s, 90+c, 30+s);                      // drawing the cherry stem
 
  noStroke();                                         // turning stroke off again
  fill(227,21,34);                                    // coloring the cherry
  ellipse(95+c,30+s,10,12);                           // circle 1 of the cherry
  ellipse(103+c,30+s,10,12);                          // circle 2 of the cherry
  
  //cone
  fill(245,218,121);                                  // coloring the cone
  triangle(10+c, 80+s, 200+c, 80+s, 100+c, 300+s);    // drawing the con's triangle
          
  //making icecream move    
  if (flag == 0){
    c = c+2;
    s = s-5;
   }
  
  else{
    c = c-2;
    s = s+5;
  }
}
void mousePressed(){
  if (flag == 0){
    flag = 1;
  }
  
  else{
    flag = 0;
  }  
}     

