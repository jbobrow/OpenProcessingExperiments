
float y=0.0;

void setup(){
  size(500,500); //canvas size
  background(0); //initial background colour
  noStroke();
  rectMode(CENTER); //rectangles are drawn from center
}

void draw() {
  frameRate(50); 
  background (255,255,255); //background is white
  
  fill(255,random(239),88); //blinking random background color
  rect(250,250,350+y,350); //size and position of blinking rectangle
  
  fill(247,240,0); //yellow
  rect(250,250,20+y,20); // rectangle stretching horizontally
  
  fill(247,240,0);//yellow
  rect(200,220,35+y,20); // rect stretching horizontally
  
  fill(255,41,148); //pink
  rect(200,280,50+y,20); // rect stretching horizontally
  
  fill(247,240,0); // yellow
  rect(300,400,30+y,20); // rect stretching horizontally
  
  fill(247,240,0); //yellow
  rect(300,190,60+y,20); //rect stretching horizontally
  
  fill(255,41,148); //pink
  rect(370,100,30+y,20); // rect stretching horizontally
  
  if (y < 450) //if the value of y is smaller than 450
  {
    y+=3; // increases by 3
  }  
  else
  {
    y = 0; //if y is bigger than 450, goes back to 0
  }
  
}                       
