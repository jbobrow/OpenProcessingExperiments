
void setup() {
 size(600,800);
  background(255);
  mouseX=width/2;
  mouseY=height/2;
 
} 
 
 //rectangle de nettoyage
 
void draw() {
  
  fill(0,0,0,20);
  rect(-10,-10,width+10,height+10);
  
 //tige
  
  fill(0,0,0,0);
  stroke(50+random(-30,30),200+random(-10,55),50+random(-50,100));
  bezier(mouseX,mouseY,random(-15,15)+mouseX,mouseY+height/4,random(-13,13)+width/2,height-100,width/2,height);
 
  
 //variables
  
  float Y= mouseX+random(-5/4*150,5/4*150);
  float U= Y+random(-5/4*150,5/4*150);
  float y= mouseY+random(-5/4*150,5/4*150);
  float u= y+random(-5/4*150,5/4*150);
  
 //petales
  
  
 
 stroke(250,200+random(-50,50),30+random(-20,30));
 bezier(mouseX,mouseY,Y,y,U,u,mouseX,mouseY);
 

 stroke(250,200+random(-50,50),30+random(-20,30));
 bezier(mouseX,mouseY,Y,y,U,u,mouseX,mouseY);
 

 stroke(250,200+random(-50,50),30+random(-20,30));
 bezier(mouseX,mouseY,Y,y,U,u,mouseX,mouseY);
  
  
 //rond centre petale
 
 float d= random(0,10);
 fill(250,200+random(-50,50),30+random(-20,30));
 stroke(250,200+random(-50,50),30+random(-20,30));
 ellipse(mouseX,mouseY,d,d);
  
}
