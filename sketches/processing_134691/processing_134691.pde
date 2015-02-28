

float[]x = {0,0,0,0,0,0};
float[]s = {1,1,1,1,1,1};

void setup(){
  size(400, 600);
}


void draw(){
  background(170, 7, 140);
  
  for(int i=0; i<x.length; i++)
  {
    if (x[i]>500)
      {
      x[i]=0;
      s[i]=random(1, 10);
      }

    ellipse(x[i], (80*i)+80, 50, 50);

    x[i]=x[i]+s[i];
  } 

}

