
int x= 250;  
int y = 250;  
int radius=25; 
   
void setup(){  
 size(400,400);   
  background(250);   
 smooth();  
}  
       
void draw(){  
noStroke();  
      
  float mapColorR = map(mouseX, 0, 330, 0, 366);  
  float mapColorG = map(mouseY, 0, width, 0,360);  
  fill(mapColorR, mapColorG, 0);  
  rect(0, 0, width, height);  
   
   
fill(150,257,369);  
ellipse(200,200,450,450);  
   
noFill();  
strokeWeight(5);  
fill(264);  
quad(330,0,0,160,260,400,550,240);  
fill(207,264,80);  
quad(240,0,60,140,320,470,440,200);  
   
fill(254,186,2);  
quad(200,140,380,222,300,110,200,280);  
   
fill(134,269,252);  
beginShape();  
vertex(150, 120);  
vertex(200, 240);  
vertex(260,240);  
vertex(160, 250);  
endShape();  
   
int x =260;  
int y =150;  
int w =80;  
int h =60;  
   
if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)){  
  fill(15,30,150);  
}else{  
  fill(191,313,150);}  
rect(x,y,w,h);  
         
strokeWeight(0);  
  ellipseMode(RADIUS);  
  float check = dist(x,y,mouseX,mouseY);  
  if(check>radius) {  
    fill(400,180,80);  
    radius++;  
  }  
else {
    fill(405);  
  }  
  ellipse(x,y,radius,radius);  
}  
    
void mousePressed() {  
  radius=25;     
 } 


