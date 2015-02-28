
//Homework 7.2
//cloud generator
//Tommy Coggin


//sets the number of dots
dots []  dots= new dots [30];


void setup(){
  size(300,300);
  background(#17B9D3);
  
  
  //seeds arrays
  for (int i=0; i<dots.length; i++){
    dots[i]= new dots ();
  }
   
  //sets color of dots
  stroke(255);
}

void draw(){
  
  //creates ground
  fill(0,255,0);
  rect(0,250,width,50);
  
  //updates dots and draws them
  for (int i=0; i<dots.length; i++){
    dots[i].update();
    dots[i].display();
    } 
}

class dots {
  
  //controls x and y coords
  float x1= random(0,300);
  float y2 = random(0, 100);
  
  //controls color of dots
  color c = color(random (150,255));
  
  dots (){
  }
  
  void update() {
    
    // controlls where the dots are drawn when they are updated
    x1= x1 + random (-10,10);
    y2= y2 + random (-2,2);
    
    // if the dots making the clouds fall below height/2 then reset them 
    if(y2>height/2){
      y2=50;
    }
  }
  
  void display(){
    fill(c);
    stroke(255);
    ellipse(x1,y2, 25,25);
  }
}
  
  
  

