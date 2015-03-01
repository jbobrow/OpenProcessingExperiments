
// Step 1. Declare an object.

// 8 objects!
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;
Car myCar8;


//three images
  //george bush
  PImage b;
  //grandma
  PImage c;
  //clicker
  PImage d;

//two shapes
  //top iceberg
  PShape s;
  //bottom iceberg
  PShape t;

//font
  //univers light
  PFont font;


  //boolean = on off



void setup() {
  //composition size
  size(500,500);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,222,234),0,30,2); 
  myCar2 = new Car(color(255,54,81),0,100,5);
  myCar3 = new Car(color(90,15,44),0,250,1); 
  myCar4 = new Car(color(108,68,93),0,300,6);
  myCar5 = new Car(color(245,198,193),0,370,3); 
  myCar6 = new Car(color(219,49,54),0,400,7);
  myCar7 = new Car(color(255,121,126),0,430,4); 
  myCar8 = new Car(color(209,166,176),0,480,5);
  
  
  
  //loading three images
  b = loadImage("Bushbunny.jpg");
  c = loadImage("grandma_b.jpg");
  d = loadImage("hand-pointer-icon.jpg");
  
  
 //loading iceberg shapes 
  s = loadShape("iceberg_top.svg");
  t = loadShape("iceberg_bottom.svg");
  
  
  //loading font
  textSize(40);
  font = loadFont("Univers-Light-48.vlw");


}






void draw() {
  
  //smooths edges
  smooth();
  
  
  //#1 [frequency of practice]
  if(key == 'q'){
banana();

  }
  
  
  
  //#2 [recognition]
  if(key == 'w'){
apple();

  //pops up if pressed
  if (mousePressed){
  
  //grandma photo
  image(c, 10, 12, 480, 480);
}

}



//#3 [we have two minds]
if(key == 'e'){
avocado();

textFont(font);
    
    textSize(10);

    //text("conscious", 360,92);
    
    
    fill(255);
    text("click to find the unconscious mind", 310,470);

  
  
}



}







//#1
void banana(){
  
 //background white
background(255);
  
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
  myCar5.drive();
  myCar5.display();
  myCar6.drive();
  myCar6.display();
  myCar7.drive();
  myCar7.display();
  myCar8.drive();
  myCar8.display();
  
    
}





//#2
void apple(){
  

  background(255);
  
  //image george bush
  image(b,12,40,475,290);
  image(d,180,345,120,100);
  
  
}





//#3
void avocado(){
  //true or false
  boolean on = false;
  //background white
  background(255);
  
  
   //Pshape, iceberg top
  shape(s, 0, 5, 500, 500);
  if(on == false && mousePressed){
    on = true;
    shape(t, 0, 5, 500, 500);
} 


}






//void mouseClicked(){
  
//iceberg bottom









//Tab


// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int rectW = 50;
  int rectH = 100;
  int counter = 10;

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,rectW,rectH);
  }

  void drive() {
    xpos = xpos + xspeed;
    //if x positiom is greater than width of screen
    if (xpos > width) {
      //set x pos back to zero
      xpos = 0;
      //add ten to the width
      rectW += counter;
      //add ten to the height
      rectH += counter;
      //add ten to the speed
      xspeed += .01;
      //(counter=10)
      
    }
  }
}    

