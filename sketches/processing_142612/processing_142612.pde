
Walker[] w = new Walker [20];  //declare array
  
void setup(){
  size(400,600);
  background(0);
  frameRate(30);
  smooth();
       
      
//creates the objects
 
 for (int i = 0; i < w.length; i ++ ) {   //call for loop.
    w[i] = new Walker();
  }
}
     
void draw(){
  for (int i = 0; i < w.length; i++ ) { //  run through a loop.
  w[i].walk();
  w[i].display();
  }
    
    
  if (keyPressed)         // r to restart
  if (key == 'r' || key == 'R') {
  setup();
}
  
  
}
class Walker {
  
  float x;
  float y;
  int s;
  
  //constructor
  Walker() {
    x = random(width);//tells the walker where it can go
    y = random(height);
    s = 5;
  }
  
  
  void display() {
    noStroke();
    fill(random(150),200,0,100);
    ellipse(x, y, s, s);
     
    fill(0,200,30,200);
    ellipse(350,80,200,200);
    fill(#8b0000,700);
    ellipse(350,80,100,100);
    fill(0,100,300);
    ellipse(350, 80, 80,80);
    fill(0,0,550);
    ellipse(350,80,40,40);
     
    fill(0,200,30,200);
    ellipse(50,300,100,100);
    fill(#8b0000,700);
    ellipse(50,300,60,60);
    fill(0,100,300);
    ellipse(50, 300, 50,50);
    fill(0,0,550);
    ellipse(50,300,30,30);
     
    fill(0,200,30,200);
    ellipse(240,500,160,160);
    fill(#8b0000,700);
    ellipse(240,500,100,100);
    fill(0,100,300);
    ellipse(240, 500, 80,80);
    fill(0,0,550);
    ellipse(240,500,50,50);
     
     
     
     
  }
  
  void walk() {
    int option = int(random(4));
    if (option == 0) {
      x= x+s;
    } else if (option == 1) {
      x = x++;
    } else if (option == 2) {
      y = y + s;
    } else {
      y = y - s;
    }    
       
    
    
  x = constrain(x,0,width);//stop it form going out of the boundary
  y = constrain(y,0,height);
    }
    
}
