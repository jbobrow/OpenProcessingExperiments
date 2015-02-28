
PImage annie ;
PFont britt ;
int x = 600;
int y = 720;
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 350;


void setup() {
  
size(700, 700) ;
annie = loadImage("annie.jpg") ;
britt = loadFont("BritannicBold-150.vlw") ;
background(#009FFF);
}

void draw() {
  background(#009FFF);
  
image(annie, x1, 410, 200, 200) ;
x1 = x1 + 1 ;
if (x1 > 800) {
 x1 = -50 ; 
}
println(x1, y) ;

textFont(britt, 50) ;
fill(#FFFFFF);
text("JUST THINKING ABOUT TOMORROW CLEARS AWAY THE COBWEBS AND THE SORROW...........THE SUN WILL COME OUT TOMORROW, SO YOU GOTTA HANG ON 'TIL TOMORROW", x, 100) ;
x = x - 3 ;
if (x < -4000) {
 x = 720  ;
}



  fill(#FFAF00);
  ellipse(350, y, 300, 300);
   y = y - 3 ;
   
  if (y < -200) {
      y = 750;
  }
  
  
  fill(0, 200, 0);
  rect(0, 610, 700, 120);
}


