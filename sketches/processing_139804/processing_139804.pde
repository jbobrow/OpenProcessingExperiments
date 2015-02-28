
float theta, delta; 
Orb orb1;
int j=50;
void setup(){
  orb1=new Orb(width/2, height);

background(0);
  size(900,800);
smooth();
}


void draw(){
  fill(#CE3400,5);
rect(0,0,width,height);
strokeWeight(random(2));
noStroke();
  noFill();
fill(#0BACBC);
beginShape();
vertex(100,height);
vertex(width/2,300);
vertex(800,800);
vertex(width,height);
vertex(width,0);
vertex(800,0);
vertex(width/2,300);
vertex(100,0);
vertex(0,0);
vertex(0,height);


endShape();

 
   translate(0,200);
  orb1.display();
  
   translate(width, 0);
  orb1.display();
  
  translate(0, 400);
  orb1.display();
  
  translate(-900, 0);
  orb1.display();
 
}
  
class Orb{
  float x,y;
  Orb(float _x, float _y){
 float x=_x;
 float y=_y;
  }
  
void display(){
  

noStroke();
    fill(10,2);   
  ellipse(x, y, 800,800);
 fill(0,10);   
  ellipse(x, y, 600,600);
  
  float a= random(0,1000);
  theta=radians(a);
  float b=random(90);
  delta=radians(b);


     
  pushMatrix();
  translate(x, y);
    line(0,0,0, 100);
  translate(0,100);
  float p = map(mouseY, 0, height, 255,0);  
  println(p);
    strokeWeight(random(3));
  stroke(#0BACBC,p);
  branch(80);
  branch(150);
  branch(100);
  branch(250);
    branch(800);

  strokeWeight(random(1));
  branch(500);

  branch(300);
  popMatrix(); 
  

  


}

void branch(float h){
  h*=random(.6);
             float value = mouseY;
float m = map(value, 0, height, 0, theta-.8);
float value2=mouseX;
float n=map(value2, 50, width/1.4, 0, theta);
  if (h>2){
    
      pushMatrix();
    rotate(n-m);
    line(0,0,0,-h);
    translate(0,-h);
    branch(h);
    popMatrix();
 
    pushMatrix();
    rotate(n+m);
    line(0,0,0,h);
    translate(0,h);
    branch(h);
    popMatrix();
 
  }}


}

