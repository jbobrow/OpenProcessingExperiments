
void setup() 
{ 
  size(500,500); 
} 

void draw() 
{ 
background(255); 
translate(width/2, height/2); // In die Mitte springen fill(0);
fill(60);
ellipse(0,0,30,30); 

 

pushMatrix(); 
float min= map(minute(),0,60,0,360); 
println(min); 
rotate(radians(min)); 
translate(0,-140); 
line(0,0,0,140); 
popMatrix(); 

pushMatrix(); 
float h= map(hour(),0,12,0,360); 
println(h); rotate(radians(h)); 
translate(0,-70);
line(0,0,0,70); 
popMatrix(); 


for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
  pushMatrix();
  rotate(radians(i)); // Um i rotieren
  translate(0, 200); // Um Radius verschieben
  fill(50);
  ellipse(0, 0, 30, 30);
  popMatrix();
}


pushMatrix(); 
float sec= map(second(),0,60,0,360); 
println(sec); 
rotate(radians(sec)); 
fill(250,18,18);
ellipse(0,200,20,20); 
popMatrix();

} 
