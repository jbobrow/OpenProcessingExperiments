
int x = 100;
int y = 100;
void setup()
{ 
  size(600, 600);
  rectMode(CENTER);
}

void draw() {
  background(255);
  if (mousePressed == true) {
    x = mouseX; 
    y= mouseY;}
    marvin(x,y);
    if (keyPressed==true) {
    if (keyCode==UP) {
    y=y-4;
    }
    if (keyCode==DOWN) {
     y=y+4;
    }
    if (keyCode==LEFT) {
     x=x-4;
    }if (keyCode==RIGHT) {
     x=x+4;
    }}
}

void marvin(int x, int y){
  fill(255);
  ellipse(x-15, y+50, 10, 40);
  ellipse(x+15, y+50, 10, 40);
  ellipse(x-25, y-20, 40, 10);
  ellipse(x+25, y-20, 40, 10);
  ellipse(x, y, 50, 100);
  ellipse(x, y-60, 40, 60);
  //face
  fill(0);
  
  ellipse(x+10,y-70, 8,8);
  
  if (keyPressed == true){
  fill(#9B0606);
    ellipse(x,y-45, 20,10);
  } else{
    
    rect(x,y-45, 15,5);}
    
 
      if (key == 'w'){
      line(x-16,y-70, x-4,y-70);
  } else{
   fill(0);
    ellipse(x-10,y-70, 8,8);
  }
  

   
}



