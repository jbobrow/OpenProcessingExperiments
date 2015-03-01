
/*
Created by Angelo Vidal Faez.
Circles that draw a line between their centres when they overlap.
*/

Fig[] myFig;
int i;
int m;
int number = 20;

void setup() {
  size(1000,800);
  background(0);
  myFig = new Fig[number];
  
  for (m=0;m<number;m++){                          // initializes the circles
  myFig[m] = new Fig(random(1000),random(1000),random(500),random(5),random(5));
  }
}


void draw() {
  
  //background(0);
for(i=0;i<number;i++){
  myFig[i].display();
  myFig[i].move();
  }

for(i=0;i<number-1;i++){
  if (dist(myFig[i].e1.x, myFig[i].e1.y, myFig[i+1].e1.x, myFig[i+1].e1.y) < (myFig[i].diameter/2+myFig[i+1].diameter/2)){
    stroke(random(255),random(20));
    line(myFig[i].e1.x, myFig[i].e1.y, myFig[i+1].e1.x, myFig[i+1].e1.y);
  }
}
for(i=0;i<number-2;i++){
  if (dist(myFig[i].e1.x, myFig[i].e1.y, myFig[i+2].e1.x, myFig[i+2].e1.y) < (myFig[i].diameter/2+myFig[i+2].diameter/2)){
    stroke(random(255),random(10));
    line(myFig[i].e1.x, myFig[i].e1.y, myFig[i+2].e1.x, myFig[i+2].e1.y);
  }
}
for(i=0;i<number-3;i++){
  if (dist(myFig[i].e1.x, myFig[i].e1.y, myFig[i+3].e1.x, myFig[i+3].e1.y) < (myFig[i].diameter/2+myFig[i+3].diameter/2)){
    stroke(random(255),random(30));
    line(myFig[i].e1.x, myFig[i].e1.y, myFig[i+3].e1.x, myFig[i+3].e1.y);
  }
}
} 



class Fig {                      //class Fig
    PVector e1,vel;              //atributes
    float diameter;
    
    Fig(float PosX, float PosY, float diam, float speedX, float speedY){          //constructor
      e1 = new PVector(PosX, PosY);
      diameter = diam;
      vel = new PVector(speedX,speedY);
    }
    
    void display(){                              // method_1
         noStroke();
         noFill();
         ellipse(e1.x,e1.y,diameter,diameter);
    }
    
    void move(){                                // method_2
      e1.add(vel);
      if ((e1.x > width) || (e1.x < 0)) {
         vel.x = vel.x * -1;
       }
  
      if ((e1.y > height) || (e1.y < 0)) {
         vel.y = vel.y * -1;   
       }
    }
}

