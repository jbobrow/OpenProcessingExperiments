
//my car assignment... :/


//global variables
Car myCar1, myCar2, myCar3;

void setup(){
  size(500,400);
  background(200);
  rectMode(CENTER);
  
  myCar1 = new Car(height/4, "blue");
  myCar2 = new Car(height/2, "red");
  myCar3 = new Car(height/4 * 3, "green");
}

void draw()
{
  background(200);
  myCar1.move(myCar2,myCar3);
  myCar2.move(myCar1,myCar3);
  myCar3.move(myCar1,myCar2);
  myCar1.display();
  myCar2.display();
  myCar3.display();
}

class Car{
   float x;
   float y;
   float w;
   float h;
   float speed;
   color hue;
   boolean win;
   String t;
   int dir;
   
   Car (float _y, String type){
      x = random(width/2);
      y = _y;
      w = 20;
      h = 10;
      t = type;
      if(t == "blue"){
        hue = color(0,0,random(100, 255));
      }else if(t == "red"){
        hue = color(random(100, 255),0,0);
      }else if(t == "green"){
        hue = color(0,random(100, 255),0);
      }      
      win = false;
      speed = random(2, 5);
      dir = 1;
   }
   void move(Car a, Car b){
     x += speed;
     if(x < 10 || x > width-10){
       //println(t + " wins!");
       if(x > width -10) x = width - 11;
       if(x < 10) x = 11;
       win = true;
       dir = -dir;
       speed  = random(3,7) * dir;
       a.speed = random(3,7) * dir;
       b.speed = random(3,7) * dir; 
             
     }
     //if(t == "green")println( speed);
     
   }
   void display(){
     if(win){
       if(t == "blue"){
        hue = color(0,0,random(255));
      }else if(t == "red"){
        hue = color(random(255),0,0);
      }else if(t == "green"){
        hue = color(0,random(255),0);
      }
      win = false;
     }
     fill(hue);
     rect(x,y,w,h);
     
   }
   
   
  
}
