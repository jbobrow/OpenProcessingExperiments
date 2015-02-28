
PImage planchaso;
int crece = 1;
Circle[] circles;



void setup(){
  size(700, 700);
  smooth();
  background(#12343C);
  planchaso = loadImage ("planchaso.gif");
   circles = new Circle[100];
  for( int i= 0; i < circles.length; i++){
    circles[i] = new Circle(random(width), random(height));
  }
}






void draw(){
  
   for( int i= 0; i < circles.length; i++){
  circles[i].moveC();
  circles[i].display();
  }
  
  
  //lines from the center
  strokeWeight(1);
   stroke(178,34,34,50);
   line(height/2,width/2, random(800), random(800));
  
   stroke(54,87,98, 50);
   line(height/2,width/2, random(800), random(800));
  
 /* for (int i = 100; i < 600; i = i+10) {
    stroke(random(255), random(255), random(255));
    strokeWeight(crece);
  line(100, i, 600, i);
  println(i);
}
 
 for (int i = 50; i < 650; i = i+15) {
    stroke(random(255));
    strokeWeight(crece);
  line(i, 50, i, 650);
  println(i);
}*/
 
 
 //multicoloured ellipses
 {for (int i = 200; i < 450; i = i+10) {
   noFill();
   smooth();
   stroke(random(255), 155, 255, 45);
  ellipse(350, i, 400, 200);
 }
 }
 
 
 //button 1 (rainbow colors)
 {fill(255);
 noStroke();
 rect(680, 10, 10, 10);
if(mouseX > 680 && mouseX < 690 && mouseY > 10 && mouseY < 20 && mousePressed) {
  if(mousePressed = true){
    {for (int i = 200; i < 450; i = i+10) {
   noFill();
   smooth();
 stroke(random(255), random(255), random(255),75);
 ellipse(350, i, 400, 200);
 }
 
    }
  }
}
 }
 
 //button 2 (random ellipses)
 {fill(255);
  rect(680, 30, 10, 10);
if(mouseX > 680 && mouseX < 690 && mouseY > 30 && mouseY < 40 && mousePressed) {
  if(mousePressed = true){
    noFill();
    stroke(random(255));
    strokeWeight(.5);
   ellipse(height/2, width/2, random(150), random(150));
  }
}
  }
  
  
  //button 3 (purple tornado)
 {fill(255);
  rect(680, 50, 10, 10);
if(mouseX > 680 && mouseX < 690 && mouseY > 50 && mouseY < 60 && mousePressed) {
  if(mousePressed = true){
    {for (int i = 100; i < 600; i = i+10) {
   noFill();
   smooth();
   stroke(random(255), random(155), random(255), 45);
  ellipse(350, i, 290, 100);
 }
 }
  }
}
  }
  
   //button 4 (trigonometric circle pattern)
 {fill(255);
  rect(680, 70, 10, 10);
if(mouseX > 680 && mouseX < 690 && mouseY > 70 && mouseY < 80 && mousePressed) {
  if(mousePressed = true){
     translate(height/2,width/2);
     for(int j=0; j < 45; j++){

  float u = j*20*cos(1000)*sin(crece);
  float o = j*20*sin(radians(20)/tan(crece));
  
  stroke(random(255), random(255), random(255), 100);
  strokeWeight(.1);
  noFill();
  ellipse(u, o, 70, 70);
  
  
  
  crece++;
  }
  }
}
  }
  
  
  //button 5 (image)
  {fill(255);
  rect(680, 90, 10, 10);
if(mouseX > 680 && mouseX < 690 && mouseY > 90 && mouseY < 100 && mousePressed) {
  if(mousePressed = true){
    scale(.5);
    image(planchaso, height/2, width/2);
  }
}
  }
  
  
    // lines from the center
  
if (mousePressed == true){
  
  strokeWeight(.01);
   stroke(255, random(215), 0, 80);
  line( mouseX, mouseY, height/2, width/2);
  }else {
    strokeWeight(.01);
    stroke(255, 50);
   line( mouseX, mouseY, height/2, width/2);
  }

  
 
{cuchara();
}

  }





 
 
 
 
 // trigonometric implosion (white dots)
void cuchara(){
    translate(height/2,width/2);
  for(int j=0; j < 45; j++){

  float t = j*20*cos(1000)*sin(crece);
  float v = j*20*sin(radians(20)/tan(crece));
  
  noStroke();
  fill(255,40);
  ellipse(t, v, 5, 5);
  
  
  
  crece++;
  }
}
  
 
 // barely visible green termites
 class Circle{
  float x, y, speedx, speedy;
  //constructor
  Circle(float _x, float _y){
    x = _x;
    y = _y;
    speedx = random(-5, 5);
    speedy = random(-5, 5);
  }
  
  //methods
  
  void moveC(){
    x+=speedx;
    y+=speedy;
  }
  
  void display(){
  
   stroke(random(255), 200, random(200),40);
    noFill();
    ellipse(x,y,10,10);
  }
}

