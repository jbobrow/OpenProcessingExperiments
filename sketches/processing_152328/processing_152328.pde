
/*float r;
float g;
float b;
*/
int x,y;
boolean p=false;

void setup(){
  size(1100,950);
   background(255);    
   smooth();
}

void draw(){

/*for (int i = 50; i < 800; i = i + 100) {
  point (60, i);
 
  point (160, i);
 
  point (260, i);
  
  point (360, i);
 
  point (460, i);
  
  point (560, i);
  
  point (660, i);
  
  point (760, i);
}

for (int j = 100; j < 800; j = j + 100) {
  point (10, j);
 
  point (110, j);
 
  point (210, j);
  
  point (310, j);
 
  point (410, j);
  
  point (510, j);
  
  point (610, j);
  
  point (710, j);
}
*/

for (int i = 50; i < 800; i = i + 200) {
  point (200, i);
 
  point (400, i);
 
  point (600, i);
  
  point (800, i);
  
  point (1000, i);
 
  
}

for (int j = 150; j < 800; j = j + 200) {
  point (110, j);
 
  point (310, j);
 
  point (510, j);
  
  point (710, j);
  
  point (910, j);

}

/*

r=random(255);
g=random(255);
b=random(255);
//make background color random
background(r,g,b);

if (mousePressed){
  background(255);
}

*/

 if(mousePressed==true){
    strokeWeight(6);
     stroke (random(333), random(333), random(333));
    line(x,y,mouseX,mouseY);
    x=mouseX;
    y=mouseY; 
  };

}

void keyPressed ()
{
  
  // take screenshot
  
    if (keyPressed && (key == 'b'))
  {
    background(random(333), random(333), random(333));
    fill (random(333), random(333), random(333));
  }
  
   if (keyPressed && (key == 'v'))
  {
    saveFrame ("dot_####.jpg");
    background(random(333), random(333), random(333));
  }
  // erase 
  if (keyPressed && (key == 'e'))
  {
    background (0,0,0);
  }
  


  
 
  {
  endRecord();
 
  p=false;
}
}





