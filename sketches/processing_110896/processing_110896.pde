
//Assignment 2
//Student Name: Siu Ho Wun
//Student Id: 52623053

void setup(){
size(600, 200);
background(255);
smooth();
noStroke();
}

void draw(){
  frameRate(1);
for (int x = 0; x<=width; x+=20) // loop of x 
{
  for (int y=0; y<=height; y+=20) // loop of y
  { 
    if (x<=200){  // if x is smaller and eual to 200, the ellipse will create at the weight position of 200.
    fill( int(random(200,255)), int(random(255)), int(random(250)),155); //random color
    ellipse(x, y, 40, 40);
  }
  else if (x<=350){  //if x is smaller or equal to 350,the ellipse will create at the weight position between 201 to 350.
  fill(int(random(100,255)), int(random(100,255)), int(random(100,255)),155); //random color
  ellipse(x,y,40,40);
  }
  
  else //if x isgreater than 350,the ellipse will create at the weight position between 351 to 600.
    fill( int(random(200,255)), int(random(100,255)), int(random(100,255)),200); //random color
    ellipse(x, y, 40, 40);
  }
 
  }
  
}




