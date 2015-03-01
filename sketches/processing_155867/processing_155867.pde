
float r;
float s;
float a=5;
float b=5;
 
void setup(){
size(800,800);
frameRate(30);
}
 
 
void draw(){
  r=map(mouseX,0,width,0,255);
  s=map(mouseY,0,height,0,100);
  fill(255-frameCount,255-frameCount,255-frameCount);
rect(0,0,800,200);
fill(24,67,155);
rect(0,200,800,400);
fill(11,91,47);
triangle(500-r,200,520-r,130,550-r,200);
triangle(550-r,200,600-r,100,800-r,200);
    stroke(r);
    strokeWeight(s/5);
    
  if (mousePressed){
    fill(random(255),random(255),random(255));
    triangle(mouseX,mouseY-100,mouseX+50,mouseY,mouseX,mouseY+50);
    fill(0,0,0);
    quad(mouseX-75,mouseY+50,mouseX+75,mouseY+50,mouseX+50,mouseY+75,mouseX-50,mouseY+75);
  }else{
    fill(255-r,255-r,255-r);
    triangle(mouseX,mouseY-100,mouseX+50,mouseY,mouseX,mouseY+50);
    fill(255-r,255-r,255-r);
    quad(mouseX-75,mouseY+50,mouseX+75,mouseY+50,mouseX+50,mouseY+75,mouseX-50,mouseY+75);
  }
  
      if((mouseY<200 &&mouseX<550-r &&mouseX>500-r)||(mouseY<200 &&mouseX>550-r&&mouseX<800-r)){
      fill(255-a,0,0);
      ellipse(mouseX,mouseY,a,b);
      a=a+5;
      b=b+5;
    }else{
      a=5;
      b=5;}
      
  fill(229,189,74);
rect(0,600,800,200); 
println(r,s);
}


 
 
void keyPressed() {
  if (key == s) {
    saveFrame();
  }
}

