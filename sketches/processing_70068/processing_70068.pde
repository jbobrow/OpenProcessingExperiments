
//zhaochang He zhaochah@andrew.cmu.edu
//hw4 function
//copyrights 


//variables
float x = 200;
float y = 200;
float speed = 1;


//setup
void setup(){
  size(600,400);
  smooth();
}

void draw(){
  background(255);
  display();
  moveEllipse();
  shootline();
}
  
//display ellipse  
void display(){
 noStroke();
fill(mouseX, mouseY,random(50,150),60);
ellipse(x, y, mouseX,mouseY);
}


// move the ellipse to upper left corner 
void moveEllipse(){
if (mouseX > width/2 && mouseY>height/2) {
x= x+speed;
y = y+ speed;
}else {
  x=x-speed;
  y=y-speed;
}
}

//press "up" to shoot out lines from the center of the ellipse
//to the mouse cursor. From this line you can vividly see that
//you can use your mouse to drag the ellipse back 
void shootline(){
if (keyCode == UP){
  strokeWeight(3);
  stroke(random(100,255), random(100, 255), random(100,255));
  line(x,y, mouseX, mouseY);
}
}




  





