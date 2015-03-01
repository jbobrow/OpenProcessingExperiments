
float x = 0;
void setup(){
size(600,600);
}

 
void draw(){
fill(0,12);
rect(0,0,width,height);
colorMode (HSB);
fill(60,20,100);
x= dist(mouseX,mouseY,pmouseX,pmouseY); 
println(x); 
ellipse(mouseX,mouseY,x,x); 
}

