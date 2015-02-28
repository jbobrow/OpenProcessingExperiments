
int x;
int y;
int xSpeed;
int ySpeed;



void setup(){
size(800,600);
smooth();

// start ball in top left
x= 0;
y= 0;

xSpeed = 5;
ySpeed = 5;
  
}

void draw(){
  
background(255,255,255); //white background
// ellipse (width/2, height/2, 200,200);

x = x + xSpeed;
y = y + ySpeed;
//right
  if (x >= width) {
    xSpeed = xSpeed * -1;
    
    
  }
    //left
    if (x <= 0 ) {
    xSpeed = xSpeed * -1;
    
   
}
  //top
  if (y >= height) {
    ySpeed = xSpeed * -1;
    

  }


  //bottom
  if (y <= 0) {
    ySpeed = xSpeed * -1;
    
}
  
if(x <= width/2){

//this will papens if this is true
fill(18,182,255,100);//transparent blue

} else {
 //  otherwise do this  
 fill(0,229,28,200); //transparent green
}
noStroke();
//ellipse(mouseX, mouseY, 100, 100);

ellipse(x,y,200,200);
strokeWeight(3);
noFill();
if(x <= width/2){

fill(random(233),100,250,190);
ellipse(x,y,100,100);//smallest one
//this will papens if this is true

} else {
 //  otherwise do this 
  noFill(); 
 background(255,random(250),255);
 fill(255,255,255);
 ellipse(x,y,100,100);
}


}

