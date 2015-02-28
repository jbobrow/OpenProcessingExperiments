
MyClass[] myObjects = new MyClass[100];

float posx;          //variables
float posy;          
float diameter;
float r,g,b,a;       //red,green,blue,transparency 
   

void setup(){
  size(500,500);
  background(109,91,118);    //dark purple
  smooth();
  
//call array

  for(int i = 0; i < myObjects.length; i++){
    myObjects[i] = new MyClass();
  }
  
  posx = random(width);      //random x and y postion
  posy = random(height);
  diameter = 10;            //diameter starts at 10 
  r = random(255);          //random color
  g = random(255);
  b = random(255);
  a = 255;                  //transparency
  
}

void draw(){
  
  background(109,91,118);      //dark purple
  
  for(int i = 0; i < myObjects.length; i++){
    myObjects[i].update();
    myObjects[i].display();
  } 
}
//block
class MyClass {

float posx;          //variables
float posy;          
float diameter;
float r,g,b,a;       //red,green,blue,transparency 
   
//constructor; initialize
MyClass(){
  
  posx = random(width);      //random x and y postion
  posy = random(height);
  diameter = 10;            //diameter starts at 10 
  r = random(255);          //random color
  g = random(255);
  b = random(255);
  a = 255;                  //transparency
  
}

//update; variables (like draw)
void update(){
  
    
 
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

  diameter = diameter + 8;      //grows quicker
  
  if(diameter > 200){        //diameter stops at 200
    diameter = random(150,200);
  }
  
  a-=2;        //fades quicker the larger the number
  
  if(a < 0){        //transperency; disappears completely
    a = 0;
  }
}

//draw; shapes/variables
void display() {
  
  noStroke();
  fill(r,g,b,a);
  ellipse(posx,posy,diameter,diameter);
}

}


