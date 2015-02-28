
float value=0;

void setup() {
  size(400,400, P2D);
  smooth(4);
  background(30);

}

void draw(){

background(30);
 

 if (mousePressed) {
   //background(30);

   fill(120);
 stroke(255-value,255-value,255-value);
 strokeWeight(value/200);
 noFill();
 ellipse(mouseX,mouseY, value, value);
 ellipse(mouseX,mouseY, value/4, value/4);
 ellipse(mouseX,mouseY, value/7, value/7);
 ellipse(mouseX,mouseY, value/2, value/2);
 ellipse(mouseX,mouseY, value/3, value/3);
 ellipse(mouseX,mouseY, value/2, value/2);
 ellipse(mouseX,mouseY, value/5, value/5);
 ellipse(mouseX,mouseY, value/6, value/6);
 
 stroke(255-value,255-value,255-value,100);
 ellipse(random(width),random(height), value , value);
 
 stroke(255,40);
 strokeWeight(1);
        line(mouseX,30,mouseX,370);
        line(30,mouseY,370,mouseY);
        
 value= value+1;
 }
   //value= value+1;
   if (value>width){
     value=0;
   }
        
        stroke(255);
        strokeWeight(1);
        
        line(mouseX, 10, pmouseX, 30); 
        line(mouseX-20, 10, pmouseX, 30); 
        line(mouseX+20, 10, pmouseX, 30); 

        line(pmouseX, 370, mouseX, 390); 
        line(pmouseX, 370, mouseX-20, 390); 
        line(pmouseX, 370, mouseX+20, 390); 

        line(10, mouseY, 30, pmouseY); 
        line(10, mouseY-20, 30, pmouseY); 
        line(10, mouseY+20, 30, pmouseY); 

        line(390, mouseY, 370, pmouseY); 
        line(390, mouseY-20, 370, pmouseY); 
        line(390, mouseY+20, 370, pmouseY); 
        
        

}

void mouseReleased(){
  value=0;
  
}
