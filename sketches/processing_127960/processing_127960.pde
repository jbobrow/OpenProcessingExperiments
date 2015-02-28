
int X;
int Y;

/*
int richting;
int teller = 0;
boolean test = true;
*/

void setup(){
   size(500,500);
/*  greenyX = 250;
  greenyY = 250;
  richting = 10; */
  background(255);
  X = height/2; 
  Y = 0;
}

void draw(){
for (int i = 1; i < 4; i = i + 1){
teken((i*125),X);
}
}
 
void teken(int greenyX, int greenyY) {
  
  /*head*/
  stroke(0);
  ellipseMode(CENTER);
   fill(119,229,170);
  ellipse(greenyX,greenyY,140,150);
  
  /*eyes*/
  fill(255);
  ellipseMode (CENTER); 
  ellipse(greenyX,greenyY-30,45, 60);
  ellipseMode (CENTER);
  fill(0);
  ellipse(greenyX,greenyY-20,30,40);
  
  /*mouth*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(greenyX,greenyY+40,20,30);
  
  /*body*/
    fill(119,229,170);
  ellipseMode(CENTER);
  ellipse(greenyX-25,greenyY+60,50,60);
  
    fill(119,229,170);
  ellipseMode(CENTER);
  ellipse(greenyX+25,greenyY+60,50,60);
}
 



