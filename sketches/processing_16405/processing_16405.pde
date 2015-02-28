
int a = 1; // color
int b = 255;
int c = 120;
int d = 0;

void setup(){

size(600,600);
background(0); 
smooth();

}

void draw(){

 
  
noStroke();
fill(mouseX,mouseY,120,90);
ellipse(mouseX,mouseY,100, 100);


a = a + 1;
b = b - 1;
c = c + 1;
d = d + 1;
}


