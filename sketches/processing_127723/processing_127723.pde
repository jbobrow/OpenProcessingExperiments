
 
int x = 5;        // variables
int y = 5;
 
int dx = 9;        // velocity (9,5)
int dy = 5;
 
void setup() {  //setup function called initially, only once
  size(500,500);
  background(0,250,0);  //set background white
 
}
 
void draw() {  //draw function loops
background(0,250,00);
fill(250,250,0);
  ellipse(mouseX,mouseY,150,200);
  fill(0,0,0);
  ellipse(mouseX-30,mouseY-50,30,30);
  ellipse(mouseX+30,mouseY-50,30,30);
  arc(mouseX-10,mouseY+50, 50, 50, 0, PI+QUARTER_PI, OPEN);
   
 
   
   
 
  if(mousePressed){
  fill(250,00,00)
  rect(mouseX-75,mouseY-100,150,200)
  fill(0,0,0);
  ellipse(mouseX-30,mouseY-50,30,30);
  ellipse(mouseX+30,mouseY-50,30,30);
  rect(mouseX-50,mouseY-90,100,10);
   ellipse(mouseX+0,mouseY+70,100,10);
   
  x = mouseX;
  y = mouseY;
  }
}
 
