
int r, g, b;

//---------
void setup() {
  size(400, 500);
  background(0);
  rectMode(CENTER);

  r = 0;
  g = 250;
  b = 250;
}

//-----------
void draw() {

  fill(r, g, b);
  rect(width/2, height/2, 100, 100);

  fill(250-r, 250-g, 250-b);
  rect(mouseX, mouseY, 20, 20);
}

//----------
void mousePressed() {

   float d = dist(mouseX,mouseY,width/2,height/2);
  if(d > 50){  
   
 
     r = int (random(0, 255));
  g = int(random(0, 255));
  b = int(random(0, 255));
  background(random(0, 255), random(0, 255), random(0, 255));
}


 println(d);
 }
 


