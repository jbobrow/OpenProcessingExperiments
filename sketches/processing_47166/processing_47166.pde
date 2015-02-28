
void setup(){
  size(800,800);
  background(255);


}
 
void draw(){
 
 
 
  stroke(random(100,255),mouseY,random(100,255),10);
  fill(random(100,255),mouseY,random(100,255),10);  
ellipse(mouseX,mouseY,200,200);
ellipse(mouseY,mouseX,200,200);

stroke(0);
line(600,600,600,450);
stroke(0);
line(500,540,600,600);
stroke(0);
line(500,540,600,450);

stroke(0,0,0,70);
if(mousePressed == true) { //add some interaction
    fill(100,0,10);
line(mouseX,mouseY, 600, 600);

  }
  
  

if(mousePressed == true) {
   fill(100,0,10);
line(mouseX,mouseY, 600, 450);
  }
  



   
   
   
}


