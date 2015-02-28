
float dim=100;

void setup(){
size(400,400);
}

void draw(){
background(220);
translate(width/2,height/2);

fill(0,0,0,5);
ellipse(0,0,dim,dim);

  for(int i=0;i<12;i++)
  {
    ellipse(0,+dim,dim,dim);
    rotate(PI/6);
    if(i%2==0)
    {
      ellipse(0,dim-(50.66),dim,dim);
    }
  }

}

