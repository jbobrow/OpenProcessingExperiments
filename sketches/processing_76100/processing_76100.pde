
//Seb Lee-Delisle, http://www.openprocessing.org/sketch/47766
//Claus Neergaard, http://www.openprocessing.org/sketch/6245
int count = 200;
float[] xp = new float[count];
float[] yp = new float[count];
float[] xSpeed = new float[count];
float[] ySpeed = new float[count]; 

int radius = 3; 



void setup() {   
  
size(900, 500);  
smooth(); 

for (int i = 0; i < count; i=i+1){


 xp[i] = int(random(width)); 

 yp[i] = int(random(height));

 xSpeed[i] = random (-2,2);  

 ySpeed[i] = 0; 
   
   
}
}  

void draw() {  
fill (0,25);
rect (0,0,width,height);

speed();
bounce();
balls();
lines();
}

void lines(){
  
  for (int i = 0; i < count; i = i + 1) {   
  for (int a = i; a < count; a = a+ 1) {  
  if (dist(xp[a], yp[a], xp[i], yp[i]) < 100) {  
  line(xp[a], yp[a], xp[i], yp[i]);  
  stroke(255);
  strokeWeight(0.1);
}
}
}
}

void speed(){
  
for (int i=0; i<count; i=i+1){
 xp[i] = xp[i] + xSpeed[i];
 yp[i] = yp[i] + ySpeed[i]; 
 
}
}


void bounce(){

  for (int i = 0; i <count; i = i+1){
   
  if (xp[i] < radius) {
    
  xSpeed[i] = xSpeed[i] *-0.25;
    
  xp[i] = radius;
    
  }
    if (xp[i] > width-radius) {
      
      xSpeed[i] = xSpeed[i] * -0.25;
      
      xp[i] = width - radius;

}
}
}
 
void balls(){
 for (int i=0; i>count; i=i+1){
  ellipse(xp[i], yp[i], radius*2, radius*2); //last but not least, the balls themselves.
  fill (0,25); //white fill
  stroke(0,25); 
}
}
   
void mousePressed() {   
for (int i=0; i<count; i=i+1){

 xSpeed[i] = xSpeed[i]*1.5;        
 ySpeed[i] = random (0,0);

 }
 }


