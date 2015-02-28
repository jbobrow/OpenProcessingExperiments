
//*****************************************************************
//Name:James Salsbury
//Student:W12032387, Northumbria University
//Year:12-13 Course: Information Technology Management Foundation
//Lecturer: Dr. Alun Moon
//Title:Magic Tree (Complex)
//
//Use of Fibonacci sequence and pushing/popping of matrix to generate a plant which moves based on mouse movement.
//*****************************************************************


int f0 = 0;
int f1 = 1;
int f2 = 1;

int nextNumber() //declaring a function in this way means it can be used as a variable. When the variable is used, the function is called and the answer returned. 
{
  int answer = f2; //fibonacci sequence.
  f0 = f1;
  f1 = f2;
  f2 = f0 + f1;
     return answer; 
  }
    

void setup(){
    size(800,600);
  background(255);
  frameRate(10);
  noStroke(); //This removes lines from the shapes. As there are 4000 shapes, without this it will be very slow. 3ghz quad-core will struggle. 
 

  
}

void draw(){
  scale(0.5);
  pushMatrix();//This saves the current state of the axis onto a stack
  background(255);
  fill(#673404);
  rect(675,400,390,700);
  translate(width/2,400);
  
  //Top left plant
  for (int i=1000;i>1;i-=1){
    
      fill(map(mouseX, 0, 800, 0, 255), random(255), map(mouseY, 0, 600, 0, 255)); //Generatees a random shade of the colour defined by the mouse position. X axis chooses red, y axis chooses blue. Values are remapped so mouse scales from 0-255
     ellipse(i*0.35,0,sqrt(i*20),20); 
     rotate(PI/((mouseX/2)-470*sqrt(2)));
   }
   popMatrix();//this will pop the state the matrix was at from the pushMatrix command from the stack. In this case, it will reset the axis back to standard. This allows mutliple uses of rotate without them affecting each other.
   
   //Top right plant
   pushMatrix();
   translate(width/2 +880,400);
   scale(-0.8,0.8);
     for (int i=1000;i>1;i-=1){
    
      fill(nextNumber()*10, random(255), 255-(nextNumber()*10)); //generates a random vibrant colour.
     ellipse(i*0.35,0,sqrt(i*20),20); 
     rotate(PI/((mouseX/2)-425*sqrt(2)));
   }
   popMatrix();
   
   //Bottom left plant
   pushMatrix();
      translate(width/2 +270,800);
   scale(0.5,0.5);
   rotate(HALF_PI*3);
     for (int i=1000;i>1;i-=1){
    
      fill(random(255),random(255) , random(255)); //generates a compeltely random colour
     ellipse(i*0.2,0,sqrt(i*20),20); 
     rotate(PI/((mouseX/2)-660*sqrt(2)));
   }
   popMatrix();
   
   //Bottom right plant
      pushMatrix();
      translate(width/2 +670,800);
   scale(-0.7,-0.7);
   rotate(HALF_PI*3);
     for (int i=1000;i>1;i-=1){
    
      fill(0, random(255), 0); //generates a random shade of green
     ellipse(i*0.28,0,sqrt(i*20),20); 
     rotate(PI/((mouseX/2)-660*sqrt(2)));
   }
   popMatrix();
   
}



  





