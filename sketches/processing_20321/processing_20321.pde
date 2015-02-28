
void setup (){
 size (500,500);
 
  background(255,255,255);
  
  
}
void draw (){

noStroke();
  
  fill ( 0,84,165);
rect (400,300,100,200);
rect (0,0,100,200);

  fill (237,27,36);
rect (100,0,200,300);
rect (200, 400, 200, 100);

  fill (254,242,0);
rect(300,0,200,200);
rect(0,300,200,200);

stroke (1);
strokeWeight(10);
line (0,0,0,500);
line (0,0,500,0);
line (0,500,500,500);
line (500,0,500,500);
  
/* lines inside */

  strokeWeight (6);
line (0,300,500,300);
line (0,200,100,200);
line (200,300,200,500);
line (100,0,100,300);
line (200,400,400,400);
line (400,300,400,500);
line (300,300,300,400);
line (300, 200, 500, 200);
line (300, 0, 300, 400);
/* color fill */


}

                
                
