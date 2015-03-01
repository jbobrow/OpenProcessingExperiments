
int raton=1;
void setup(){
  
size(1000,1000);

background(0);

}
void draw() {

raton=raton+1;
background(0);

stroke(random(250),random(250),random(250),100);
line(0,0,width,height);
line(width,height,0,0);

fill(random(250),random(250),random(250),150);
rect(mouseY,mouseY,width/4,height/4);

fill(random(250),random(250),random(250),150);
rect(mouseX,mouseX,width/2,height/2);

fill(145,0,191,100); 
ellipse(width/2,height/2,mouseX,mouseX);

fill(random(250),random(250),random(250),100);

ellipse(mouseY,mouseX,80,80);
ellipse(mouseX,mouseY,30,30);

ellipse(width-mouseX,mouseY,80,80);
ellipse(mouseX,height-mouseY,30,30);

println(mouseX);
}
