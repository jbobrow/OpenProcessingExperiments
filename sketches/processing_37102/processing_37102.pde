
float x =100;
float y =200;
float a =200;
float b =300;
float c =250;
float d =250;

void setup(){
  size(400,500);
   smooth();
 background(256,256,256);
 //frameRate(240);
}

void draw(){

 
 

noStroke();
fill(150,25);
rect(x,y,10,10);
x = x + random(-5,5);
y = y + random(-5,5);

fill(0,150,150,25);
rect(a,b,10,10);
a = a + random(-5,5);
b = b + random(-5,5);

fill(150,0,150,25);
rect(c,d,10,10);
c = c + random(-5,5);
d = d + random(-5,5);
fill(150,150,0,25);
if (mousePressed == true){
  ellipse(mouseX, mouseY,15,15);
}
  

}



