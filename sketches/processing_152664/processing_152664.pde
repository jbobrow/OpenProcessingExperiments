

float xoff = 1.0;
float xincrement = 0.005; 

float a,b,c,d,e,f,g,h,i,j,k,l,o,p;
float speed = 2;

void setup()
{
  size(800, 800);
  background(255);


}
void draw(){
 stroke(0,0);
 fill(0, 5);
  rect(0,0,width,height);
  
  fill(255);
  stroke(255);
  strokeWeight(9);
  point(mouseX,mouseY);

 // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*100;
  float m = noise(xoff)*200;
  // With each cycle, increment xoff
  xoff += xincrement;
  
  
  pushMatrix();
  
  //first rotating line and dot
  
 translate(mouseX,mouseY);
 rotate(radians(n * 20  % 360)); //Rotate 360 around the above translation
 stroke(255);
 point(a,b);
 strokeWeight(1);
 line(0,0,a,b);
 
  //second rotating line and dot
 translate(a,b);
 rotate(radians(n * 50  % 360)); //Rotate 360 around the above translation
 stroke(255);
 point(0,0);
 point(0,0);
 strokeWeight(1);
 line(0,0,c,d);
 
 

 
   //3rd/4th rotating line and dot
 translate(c,d);
 rotate(radians(n * 50  % 360)); //Rotate 360 around the above translation
 stroke(255);
 strokeWeight(9);
 point(0,0);
 point(e,f);
 strokeWeight(1);

 line(0,0,e,f);
 
  
 popMatrix();
 a= n ;
 b= n ;
 c= m ;
 d= m ;
 e = n+30;
 f = m+50;
 g= m +50;
 h = m+80;
 
}


