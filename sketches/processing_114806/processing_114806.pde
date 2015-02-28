
void setup() {
  size(200,200);
  background(5);
 
}
 
void draw() {
   size(600,600);
rectMode(CENTER);
rect(100,100,20,100);
ellipse(100,70,60,60);
ellipse(81,70,16,32); 
ellipse(119,70,16,32); 
line(90,150,80,160);
line(110,150,120,160);
stroke(255);

    if(mousePressed == true){
       size(200,200);
rectMode(CENTER);
rect(100,100,20,100);
ellipse(100,70,60,60);
ellipse(81,70,16,32); 
ellipse(119,70,16,32); 
line(90,150,80,160);
line(110,150,120,160);
fill(38,234,0);
    
}else{
   
    fill(250,0,0);
  }
   
   
}



