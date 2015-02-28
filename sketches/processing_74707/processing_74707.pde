
Car racecar; 
MyCar superracecar;

void setup() {
  size(900,300);
racecar= new Car();
superracecar= new MyCar();
  smooth();
}

void draw() {
if (mouseX>width/2) {
  background(0,153,255);
    noStroke();
   //moon
    fill(255,255,102);
      ellipse(790,70,80,80);
}
  else{
  background(50);
   //sun
    fill(255,204,102);
      ellipse(790,70,80,80);
  }
  racecar.move();
  racecar.display();
  superracecar.move();
  superracecar.display();
}



 class MyCar extends Car {
   color c;
   float x;
   float y;
   
   MyCar(){
    x=width/2.5;
    y=250;
   }
   
  void move() {
    super.move();
    x+=(mouseX-x)/50;
  }
  
void display(){
    smooth();
    noStroke();

   //body
    fill(255, 225, 102);
    rect(x, y-80, 100, 50);
    //body
    rect(x-50, y-40, 200, 60);
    fill(153,153,153);

    //wheels 
    fill(0);
    ellipse(x, y+26, 50, 50);
    ellipse(x+100, y+26, 50, 50);
  }

}



class Car {
  float x;
  float y;
  color c;
  
 Car() {
    x=width/2;
    y=250;
 
 }
  void move() {
    x+=(mouseX-x)/100;
  }
  
void display(){
    smooth();
    noStroke();
 
   //tree1
    fill(153, 140, 40);
 rect(130, 220, 20, 160);
     fill(153,204,153);
    triangle(120,170,140,130,160,170);
  triangle(110,205,140,140,170,205);
   triangle(100,240,140,170,180,240);
    
     fill(153,204,153);


   //body
    fill(255, 0, 102);
    
    rect(x, y-100, 100, 50);
   
    
    //body
    rect(x-50, y-50, 200, 70);
     fill(153,153,153);

    //wheels 
    fill(0);
    ellipse(x, y+26, 50, 50);
    ellipse(x+100, y+26, 50, 50);
  }

}


