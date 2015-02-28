
float posx;          //variables
float posy;          
float diameter;
float r,g,b,a;       //red,green,blue,transparency 
float fade;     

void setup(){
  size(500,500);
  background(255);
  smooth();
  
  posx = random(width);      //random x and y postion
  posy = random(height);
  diameter = 10;            //diameter starts at 10 
  r = random(255);          //random color
  g = random(255);
  b = random(255);
  a = (0);                  //transparency
  fade = 255;
}

void draw(){
  
  noStroke();
  if(mousePressed){          //if mouse pressed, then a random colored ellipse w/ diam. of 10 shows up
    diameter = 10;
    fill(r,g,b,fade);
  }
  if(mousePressed){          //if mouse pressed, the ellipse will have a random location every time
    posx = random(width);
    posy = random(height);
  }
  if(diameter > 100){        
    fill(r,g,b,a);
  }
  
  ellipse(posx,posy,diameter,diameter);
  diameter = diameter + 1;
  
  rect(posx,posy,diameter,diameter);
  

}


