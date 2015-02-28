
//brad miller processing
// ex1_5

int x =10;

void setup(){
  size(200,200);
  background(10,150,0);
  

  
}
  
 
void draw(){
    background(255);

 for (int c= 0; c<=width; c+=30) {
    stroke(0);
    line(0,c,width,c);
  }

  for (int d= 0; d<=height; d+=30) {
    stroke(0);
    line(d,0,d,height);
  }  
  

    
//legs
line(75,160,90,145);
line(130,160,110,145);

//body
fill(200,255,0);
rectMode(CENTER);
rect(100,120,20,50);


//head
fill(255); 
stroke(0);

ellipse(mouseX,mouseY,60,60);


//eyes
fill(0);
ellipse(115,70,20,30);
fill(0);
ellipse(85,70,20,30);

println(frameRate);

}




