
// *code written by Erika

//defining variables, setting up containers
int a = 0; 
int b = 500; 
int o = 90; 

//consistant elements
void setup () {
  size(600,600);
  background(#70585E);
  noStroke();
  smooth();
}

//changing elements, such as triangles
void draw (){
  background (112,88,94,30);
  fill(#88cfa3,o);
//green triangle
  triangle (width/2,b,a,b,50,height/2);
  fill(#CECAE5,o);
//white triangle
  triangle (width/2,a,a,b,50,height/2);
  fill (#000000,o);
//black triangle
  triangle (width/2,a,b,a, 50,height/2);
//purple triangle
  fill (#4C364A,o);
  triangle (width/2,b,b,a,50,height/2);

//each coordinate is shared by atleast two triangles,
//giving the illusion of form
  
// rate of speed, position increasing/devreasing by 5pixles per frame
  a += 5; 
  b -= 5;
  
//triggers and defines repitition
 if (b<0) {
   b = 500;
   } 
  if (a>500) {
    a = 0 ;
  }
}



