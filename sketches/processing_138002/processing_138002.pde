
size (400,400);
int change = int(random(10,250));
int size= int(random(10,250));
int position= int(random(10,250));
PFont rockwell;
rockwell = createFont("rockwell",10,true);
 
 int i = 50;
  while ( i <= 275 ) {
  textFont(rockwell,30);  
  fill(size,position,change);                       
  text("Creative Computing",10, i); 
   
 i = i+ 25;
  }


