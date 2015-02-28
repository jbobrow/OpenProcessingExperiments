

Walker[] w = new Walker [8];  //declaring array

void setup(){
  size(950,700);  //size of sketch
  background(0,50,0);  //black background
  frameRate(20);  //speed of animation


//objects
 for (int i = 0; i < w.length; i ++ ) {    //initializing each walker with a for loop
    w[i] = new Walker();
  }   //end of loop
}     //end setup
 
void draw(){
  for (int i = 0; i < w.length; i++ ) { //run each object with a for loop
    w[i].walk();
    w[i].display();
   
   
    for (int j = 0; j < w.length; j++ ) {    //checking the objects with a for loop.
       if ( (  w[i].intersect(w[j]) )  ) {   //pass w[j] to the intersect function *
            w[i].inter();
                       //if boolean called intersect is true then run .inter()
           } else {
           w[i].no_inter();
           }   //end if      
    }   //end second loop
   
   
  }    //end loop
  
  if (keyPressed)         //restart the sketch by pressing R
  if (key == 'r' || key == 'R') {
  setup();
}   //end keyPressed function
 
if(mousePressed){
 background(0,90,90);    //if mouse is pressed then background changed to white
 fill(0,102,0);      //color of rectangle
rect(mouseX,mouseY, 25,25);  //rectangle controlled by mouse, release to restart
}
}      //end draw
 
class Walker {      //declare walker class
 
  float x, y;        //decalre float
  int s;             //declare integer 1
  int t;             //declare integer 2
  color c = color(70, 40);  //end random, only gets dark if spots an overlap
 
  //constructor
  Walker() {
    x = random(width);     //random x value
    y = random(height);    //random y value
    s = 9;                //integer 1=9
    t = 20;                //integer 2=20
  }
 
 
  void display() {
    noStroke();
    fill(random(150), 150);      //color of squares random grey scale
    rect(x,y,t,t);              //squares are displayed 
    ellipse(mouseX,mouseY,s,s); //square with random grey scale that is movable with mouse
    
  }  //end display
 
  void walk() {     //start walk function
    int option = int(random(4));  //declare random integer 0-4 
    if (option == 0) {
      x = x + s;               //first option
    } else if (option == 1) {  //second option
      x = x - s;
    } else if (option == 2) {  //third option
      y = y + s;
    } else {
      y = y - s;
    }     
    x = constrain(x,0,width);   //x value will not exceed width
    y = constrain(y,0,height);  //y value will not exceed height
    }   //end Walk
     
 //intersect and no intersect functions for color
    void inter() {
    c = color(50,140,50);   //green 50% transparency
    fill(c);
    text("IIIIIIIIIIIIIIIIIIII", x, y);   //display small green lines at intersections
  }
    void no_inter() {      //back to grey when no intersectino
    c = color(50, 10);
    }
   
  //check other walkers function with boolean test
 boolean intersect(Walker w0) {   //use object as arguments in functions
  float d = dist(x,y,w0.x,w0.y);  //distance between X,Y and the walker that was passed X,Y
 if ((d > 0) && (d < s*5)) {                   //multiplying s*3 just to increase possibility
    return true;    
  } else {
    return false;
    }
  }  //end boolean test
 
  
   
   
}  //end class

