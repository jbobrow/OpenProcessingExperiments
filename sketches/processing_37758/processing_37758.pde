
size(300,300);
background(255);
smooth();

for(int x=10; x<=width; x+=20){
  for(int y=10;y<=width; y+=20){
    
    //red lines.
    stroke(150,0,0);
    line(200,0,147,300);
    line(190,0,137,300);
    
    
    //med. squares.
    pushMatrix();
    rotate(radians(10)); //rotates the grid.
    translate(107,27); //moves the starting point of the grid.
    noStroke();
    fill(0,random(100),random(100));
    rect(x,y,10,10);
    popMatrix();
    
    //smallest squares.
    pushMatrix();
    rotate(radians(10));
    translate(0,0); //grid starts at zero.
    fill(random(255));
    rect(x,y,5,5);
    popMatrix();
  }
}
    
    

