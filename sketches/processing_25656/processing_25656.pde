
float r = PI/6;

              
void setup (){
  size (500,500);
  background (30);
  smooth();  
  }
  
  void draw (){
  if(mousePressed){
    pushMatrix ();
translate (mouseX, mouseY); //move the origin point according to mouse value
rotate (r);
   fill(mouseY, random(10), random(255));
   stroke(200);
   line (0,0,random(10),-random(10));
   line (0,0,-random(30),random(15));
   line (0,0,-random(10),-random(10));
   line (0,0,random(15),-random(30));
   
     noStroke();
   triangle (0, 0,random(50),-random(25),random(20),random(40));
   
   fill(random(10), mouseY, random(255));
   triangle (0, 0,random(60),-random(30),random(40),random(40));
   fill(220);
   rect(0,0,15,15);
  popMatrix ();

r += PI/100; //increment angle – make smaller to slow rotation
  }
  }
                
