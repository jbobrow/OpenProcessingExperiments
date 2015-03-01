
int x,y;
int gray;  
int speed; 

void setup(){
  size(500,500);
  background(255);
  smooth();
  frameRate(30);
  gray = 0;
  speed = 1000000000;
  noStroke();
  fill(0);


}

void draw(){ 
 ellipse(mouseX, mouseY, random(50), random(50));
 fill(random(600),random(600),random(600));
}

 

void keyPressed() {
 
  
  
  switch(key){
    
     case't':
    
 
  gray += speed;    
 
  
  if(gray > 255) {
    speed = -speed;  
    gray = #FF0000;  
    println("speed = " + speed);
  }else if(gray < 0) {
    speed = -speed; 
    gray = #0000FF; 
    println("speed = " + speed);
  }
 
  background(gray); 

  
  
}
}




  void mouseDragged(){

background(0,0,0);
rect(mouseX,mouseY,50,50);

rect(mouseX^98,mouseY^26,10,50);

ellipse(mouseX^65,mouseY^56,30,50);
ellipse(mouseX^98,mouseY^210,120,50);

fill(random(400),random(500),random(600));
}





