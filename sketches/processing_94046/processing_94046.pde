
PImage coral;
PImage turtle;
PImage lines;
float aspect = 1;
//p is pause
boolean p = false;




void setup() {
  size(1000, 1000);
  background(255);
  coral = loadImage("motif_4.png");
  turtle = loadImage("motif_8.png");
  lines = loadImage("motif_3.png");
  
}

void draw() {
//only draw if program is not paused
//therefore p is false
  if(p==false)
  {
  image(coral, random(-500, width), random(-200, height));
  image(turtle, random(50, width), random(0, height));
  image(lines, random(0, width), random(-70, height));
  }

//  image(donut, 0, 0, donut. width*aspect, donut. height*aspect);
//  aspect = aspect + 0.1;
  
  
  
  
//  for(aspect = 0.1; aspect > 2; aspect = aspect + .01){  
  
//  image(donut, 0, 0);
//  //image(variable name, starting x, starting y,
//  //image width, image height)
//  
//  aspect = 0.5;
//  image(donut, 300, 300, donut. width*aspect, donut. height*aspect);
 
  
}


void keyPressed(){
  if(key == ' ')
  {
    //if the program is paused (p=true)
    //then unpause it (set p=false)
    if(p = false);  
  }
 
 //else -- meaning otherwise p == false, (program is running)
   else
  {
   p =true;
  } 
  
  if(key == 'c')
  {
    background(255);
  }  
  

}


