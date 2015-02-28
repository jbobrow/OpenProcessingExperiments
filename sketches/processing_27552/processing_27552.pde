
int a=1;
int i=1;
String s ="Kora";
PFont f;

void setup() {
  size(500,400);
  background(233,252,87);
f=loadFont("Bauhaus93-48.vlw");
}

void draw() { 
  smooth();
  textFont(f);
  println(s);
  textSize(75);
  a=a+20;
  i=i+20;
  fill(random(50),random(100),random(150),150);
  text("Kora",a,i);
  

  smooth(); 
  stroke(60,151,206,35);
  strokeWeight(1);
  point(mouseX,mouseY);
   
  strokeWeight(1);
  line(mouseX,mouseY,450,50);
   
  stroke(random(255),random(255),random(255),40);
  strokeWeight(1);
  point(450,50);
   
  stroke(random(0,100));
  strokeWeight(1);
  line(450,50,450,450);
   
   
  stroke(108,16,201,35);
  strokeWeight(1);
  point(450,450);
   
  strokeWeight(1);
  line(450,450,50,450);
   
  strokeWeight(1);
  point(50,450);
   
  strokeWeight(1);
  line(50,450,mouseX,mouseY);
 
   
 
   
  strokeWeight(10);
  point(mouseX,mouseY);
   
  stroke(87,234,252,30);
  strokeWeight(1);
  line(mouseX,mouseY,450,650);
   
  strokeWeight(10);
  point(450,50);
   
  strokeWeight(1);
  line(450,650,450,450);
   
  strokeWeight(10);
  point(450,450);
   
  strokeWeight(1);
  line(450,450,650,450);
   
  strokeWeight(10);
  point(650,450);
   
  strokeWeight(1);
  line(650,450,mouseX,mouseY);
}



                
                
