
float counter, counter1, counter2;
PImage img;

void setup()
{
  counter=0.0;
  size(300,300);
  counter1=100.0;
  counter2=50.0;
  smooth();
  
  PFont font;
  font = loadFont("ArialNarrow-16.vlw"); 
  textFont(font); 
  fill(50);
  text("Right Click to Start", 190, 290);
}

void draw()
{
  
 // rect(125, 50, 50, 200);

  
  if (mousePressed && (mouseButton == RIGHT) && counter<90) {
  counter++;
  counter1++;
  counter2++;
  translate(width/2, height/2);
  rotate(counter*PI/180);
  translate(-width/2,-height/2);
  stroke(90+counter,100+counter1,90-counter2, 50);
  fill(90-counter2,100+counter1,90+counter, 50);
  rect(125, 50, 50, 200);
  delay(50);
  ellipse(150,150, 5, 5);
  }
} 

