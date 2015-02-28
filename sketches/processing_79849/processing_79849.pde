
int blink = -300; 
float x;  
float y;  
float easing = 0.05;  
void setup() {
  size(600, 600);   
  noStroke();    
}  
void draw() {   
 background(145,156,213);
float targetX = mouseX; 
float dx = targetX - x;  
if(abs(dx) > 1) {  
x += dx * easing;  

}  

float targetY = mouseY;  
float dy = targetY - y;  
if(abs(dy) > 1) {  
y += dy * easing;  

}  

beginShape();
fill(#ffffff);  
ellipse(x, y, 60, 60); 
fill(235);
ellipse(x+mouseX/30, y+mouseY/30, 20, 20); 
endShape();   
beginShape();
fill(#ffffff);  
ellipse(x+80, y, 60, 60);
fill(235);
ellipse(x+80+mouseX/30, y+mouseY/30, 20, 20);
endShape();   
fill(204,140,177);  
rectMode(CORNER);  
rect (0, blink, 800, 300);  
if ((mousePressed == true) && (blink<20)) {  
blink+=20;  

  }  

else if (blink>-300)  

  {  

    blink-=20;  

  }  

}



