
int X = 0;
int Y = 0;
int y =0;
int x =0;
int speedY = 6;
int speedX = 1;

//set up size
void setup() { 
  smooth();
  size (500, 500);
  X = width/2;
  Y = height/2;
}


void draw() { 
  
  // set background colour
  background(170,200,255);
 
 //draw grass
 stroke (100,200,100);
 fill (100,200,100);
  rect (0,283,500,300);
 
 //draw tree top
 stroke(150,200,50);
 fill (150,200,50);
 ellipse (410,110,70,70);
 ellipse (430,130,70,60);
 ellipse (390,130,70,60);
 
   //tree trunk
  strokeWeight (13);
  stroke (200,100,0);
 line (410,160,410,290);
 strokeWeight (2);

  //draw left cloud
 stroke(255);
 fill (255);
 ellipse (100,90,70,70);
 ellipse (130,100,70,60);
 ellipse (70,100,70,60);
 
 // set colour of teddy
  stroke(0);
  fill (150, 100, 0);
 
 //draw teddy's head
  ellipse (X-30, Y-100, 30, 30);
  ellipse (X+30, Y-100, 30, 30); 
  ellipse (X, Y, 70, 105);
  ellipse (X, Y-72, 80, 80);
 
  // draw teddy's snout
  fill (200, 150, 0);
  ellipse (X, Y-56,30 ,30);
  // draw teddy's face
  fill(0);
  noStroke();
  ellipse (X-12, Y-75, 7, 7);
  ellipse (X+12, Y-75, 7, 7);
  triangle (X-4, Y-60, X+4, Y-60, X, Y-52); 
  
//teddy's right foot
  stroke(0);
    fill (150, 100, 0);
  ellipse (230,300,40,40);
  fill (0);
  ellipse (230,290,5,5);
  ellipse (220,295,5,5);
  ellipse (238,295,5,5);
  ellipse (230,305,15,15);
  
  //teddy's left foot
  stroke (0);
    fill (150, 100, 0);
  ellipse (270,300,40,40);
  fill (0);
  ellipse (270,290,5,5);
  ellipse (260,295,5,5);
  ellipse (280,295,5,5);
  ellipse (270,305,15,15);
  
  //teddy's arms
   //stroke (0);
   stroke (0);
  //ellipse (220,250,25,80);
  //ellipse (280,250,25,80);
  strokeWeight(34);
  line (mouseX-30,mouseY,220,220);
  line (mouseX+30,mouseY,280,220);
  strokeWeight(30);
  stroke(150, 100,0);
  line (mouseX-30,mouseY,220,220);
  line (mouseX+30,mouseY,280,220);
  strokeWeight (2);
  stroke (0);


    //set bounce for pot
   y = y + speedY;
   if ((y > height -100) || (y < 0)){ 
     speedY =speedY * -1; }
   
   x = x + speedX;
   if ((x > width) || (x < 0)){ 
     speedX =speedX * -1; }
     
  //draw honey pot
  fill (255,170,50);
   ellipse (x,y+0,50,50);
  ellipse (x,y-20,40,20);
  ellipse (x,y-30,10,10);   
}

