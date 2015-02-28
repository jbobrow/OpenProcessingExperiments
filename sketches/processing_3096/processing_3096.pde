

 void setup() {
background (50);
size(500,500);

 }
void draw(){
  fill(50,50,300);
  stroke(255);
 
float x= random (width);   
float y= random(height); 
float z= random(30,70);

ellipse(x,y,z,z);
line(x,y,mouseX,mouseY);
stroke(300,0,0);

}
void mousePressed (){
  background(0);
}



