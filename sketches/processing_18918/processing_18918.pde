
void setup(){
  size (400, 400);
  background (255);
  smooth();
}

int x = 0;
int y = 0;
int z = 0;





void draw(){
 
 background (255);
 
 

  
  x= x + 1 + (mouseX/10);
  y= y + 3 + (mouseX/30);
  z= z + 5 +(mouseX/50);
  
  
  
  
  strokeWeight(2);
  

  
  
  
  stroke (189, 242, 113);
  ellipse (abs(x), height*.25, 50, 50);
  line (10, 0, 10, height);
  
  
  stroke (41, 217, 194);
  ellipse (abs(y), height*.5, 50, 50);
  line (25, 0, 25, height);
  
  
  stroke (1, 162, 166);
  ellipse (abs(z), height*.75, 50, 50);
  line (50, 0, 50, height);
  
  
  
  if (x>400){
    x = -400;
  }
  
    if (y>400){
    y = -400;
  }

    if (z>400){
    z = -400;
  }
  



println("x = " + x);
println("y = " + y);
println("z = " + z);
println("turbo = " + mouseX);

}

                    
