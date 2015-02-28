

void setup(){
background(0);
size(250,250);
smooth();
}

void draw(){
 stroke(100,200,90);
 fill(50,120,70);
 rect(190,110,30,30);
 rect(35,110,30,30); 
 rect(110,190,30,30);
 rect(110,35,30,30);
 
 rect(10,120,10,10);
 rect(120,10,10,10);
 
 stroke(40,100,240);
 strokeWeight(3);
 fill(240,100,40);
  
  //inner circles
  ellipse(100,100,20,20);
  ellipse(150,150,20,20);
  ellipse (100,150,20,20);
  ellipse(150,100,20,20);
  
  //outer circles
  ellipse(50,50,40,40);
  ellipse(200,200,40,40);
  ellipse(50,200,40,40);
  ellipse(200,50,40,40);
    
}

