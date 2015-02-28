
boolean pig = false;
class Pig {  
  color c;
  float x;
  float y;
  float xspeed;
  int state = 0;

  Pig(color tempC,int tempX, int tempY, int tempXspeed) {
    c = tempC;
    x = tempX;
    y = tempY;
    xspeed = tempXspeed;
  }

  void display() { // Function.
    ellipseMode(CENTER);
    //ears
    fill(252,227,245);
    ellipse(x-10,y-38,width/20,height/20);
    ellipse(x+10,y-38,width/20,height/20);
    //body
    stroke(224,197,216);
    fill(c);
    ellipse(x,y+10,width/3,height/3);
    //head
    stroke(224,197,216);
    fill(252,197,216);
    ellipse(x,y-20,width/5,height/5);
    //snout
    noStroke();
    fill(252,227,245);
    ellipse(x,y-17,width/8,height/8);
    //nose
    noStroke();
    fill(224,197,216);
    ellipse(x,y-15,width/16,height/16);
    //nouse holes
    fill(0);
    ellipse(x-2,y-15,width/125,height/75);
    ellipse(x+2,y-15,width/125,height/75);
    //eyes
    fill(0);
    ellipse(x-6,y-35,width/75,height/75);
    ellipse(x+6,y-35,width/75,height/75);
    //mouth
    noStroke();
    fill(0);
    ellipse(x,y-7,width/70,height/70);
    //hands
    noStroke();
    fill(252,227,245);
    ellipse(x-20,y+5,width/16,height/10);
    ellipse(x+20,y+5,width/16,height/10);
  }
  void move() { // Function.
  
   if(state == 0) {
     x = x + xspeed;
     if(x > 170) {
       y = 170;
       state = 1;
     }
   } else if(state == 1) {
     y = y + xspeed;
     if (y > 190) {
       y = 190;
       state = 2;
     } 
   } else if(state == 2) {
     x = x - xspeed;
     if (x < 30) {
       x = 30;
       state = 3;
     }
   } else if(state == 3) {
     y = y - xspeed;
     if(y < 50) {
     y = 50;
     state = 0;
    }
     if (keyPressed) {
    pig = true;
  } else {
    pig = false;
  }
   if(pig) {
     background(0);
     fill(175);
     ellipse(125,50,width/10,height/10);
     ellipse(75,50,width/10,height/10);
     fill(175);
     ellipse(100,100, width/3,height/2);
     fill(255);
     ellipse(90,80,width/15,height/15);
     ellipse(110,80,width/15,height/15);
     fill(0);
     ellipse(90,80,width/30,height/30);
     ellipse(110,80,width/30,height/30);
     fill(247,150,230);
     ellipse(100,130,width/18,height/12);
     fill(150);
     ellipse(100,110,width/5,height/6);
     fill(0);
     ellipse(100,110,width/20,height/30);
      
   } else{
      //ears
    fill(252,227,245);
    ellipse(x-10,y-38,width/20,height/20);
    ellipse(x+10,y-38,width/20,height/20);
    //body
    stroke(224,197,216);
    fill(c);
    ellipse(x,y+10,width/3,height/3);
    //head
    stroke(224,197,216);
    fill(252,197,216);
    ellipse(x,y-20,width/5,height/5);
    //snout
    noStroke();
    fill(252,227,245);
    ellipse(x,y-17,width/8,height/8);
    //nose
    noStroke();
    fill(224,197,216);
    ellipse(x,y-15,width/16,height/16);
    //nouse holes
    fill(0);
    ellipse(x-2,y-15,width/125,height/75);
    ellipse(x+2,y-15,width/125,height/75);
    //eyes
    fill(0);
    ellipse(x-6,y-35,width/75,height/75);
    ellipse(x+6,y-35,width/75,height/75);
    //mouth
    noStroke();
    fill(0);
    ellipse(x,y-7,width/70,height/70);
    //hands
    noStroke();
    fill(252,227,245);
    ellipse(x-20,y+5,width/16,height/10);
    ellipse(x+20,y+5,width/16,height/10);
  } 
    
   }
 }
}



