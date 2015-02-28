
//an array of stripes 
Stripe[] stripes = new Stripe[10];

void setup(){
  size(200,200);
  //initialize all "stripes"
  for (int i =0; i<stripes.length ; i++){
    stripes[i] = new Stripe();
  }
}

void draw(){
  background(0);
  //move and display all "stripes"
  for (int i = 0;  i <stripes.length ; i++){
    //check if mouse is over the Stripe
    stripes[i].rollover(mouseX,mouseY);
    //passing the mouse coordinates into and object
    stripes[i].move();
    stripes[i].display();
  }
}

class Stripe {
  float x;//horizontal location of stipe
  float speed;//speed of stripe
  float w;//width of stripe
  boolean mouse;//boolean variable keeps track of the object's states
  
  Stripe(){
    //define the data 
    x=0;
    speed=random(1);//all stripes start at 0
    w=random(10,30);//all stripes have a random positive speed
    mouse = false;
    
    
  }
  //Draw stripe 
  void display(){
    if(mouse){
      //boolean variable determines stripe color 
      fill(200,20,20);
    }else{
      fill(20,250,220,100);
    }
    noStroke();
    rect(x,0,w,height);
  }
  //move stripe
  void move(){
    x+=speed;
    if(x>width+20) x=-20;
  }
  //check if point is inside of stripe
  void rollover(int mx, int my){
    //left edge is x, right edge is x+w
    if(mx>x&&mx<x+w){
      mouse = true;
    }else{
      mouse = false;
    }
  }
  
}

  
   


