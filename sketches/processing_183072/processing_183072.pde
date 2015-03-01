
float dim=100;
int r=0;
int g=0;
int b=0;

void setup(){
size(400,400);
background(255);
frameRate(4);
}
 
void draw(){
background(255);
translate(width/2,height/2);
 
fill(r,0,b,30);
noStroke();
ellipse(0,0,dim,dim);
 
  for(int i=0;i<12;i++)
  {
    ellipse(0,+dim,dim,dim);
    rotate(PI/6);
    if(i%2==0)
    {
      noStroke();
      fill(r,0,b,30);
      ellipse(0,dim-(50.66),dim,dim);
      
    }
    r=int(random(0, 255));
    b=int(random(0, 255));
    
  }
 
}



