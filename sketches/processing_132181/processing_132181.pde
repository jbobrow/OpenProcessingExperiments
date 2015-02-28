
int waardeX;
int waardeY;

void setup(){
size(200,200);
waardeX = 80;
waardeY = 90;

}
  
void draw(){
    
background(255);
   
 fill(255);
rect(waardeX,waardeY,40,60);      
  
 fill(255);
ellipseMode(CENTER);
ellipse(waardeX+20,waardeY-10,60,40);
  
line(waardeX,waardeY+60,waardeX-20,waardeY+85);
  
line(waardeX+40,waardeY+60,waardeX+60,waardeY+85);
  
fill(0);
ellipseMode(CENTER);
ellipse(waardeX,waardeY-10,20,10);
  
fill(0);
ellipseMode(CENTER);
ellipse(waardeX+40,waardeY-10,20,10);
 
     
     
   
 
 
}

