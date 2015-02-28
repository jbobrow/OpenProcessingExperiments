
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;
Car myCar8;
Car myCar9;
Car myCar10;
float background = 0;

void setup() {
  size(1200,600);
  
  myCar1 = new Car(color(255,0,0),0,300,5); 
  myCar2 = new Car(color(0,0,255),0,20,1);
  myCar3 = new Car(color(0,255,0),100,150,2);
  myCar4 = new Car(color(255,0,255),50,250,1);
  myCar5 = new Car(color(255,255,0),0,580,3);
  myCar6 = new Car(color(0,255,255),0,375,2);
  myCar7 = new Car(color(175,35,0),25,480,4);
  myCar8 = new Car(color(200,50,0),0,70,3);
  myCar9 = new Car(color(100,100,100),0,450,2);
 
 myCar10= new Car(color(50,100,10),0,510,1);
  
}

void draw() {
  
  
  
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
 myCar9.drive();
  myCar9.display();
  myCar10.drive();
  myCar10.display();
}
  
  void mouseClicked() {
  if(background == 0){
    background(100,100,200); 
}

 
  
}


class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;


 
Car( color tempC,float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,70,30);
    rect(xpos,ypos+4,110,20);
    fill(255,0,0,200);
    
    rect(mouseX,mouseY,70,30);
    rect (mouseX,mouseY+4,110,20);
    ellipse(mouseX+30,mouseY+15,15,15);
    ellipse(mouseX-30,mouseY+15,15,15);
    
    fill(0);
    ellipse(xpos+30,ypos+15,15,15);
    ellipse(xpos-30,ypos+15,15,15);
    
    fill(0);
    rect(1000,200,30,90);
    smooth();
    fill(255,0,0);
    ellipse(1000,190,15,15);
    fill(255);
    ellipse (1000,230,15,15);
    fill(0);
    rect(1000,255,4,30);
    
  }
  
 
    void drive() {
    xpos = xpos + xspeed;
    if (xpos > 900 ) {
      
      xpos = 900;
    }  
    while (xpos >900)
    {xpos = 900;
    }
  
}
void keyPressed(){
  if (key =='s'){
    save("NoopurSuckhlecha.png");
  }
}
}
