
Blob[] pin = new Blob[25];
Blob2[] pin2 = new Blob2[25];


void setup(){
  background(0);
  size(200,200);
  smooth();

  
  for(int i=0; i<pin.length;i++){
    pin[i]= new Blob(random(50,150),random(50,150));//this sets the conditions for the first set of points within the array
  }
  for (int j=0; j<pin2.length;j++){
    pin2[j]= new Blob2(random(50,150),random(50,150));//sets conditions for second set of pionts within the array
  }
}

void draw(){//this draws both points with respect to what was set up in the class
  
  for(int i=0; i<pin.length; i++){
    pin[i].move();
    pin[i].display();
  }
  for(int j=0; j<pin2.length; j++){
    pin2[j].move();
    pin2[j].display();
  }
}





class Blob{  //this sets up the first set of points that move across the screen
  
  float x1;
  float y1;
  
  Blob(float x1_,float y1_){
    
    x1= x1_;
    y1= y1_;
  }
  
  void display(){
    stroke(150);
    point(x1,y1);
  }
  
  void move(){
    x1=x1+random(-1,1);
    y1= y1+ random(-1,1);
  }
}



class Blob2{  //this sets up the second points that move across the screen
  
  float x2;
  float y2;
  
  Blob2(float x2_,float y2_){
    x2= x2_;
    y2= y2_;
  }
  
  void display(){
    stroke(255);
    point(x2,y2);
  }
  
  void move(){
    x2=x2+random(-1,1);
    y2= y2+ random(-1,1);
  }
}



