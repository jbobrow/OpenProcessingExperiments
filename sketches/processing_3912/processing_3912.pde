
void setup() {
size(400, 400); 

color box1 = color(58, 153, 229); 
color box2 = color(208, 217, 224); 
color box3 = color(25, 36, 44); 
color box4 = color(62, 85, 103);  
 
fill(box3); 
rect(0, 200, 200, 200); 
fill(box1); 
rect(200, 0, 200, 200); 
fill(box2); 
rect(0, 0, 200, 200); 
fill(box4); 
rect(200, 200, 200, 200);

} 
 
void draw(){ 
   
float x= random (width); 
float y= random (height); 
 
fill(x,y-250,250,50);  
  rect(x,y,10-second(),millis()*1); 
} 
 
void mousePressed(){ 
 
} 

