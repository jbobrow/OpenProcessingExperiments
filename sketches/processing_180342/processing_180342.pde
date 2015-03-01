
/*
Joanna Ngai
Design 479
Exercise 2: Repetition and Variation
Creates a bird and tree pattern 
*/

size(400, 400); //sets up canvas

background(253, 253, 251); //creates background color

float hue, sat, bright, alpha;  //declare floats 

int x = 0; //declare and defines x 
int y = 0; //declare and defines y
int c = 0; //declare and defines c

//background pattern
for(int j = y; j < 400; j = j + 15){ //outer loop
  for(int i = x; i < 400; i = i + 15){ //inner loop
  
    noStroke(); //sets no stroke for next
    ellipse(j, i, 5, 120); //creates ellipse
    
    float percentage = random(10); //picks random number
      if(percentage <= 5){ //if statement for percentage
        hue = random(185, 255); //select random hue
        alpha = random(0, 20); //select random alpha 
        sat = random (85, 255); // select random saturation
        fill(hue, sat, 155, alpha); //chooses fill color for ellipses
      } //close if statement
      else{ 
        hue = random (120, 159); //select random hue
        alpha = random (0, 38); //select random alpha
        sat = random (220, 255); //select random saturation
       fill(hue, sat, 208 , alpha); // chooses fill color for ellipse
      } //closes else statement 
  } //closes inner loop
} //closes outer loop

for(int j = c; c < 300; c = c + 92){ //creates outer loop
  for(int b = x; b <= 300; b = b + 85){ //creates inner loop
   
    noStroke(); //makes no fill 
    hue = random (5, 75); //selects random hue
    sat = random (105, 162); //selects random saturation
    fill(hue, sat, 255, 160); //fills next with color

    ellipse(57 + b, 55 + c, 50, 47); //creates ellipse
    
    fill(243, 134, 14, 180); //fills next with color
    triangle(23 + b, 55 + c , 35 + b, 50 + c, 35 + b, 60 + c); //creates triangle
    
    stroke(220, 117, 14); //makes stroke orange
    line(50 + b, 73 + c, 50 + b, 80 + c); //makes left line
    line(55 + b, 73 + c, 55 + b, 80 + c); //makes right line
    
    noFill(); //sets no fill
    stroke(0); //sets stroke color to black
    arc(50 + b, 48 + c, 9, 9, 0, TWO_PI-PI); //creates arc
    
    noStroke(); //sets no stroke 
    fill(205, 210, 231, 100); //fills next with transparent color 
    arc(68 + b, 59 + c, 19, 19, 0, PI, OPEN); //creates arc
    
    colorMode(HSB); //adjusts color mode
    hue = random(45, 94); //selects random hue
    fill(hue, 189, 154, 180); //fills triangles with color
    
    triangle(97 + b, 90 + c, 112 + b, 90 + c, 105 + b, 80 + c); //creates triangle
    triangle(97 + b, 97 + c, 112 + b, 97 + c, 105 + b, 87 + c); //creates triangle
    triangle(97 + b, 105 + c, 112 + b, 105 + c, 105 + b, 95 + c); //creates triangle
    colorMode(RGB); //adjusts color mode
  } //closes inner loop
} //closes outer loop




