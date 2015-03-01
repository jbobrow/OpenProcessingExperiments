
Circle myCircle;
Circle myCircle1;
Circle myCircle2;

void setup() {

  size(400, 400);
  background(255);
  noStroke();
 

 myCircle = new Circle();
 myCircle1 = new Circle();
 myCircle2 = new Circle();

}



void draw() {
//have to make 3 for each circle, my mistake #1
  //1st circle
 if (myCircle.g < 800) {

    myCircle.grow();

    myCircle.display();
 }
 else {
    myCircle.reset();
 } 
 
 //second circle
 if (myCircle1.g < 800) {

    myCircle1.grow();

    myCircle1.display();
 }
 else {
    myCircle1.reset();

 } 

//third circle
if (myCircle2.g < 800) {

    myCircle2.grow();

    myCircle2.display();
 }
 else {
    myCircle2.reset();

 } 
//CALLING INTERSECTION through an if statement but had to add resets here as well, mistake #2
if(  myCircle.intersect(myCircle1) || myCircle.intersect(myCircle2) || myCircle1.intersect(myCircle2) ) {
 println(myCircle.g);
 println(myCircle1.g);
 println(myCircle2.g);
  myCircle.reset();
  myCircle1.reset();
  myCircle2.reset();
}

}

void mousePressed(){
   myCircle.reset();
  myCircle1.reset();
  myCircle2.reset();
}

//CLASS

class Circle {
   float getBig;
     float g;
     float x;
     float y;
     color c;
      
  Circle(){
     //its super slow so you can see my mousePressed reset works :)
    getBig= .8;
     g=1;
     x= random(400);
     y= random(400);
     c= color (random(225), random(225), random(255) );
  }
     

void grow(){
  g= g + getBig;
}
  
void display (){
  ellipse(x, y, 2*g, 2*g);
  fill (c);
}
  
void reset(){
  g=1;
     x= random(400);
     y= random(400);
     c= color (random(225), random(225), random(255) );
     background(255);
  
}
//make them interect with boolean from 10-3
boolean intersect(Circle c) {  
    
    float distance = dist(x, y, c.x, c.y); 
   
    if (distance < g + c.g) {
      println("Dis"+distance);
      return true;
    } else {
      return false;
    }
  }
}
//skaggs says "Hi"
