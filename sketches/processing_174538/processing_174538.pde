
int x,y;
void setup(){ 

size(500,500);
background(255);//
noStroke(); 
smooth(); 
} 
void draw(){ 
}

void mouseDragged(){ 

if(key == 'z')  {
 fill(random(255),random(255),random(255));  
  ellipse(mouseX+70,mouseY+70,50,50); 
  ellipse(mouseX+45,mouseY+45,60,60); 
  ellipse(mouseX+15, mouseY+15, 80,80); 
  ellipse(mouseX-15,mouseY-15,60,60); 
  ellipse(mouseX-40,mouseY-40,50,50); 
}
if(key == 'x')  { 
  stroke(0);
 fill(random(255),random(255),random(255));  
  rect(mouseX+50,mouseY+50,30,30);
  rect(mouseX+25,mouseY+25,40,40); 
  rect(mouseX, mouseY, 50,50); 
  rect(mouseX-15,mouseY-15,40,40); 
  rect(mouseX-30,mouseY-30,30,30); 
} 
  
if(key == 's'){
 fill(255);ellipse(mouseX,mouseY,200,200);
}

if(key == 'r')fill(random(255),0,0);{
if(key == 'g')fill(0,random(255),0);
if(key == 'b')fill(0,0,random(255));
  rect(mouseX+50,mouseY+50,30,30);
  rect(mouseX+25,mouseY+25,40,40); 
  rect(mouseX, mouseY, 50,50); 
  rect(mouseX-15,mouseY-15,40,40); 
  rect(mouseX-30,mouseY-30,30,30); 
noStroke(); 
 }  
}

  



