

int i;

void setup(){
 
  background(255);
  size(600,600);
}

void draw(){
 //background(255);
  noStroke();


  triangle(mouseX,mouseY,random(600),random(600),random(600),random(600));

fill(random(255),random(255),random(255),50);

for(i=0; i<1; i++);
}


