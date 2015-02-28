
float r;
float g;
float b;
void setup() {
  size(300,300);
  background(0);
}


//head
void draw(){
  if (mousePressed == true) {  
    strokeWeight(2);  
    r = random(0,255);
    g = random(0,255);
    b =random(0,255);
    fill(r,g,b);  
    
 
  ellipse(mouseX+150,mouseY+150,90,120+mouseY);}

//brows
fill(0);
ellipse (mouseX+130,mouseY+130,30,5);
ellipse (mouseX+170,mouseY+130,30,5);

//eyes
fill(0,0,255);
ellipse(mouseX+130,mouseY+140,8,8);
ellipse(mouseX+170,mouseY+140,8,8);

//nose
fill(0);
ellipse(mouseX+145,mouseY+160,2,2);
ellipse(mouseX+155,mouseY+160,2,2);

//mouse
fill(237,30,75);
rect(mouseX+130,mouseY+170,40,20);

//thooth
fill(255);
rect(mouseX+150,mouseY+170,7,8);
rect(mouseX+143,mouseY+170,7,8);

//hair
fill(160,160,0);
triangle(70,150,180,80,90,160);
triangle(60,140,170,70,80,150);


}


  

