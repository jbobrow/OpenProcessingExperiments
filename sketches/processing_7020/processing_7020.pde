
Stripe[] mystripes = new Stripe[10];
Car myCar = new Car();
float xpos = 0;
float ypos = 570;

void setup(){
   size(800,600);
   for (int i = 0; i < mystripes.length; i++ ) {
      mystripes[i] = new Stripe();
    }
}

void draw(){
   background(255);
   for (int i=0; i<mystripes.length; i++){
      mystripes[i].moveStripe();
      mystripes[i].displayStripe();
      mystripes[i].rollover(xpos,ypos);
   }
   
   myCar.movecar();
   myCar.drawcar();
   myCar.jigglecar();
}

class Stripe{
   float x;
   float w;
   float speed;
   boolean mouse;
  
   Stripe(){
      x = 0;
      w = random(50,400);
      speed = random(5);
      mouse = false;
   } 
   
   void displayStripe(){
      noStroke();
      if(mouse){
      fill(255,0,0,50);
      }
      else{
      fill(0,0,255,50); 
      }
      rect(x,0,w,height); 
   }
   
   void moveStripe(){
      x = x + speed;
     
      if (x > width){
         x = 0;
      } 
   }
   
   void rollover(float mx, float my){
      if(mx > x && mx < x+w){
        mouse = true;
      } 
      else{
        mouse = false; 
      }
   }
}

class Car{
  
   float speed; 
  
   Car(){
     
      speed = 2;
   }
  
   void drawcar(){
      stroke(1);
      strokeWeight(4);
      ellipseMode(CENTER);
      fill(255);
      ellipse(xpos+30,ypos, 70, 40);
      noStroke();
      fill(0);
      ellipse(xpos+30, ypos+10, 100, 30);
      stroke(1);
      strokeWeight(4);
      fill(255);
      ellipse(xpos+7, ypos+20, 15, 25); 
      ellipse(xpos+57, ypos+20, 15, 25);
      fill(0);
      strokeWeight(4);
      line(xpos+30, ypos-18, xpos+30, ypos+20);  
   }
  
   void movecar(){
      xpos = xpos + speed;
      
      if ((xpos+50 > width) || (xpos < 0)){
         speed = speed * -1;
      }
   }
  
  void jigglecar(){
      ypos = ypos + random(-0.5,0.5);
  } 
}

