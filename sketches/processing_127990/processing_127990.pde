
  
int x = 10;
int y = 10; 
  
  
//SECTION 2
void setup() {  //setup function called initially, only once
  size(500, 500);
  }
  
  
//SECTION 3
void draw() {  //draw function loops
  
    background(255);    // makes it black
  
    fill(255,0,0);
  
    ellipse(mouseX,mouseY,20,20);
  
    fill(0,255,0);
  
    ellipse(x,y,30,30);
 
    if (key == 'd') {
      x  = x+10;
    }
 
    if (key == 'w') {
        y = y-10;
    }
     
     if (key == 's') {
        y = y+10;
    }
  
  
  if (key == 'a'){
        x = x-10;
    }
  
if (key == 'c') {
   
  clear();
}
 if (x == mouseX) {
     stop();
   background(0);
   textSize(30);
    fill(random(225),random(225),random(225));
    text("You've Lost, sorry", 100,100); 
 }
if (x > 500){
  
  
x = -1;
  
}
  
else if (x < 0) {
  
x = 20;
}
  
if (y > 500) {
  
y *= -1;
}
else if (y < 0) {
y *= 20;
}
if (y == mouseY) {
     stop();
   background(0);
   textSize(30);
   fill(random(225),random(225),random(225));
   text("You've Lost, sorry", 80,100);  
   if mouse pressed
}
  
}

