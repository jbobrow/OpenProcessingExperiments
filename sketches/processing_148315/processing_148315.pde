
//array

Rubix[] cube = new Rubix[9]; //declare name and array
//(set # of "slots" in second []

int onCube = 0;


//Rubix cube1;
//Rubix cube2;
//Rubix cube3;
//Rubix cube4;
//Rubix cube5;
//Rubix cube6;
//Rubix cube7;
//Rubix cube8;
//Rubix cube9;

void setup(){
  size(700, 700);
  background(255);
  smooth();
  
  
  //initialize array using for loop (length=number of slots)
  
  for(int i = 0; i < cube.length/3; i++){
    cube[i] = new Rubix(300,300+(i*80),int(random(width)),int(random(height)), i); 
    
  }
    for(int i = cube.length/3; i < (cube.length/3)*2; i++){
    int j = int(map(i,3,5,0,2));
    cube[i] = new Rubix(380,300+(j*80),int(random(width)),int(random(height)), i);
     
      
  }
    for(int i = (cube.length/3)*2; i < (cube.length/3)*3; i++){
    int j = int(map(i,6,8,0,2));
    cube[i] = new Rubix(460,300+(j*80),int(random(width)),int(random(height)), i);
    
  }

}
  
//cube1 = new Rubix(300,300,25,25);
//cube2 = new Rubix(300,380,125,270);
//cube3 = new Rubix(300, 460, 500, 550);


//cube4 = new Rubix(380, 300, 10, 590);
//cube5 = new Rubix(380, 380, 350, 40);
//cube6 = new Rubix(380, 460, 600, 5);
//cube7 = new Rubix(460, 300, 100, 420);
//cube8 = new Rubix(460, 380, 520, 210);
//cube9 = new Rubix(460, 460, 17, 120);


//}

void draw(){
  background(255);
  
  //cube1.update();
  //cube1.display();
  
  //cube2.update();
  //cube2.display();
  
  //cube3.update();
  //cube3.display();
  
  //cube4.update();
  //cube4.display();
  
  //cube5.update();
  //cube5.display();
  
  //cube6.update();
  //cube6.display();
  
  //cube7.update();
  //cube7.display();
  
  //cube8.update();
  //cube8.display();
  
  //cube9.update();
  //cube9.display();
  
//  for(int i = 0; i < cube.length; i++){
//    cube[i].update(); //math
//    cube[i].display(); //visual
//  }
 
    for(int i = 0; i < cube.length; i++){
          cube[i].update(); //math
          cube[i].display(); //visual
  }

  println(onCube);
  
  
}

void mousePressed(){
   for(int i = 0; i < cube.length; i++){
         
      if(dist(cube[i].x1, cube[i].y1, mouseX-(cube[i].s/2), mouseY-(cube[i].s/2)) < cube[i].s){ 
      onCube = i;
   }
     
     
  }
}





//class block
class Rubix{
  
  //variables declared here
int s = 80;
int x1;
int y1;
int x2;
int y2;
int x;
int y;
int i = 2;
int t = 100;
int r;
int g;
int b;
int offset;
int cubeNum;

//class constructor
  
  Rubix(int tx, int ty, int vx, int vy, int cn){
    
    //variables initialized ("set up") here
    
 x1 = vx;
 y1 = vy;
 x2 = tx;
 y2 = ty;
 r = 255;
 g = 0;
 b = 0;
 offset = int(random(0,20));
 cubeNum = cn;
    
  }
  //method
  void update(){
    
    //variables that get updated
    
      if (mousePressed && onCube == cubeNum){
    
   if(dist(x1, y1, mouseX-(s/2), mouseY-(s/2)) < s){ 
    x1 = (mouseX-(s/2))+offset; //if mouse is pressed, then the rectangle will follow the mouse
    y1 = (mouseY-(s/2))+offset;
   }
 
  }
  
if(dist(x1,y1,x2,y2) < 8){ //if the red square is moved over the invisible square, it will turn blue
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));
}else{
  r = 0;
  g = 0;
  b = 255;
}
  
    
  }
  
  void display(){
  
  strokeWeight(1);  
  noFill();
  rect(x2,y2,s,s); //invisible square
  
  
  
  fill(r,g,b);
  strokeWeight(5);
  stroke(0);
  rect(x1, y1, s,s);//red or blue rectangle
  
  
  
  
  
  
    
    //anything in your "object" that gets drawn to the screen
    
  }
  
}



