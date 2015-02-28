
float x = 125;
float y = 175;
float x1 = 125;

void setup(){
  size(250, 250);
  smooth();
}

void draw(){ 
  background(0);
  noStroke();
  frameRate(15);

//blue
  fill(#8EBDB6, 150);
  ellipse(x, random(75, y), 10, 10); // limited height between 175 and 75
  fill(#3E838C, 150);
  ellipse(x, random(75, y), 5, 5);
  fill(#195E63, 150);
  ellipse(x, random(75, y), 15, 15);
  fill(#063940, 150); 
  ellipse(x, random(75, y), 20, 20);
  x += 5;
  
//orange
  fill(#D6E1C7, 150);
  ellipse(x1, random(75, y), 10, 10); //limited height between 175 and 75
  fill(#94C7B6, 150);
  ellipse(x1, random(75, y), 5, 5);
  fill(#403B33, 150);
  ellipse(x1, random(75, y), 15, 15);
  fill(#D3643B, 150); 
  ellipse(x1, random(75, y), 20, 20);
  x1 -= 5;
    
    
// if statements
  if(x > 250){ // if blue is more than 250, it resets to -5
    x = -5;
  }
  
  if(x1 < -5){ // if orange is less than -5, it resets to 250
    x1 = 250;
  }
}

