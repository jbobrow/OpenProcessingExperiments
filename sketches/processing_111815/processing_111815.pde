




float x;
float y;
float angle;
float r = 500;
float diff = 1;


void setup(){
  size(600,600);
  background(255,220,220);
 
}

void draw(){
 
  x = r *cos(angle);
  y = r *sin(angle);
 
 noFill();

  
  translate(300,300);
  
  stroke(0.1,20); 
  
//  ellipse(0,0,x,y);
  rect(x/10,y/10,20,20);
  
  line(0,0,x,y);
  
  
  angle = angle+ 0.3;
  r = r-diff;
   
   if(r ==0 || r ==400){
     diff = diff*-1;
   }
}


