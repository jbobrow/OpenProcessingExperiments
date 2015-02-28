
//Code by Joyce Shin
float x;

void setup(){
  size(200,250);
  background(50);
  noStroke();
  frameRate(25);
 }

void draw(){
   x=x+5;
   if(x>width*2){x=-100;}
  
//rectangle 1 
   fill(50,50); 
   noStroke();
   rect(0,30,x,30);
   
//rectangle 2
   fill(50,50); 
   noStroke();
   rect(-50,70,x,30);
   
//rectangle 3 
   fill(50,50); 
   noStroke();
   rect(-90,110,x,30);

//rectangle 4 
   fill(50,50); 
   noStroke();
   rect(-130,150,x,30);

//rectangle 5 
   fill(50,50); 
   noStroke();
   rect(-170,190,x,30);

//rectangle 1 
   translate(x,0);
   fill(#315C66);
   rect(-10,30,100,30);

//rectangle 2
   fill(#4F5869);
   rect(-50,70,100,30);

//rectangle 3
   fill(#66596B);
   rect(-90,110,100,30);

//rectangle 4
   fill(#7D5F65);
   rect(-130,150,100,30);

//rectangle 5
   fill(#B2635C);
   rect(-170,190,100,30);
 }


  

