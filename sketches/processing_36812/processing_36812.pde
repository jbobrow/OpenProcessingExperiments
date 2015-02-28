
void setup(){
  size(300,300);
  smooth();
  background(50);
  colorMode(HSB,200);
  frameRate(200);
}

int x = 10;

void draw(){
  
//rectangles
  stroke(0);
  fill(0);
  rect(0,100,100,300);
  
  rect(0,100,300,75);
  
  stroke(100,70,90);
  rect(100,300,100,300);
  
//2nd growing circle
  fill(x);
  ellipse(width/2,height/2,x,x);
  x++;
  
//1st growing circle
  fill(x++);
  ellipse(-width,-height,x,x);
  
//background circle  
  stroke(6);
  fill(116,37,73);
  ellipse(width/2,height/2,20,20);
  
//center circles  
  stroke(4);
  fill(245,15,122);
  ellipse(width/2,height/2,140,140);
  
  stroke(2);
  fill(x--);
  ellipse(width/2,height/2,100,100);

}

