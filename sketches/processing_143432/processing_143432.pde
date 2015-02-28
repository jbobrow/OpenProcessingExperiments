
/*konkuk Unisversity
KU DYNAMIC MEDIA SOS iDesign 
Name:Park Seeun
ID:201420078
*/
    

float xW = 100; 
float direction =1; 
float angle=4; 
float i = 5;

void setup(){ 

size(600,600); 
background(255); 
colorMode(RGB); 
} 

void draw(){ 
 
noStroke(); 
fill(0,100); 
rect(0,0,width,height); 
  for (int p = -5; p < width; p = p +20 ) {   
  for (int w = -5; w < height; w = w +20 ) {   
  stroke(255,0,0);
  strokeWeight(1);   
   noFill();   
rect(p,w,100,100);  
  }  
 }  
  angle += 0.01; 

translate(width/2,height/2); 
scale(0.2); 

for (int s=0; s<width; s+=50){ 
for (int j=0; j<height; j+=50){ 
rotate(angle); 

pushMatrix(); 

stroke(255); 
strokeWeight(random(10));  
fill(0, 0, 0, 100);
translate(s,j);
rotate(angle); 
line(0,600,600,600);

noStroke(); 
ellipse(0,0,20,20);

pushMatrix(); 

while (i < 80){
 line(30, i, 80, i);    
 i = i + 10;        
}
for (int q=0; q<width; q+=50){ 

fill(s,600,600); 
translate(300,300); 

rotate(angle); 
scale(1); 
rect(0,0,20,20); 
} 
popMatrix();      
popMatrix(); 
    } 
  } 

  xW = xW + (1*direction); 
if ((xW <0)||(xW>150)) { 
   direction*=-3; 
} 
} 

void mousePressed() { 
noLoop(); 
} 

void mouseReleased() { 
loop(); 
} 

void keyPressed(){
  redraw();
}
