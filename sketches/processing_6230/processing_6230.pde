
// comments

Robot r1;
Robot r2;
int counter = 0; 
String numbers; 
PFont font; 
PShape dart;
float b;



void setup() {
  size(480, 320);
  r1 = new Robot();
  r2 = new Robot();
  dart = loadShape("dart.svg");
  numbers = "0123456789"; 
  font = loadFont("Courier-12.vlw"); 
  textFont(font, 12); 
  println(numbers);
 
 

}


void draw() { 
  background (255);  
  smooth();
  noFill();

  int y =0; 
  while(y<height){ 

    int x=0; 
    while (x<width){ 
      char number = numbers.charAt (round(random(1))); 
      fill(0); 
      text(number, x,y); 
      x = x + 20; 
    } 
    y= y + 10; 
  } 


  int xpos = mouseX;
  
  if (xpos <= 200) {
    xpos = 200;
  }

  b = map(mouseX, width, 200, 0, 0.5);
  r1.display (b, -180, true);
  r2.display (.2, xpos, false);
 
}
















