

void setup(){
size(600,600);
background(180,204,255);
smooth();
frameRate(2000);



}



void draw(){
   
  
  
  fill(255, 10);
  if (frameCount%20==0) rect(0, 0, width, height);
  
  fill(random(0,100),0,110);
  if(keyPressed){
    fill(random(0,200),20,random(0,200),30);
  if(key=='5')ellipse(random(width),random(height),map(mouseX,0,width,0,10),map(mouseX,0,width,0,10));
  if(key=='1')ellipse(mouseX,mouseY,random(20,100),random(-50,50));fill(255,234,0);
  
  if(key=='3')line(mouseX+random(-50,100),mouseY,random(0,150),mouseX);
  fill(random(0,100),20,random(0,200),50);
  if(key=='2')ellipse(mouseX+random(-20,200),mouseY+random(-300,300),40,40);
  if(key=='4')rect(mouseY,mouseX,mouseY,random(10,40));
  
  
  
}

   
   if(mousePressed){
     strokeWeight(random(0.2,5));
     stroke(28,102,255,110);
    
     line(mouseX,mouseY,mouseX+random(-90,200),mouseY+random(-50,50));
     //stroke(28,102,255,80);
     
     
     
 


     
     
   }
  
  }
  


