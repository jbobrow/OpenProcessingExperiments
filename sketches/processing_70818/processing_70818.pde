
void setup (){
  size (400,400);
  //white
  background(255);

}

void draw (){
 // line (mouseX,mouseY,pmouseX,pmouseY);
 
 //green
   fill(4,200,0);
   ellipse(mouseX, mouseY, 15+random(20), 15+random(20));
   
 //orange
   //fill(204, 102, 0);
   
 //yellow
   fill(255,204,0); 
   ellipse(mouseX+10, mouseY-20,15+random(20), 15+random(20));
   
 //red
   fill(150, 0, 0);
   ellipse(mouseX-15, mouseY+20, 15+random(20), 15+random(20));
   
 //purple 
   //fill(60, 6, 100);
   
 // purple
   fill(130,10,220);
   ellipse(mouseX+20, mouseY+15,15+random(20), 15+random(20));
    
 //blue
  fill(25,100,300);
  ellipse(mouseX-20, mouseY-15, 15+random(20), 15+random(20));
  
 //brown
   //fill(50, 40, 20);
   
 // ellipse(mouseX, mouseY, 5+random(10), 5+random(10));

}  



