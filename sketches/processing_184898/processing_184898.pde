
void setup(){
size(500,500);

background(100,132,35);
}


float d=3.1415;
 void draw(){
 
 
    float r=random(420);
    float s=random(500);
    float t=random(10);
    float x=random(500);
    float z=random(255);
    float p=random(360);
        float q=random(360);
 
     translate(250,250);
    fill(z,x%d,t,z);
    rotate(radians(mouseX));
    stroke(mouseX,mouseX,mouseY%255);
    strokeWeight(mouseX/50);
   
line(pmouseX-50,pmouseY+mouseX-50,abs(mouseX-width),pmouseY+50);

 
  }


