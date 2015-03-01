
int xpos = 450;
int ypos = int(random(300));
int count = 0;

void setup() {
size(500,500);
background(0);
}
 
void draw()  {
stroke(255);
for (int i = 0; i < 500; i = i+50)
  {
    line(0, i, 500, i);
  }
;
fill(random(255),random(255),random(255));
ellipse(mouseX,mouseY,computeRandom(50),computeRandom(50));
if (keyPressed) {
  while (count <= 10000){
    rect(random(300),random(300),random(200),random(200));
    count = count + 1;
    if (key == 'g') {
      background(255);}
  }
    


    
  
 
    
}
  
 


}


  
 
 
int computeRandom(int n)
{
  if (n >= 20)
  {
      return n;
  }
  else
  {
      return int(random(255)) - 13;
      }
}
 








