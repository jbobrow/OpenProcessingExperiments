
MyClass[] myObjects = new MyClass[20];

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


