
void setup(){
size(400,400);
smooth();
}

void draw(){
background(255,10);

  for(int j=20;j<400;j+=20)
  {
    for(int i=20;i<400;i+=20)
    {
      fill(#F5C6FF,50);//,50);
      ellipse(i,j,40,40);
    }
  }
  
}
