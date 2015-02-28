
float posx;          //variables
float posy;          
float diameter;
float r,g,b,a;       //red,green,blue,transparency 
   

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
  a = 255;                  //transparency
  
}

void draw(){
  
 background(255);      
  
  noStroke();
  if(mousePressed){          //if mouse pressed, then a random colored ellipse w/ diam. of 10 shows up
     
     if(dist(mouseX,mouseY,posx,posy) < diameter/2){      //when you click at half the diam. 
       
     
      diameter = 10;
      a = 255;          //ellipse starts with full color
      r = random(255);          //random color
      g = random(255);
      b = random(255);
      posx = random(width);   //if mouse pressed, the ellipse will have a random location every time
      posy = random(height);
     }
  }

  diameter = diameter + 1;
  
  if(diameter > 100){        //diameter stops at 100
    diameter = 100;
  }
  
  a-=1;
  
  if(a < 50){        //transperency stops at 50
    a = 50;
  }
  
  println(a);
  
  fill(r,g,b,a);
  ellipse(posx,posy,diameter,diameter);
  

}


