
void setup(){
  size(1920,1080);
  background(255);
  smooth();
}
int x= 0;
int i= 0;
int a=700;//x центр
int b=400;//y центр
void draw()
{
    if (i<=480)//no of times it runs
{ 
    pushMatrix();
    translate(a,b);
    fill(random(0,50),random(0,50),100,40);
    x-=50;
    rotate(radians(x)); //angle of rotation of each circle wrt each other
    stroke(3,200);
    //noFill();
    fill(200,200);
    ellipse(0,i,54,54);
    popMatrix();
     i=i+0.25; //increment
    a-=0.1; //translation point
    b+=0.1;
}
}    
                
