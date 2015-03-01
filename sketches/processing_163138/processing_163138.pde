


float r= random(255);
float g= random(255);
float b= random(255);
float xp=random(200,500);
float yp=random(200,500);

void setup(){
size(1000,600);

background(0);

}
void draw(){
  //scale(-0.1);
for (int x = 1000; x<60; x=x+10) {
  fill(150,200,b); 
  ellipse(xp,yp,x,random(height));
}

stroke(r,g,b);
fill(r,50,b); 
for (int x=10; x<2000; x=x+4) {
   
  float myPerlin = noise(float(x)/5)/4;
  float myY = map(myPerlin,2,1,9,x);
  ellipse(x,30,x,myY);
 
}

}


