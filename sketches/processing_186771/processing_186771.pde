
int counter;

void setup() { 
  size(600, 600);
  background(255);  
  x=22
  

}

void draw() {  


  noStroke();
  background(250);
  fill(190,0,0,50);
  rect(0,0,600,500);
  fill(0,190,0,50);
  rect(0,100,600,600);
  stroke();
  fill(x,x,x)
  ellipse(width/2,height/2,500,400);
  ellipse(width/2+70,height/2,90,140);
  ellipse(width/2-70,height/2,90,140);
  

    if(mousePressed == true){
   
 x=x+2
 fill(x,x,x+x);
  ellipse(370+x,height/2+x,90,140);
  ellipse(230+x,height/2+x,90,140);
   fill(x+x,x,x);
  ellipse(370-x,height/2+x,90,140);
  ellipse(230-x,height/2+x,90,140);
  }
     
   


}
