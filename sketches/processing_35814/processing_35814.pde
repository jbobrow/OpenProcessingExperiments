



int [] easing=new int [1];
int num = 200;
int x[] = new int [num];
int y[] = new int [num];



void setup(){
  size (500,400);
  background(255);
  smooth();
  strokeWeight(0.3);  
 
 noCursor();
}
void draw(){
 background (0);


//strokeWeight(0.3);
  for (int i = x.length -1; i>0; i--){
    x [i] = x[i-1];
    y [i] = y[i-1];
    
  }
  
  x[0] = mouseX;
  y[0] = mouseY;


for (int i = 0; i < x.length; i++) {
float r = random(50);
strokeWeight(r);
float offset = r * 5.0; 
 fill (174,221,60,r);
     stroke(116, 193,206,r); 
     
     
if (mousePressed == true) {
fill(238,16,36); 
} else {
fill(174,221,60,r); // Black
} 

/*float targetX = mouseX;
float targetY = mouseY;
float x = 0;
float y = 0;
x += (targetX - x) * easing;
y += (targetY - y) * easing;
fill(153);
ellipse(mouseX, mouseY, 20, 20);
fill(255);
ellipse(targetX,targetY, 40, 40);*/


    ellipse(x[i],y[i],20,20);

    


}
    
}
  
  
  


