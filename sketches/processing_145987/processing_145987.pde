
//Naomi Rauch
//CS 118
//April 27, 2014

Flower pretty01, pretty02; //declare and name objects

ArrayList<Flower> garden;

void setup(){  //do normal setup stuff
  size(400,400);
  background(255);
  smooth();
  
  //initialize objects
  pretty01 = new Flower(width/2, height/2,50,0);
  pretty02 = new Flower(0,0,25,0);
  
  //initalize array list 
  
  garden = new ArrayList <Flower>();
  garden.add(new Flower(width/2,height/2, random(100), 0));
  
  
 
  
}

void draw(){
  
  background(255);
  
  if (mousePressed) { //makes a new flower when left button clicked
    if (mouseButton == LEFT){
     garden.add(new Flower(mouseX,mouseY,random(30),0));
    }
  }
  if(mousePressed) { //removes a flower
    if (mouseButton == RIGHT){
      
      garden.remove(1);
    }
  }
      
  
  
  for(int i = 0; i<garden.size();i++){
     
  
    Flower freshflower = garden.get(i);
    freshflower.update();
    freshflower.display();
    }
  //}
  //}
  
  
 
  
  
  //draw objects
  //pretty01.display();
  //pretty01.update();
  //pretty02.display();
 // pretty02.update();
  
  //draw arraylist
  
  
//}

println(garden.size());
}





//begin class block
class Flower { //name of class

float middia;//diameter of middle
float peddia;//diameter of petal
float xPos;
float yPos;
float a;
int colorred;
int colorgreen;
int colorblue;

//class constructor
Flower(float tempx, float tempy, float tempdia, float tempa){

xPos = tempx;
yPos = tempy;
middia = tempdia;
peddia = tempdia;
a = tempa;
colorred = int(random(255));
colorgreen = int(random(255));
colorblue = int(random(255));

  
}

void update(){
  if (dist(mouseX,mouseY,xPos,yPos)<middia){
    for(int i=0;i<100;i++)
    
    a = a+1;
  }
}
  

void display(){
  
  fourPetal(xPos, yPos, peddia, a, colorred,colorgreen, colorblue); //right petal
  fourPetal(xPos, yPos, peddia, QUARTER_PI+a, colorred, colorgreen,colorblue);//left petal
  fill(0);
  ellipse (xPos, yPos, middia, middia); //middle of petal
}


void fourPetal(float x,float y,float d, float a, float crayona, float crayonb, float crayonc){
  
  float dx = d*1.618;
  
  
  pushMatrix();
  translate (x,y);
  rotate(a);
  fill(crayona, crayonb, crayonc);
  ellipse (0, -dx/2, d,dx);//top
  ellipse (0, (dx/2), d,dx);//bottom
  ellipse (dx/2, 0, dx,d);//right
  ellipse (-dx/2, 0, dx,d);//left
  popMatrix();
}
}


