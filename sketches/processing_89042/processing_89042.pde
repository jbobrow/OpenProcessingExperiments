
int xValue = 150;
int midValue = 160;
int radius = 20;

float x;
float y;
float px;
float py;
float easing = 0.99;

void setup(){
  size(600,400);
  smooth();
  background(232,222,16);
  
}

void draw(){
  //Person
  noStroke();
  fill(0);
  ellipse(100,350,75,75);
  rect(xValue,370,20,70);
  arc(midValue,370,20,20,radians(180),radians(360));
  
  //Bow
  fill(209,23,79);
  beginShape();
  vertex(50,310);
  vertex(55,340);
  vertex(70,325);
  vertex(80,320);
  vertex(100,325);
  vertex(95,295);
  vertex(80,310);
  vertex(70,315);
  vertex(50,310);
  endShape();
  stroke(0);
  line(67,314,70,324);
  line(78,312,80,320);
  
  
  //Bubble Spoon Thing
  fill(0);
  stroke(0);
  line(xValue,350,midValue,370);
  ellipse(100,570,100,400);
  noFill();
  ellipse(xValue,343,15,15);
  
  //Bubbles
   stroke(122,124,124);
   float targetX = mouseX;
   x += (targetX - x) * easing;
   float targetY = mouseY;
   y +=(targetY - y) * easing;
   float weight = dist(x,y,px,py);
   py = y;
   px = x;
   
   float d = dist(mouseX,mouseY,x,y);
   if(d>radius){
     radius++;
   }else{
     if(mousePressed){
       noStroke();
       fill(46,221,242);
   }
   ellipse(x,y,radius,radius);
   
   if(keyPressed == true){
     if(key == 'c'){
       background(232,222,16);
     }
     else if(key == 'g'){
       noStroke();
       fill(44,209,23);
       ellipse(mouseX,mouseY,20,20);
   }
   stroke(122,124,124);
   }
}
}



