
int coords[][]={{40,160},{80,160},{120,160},{160,160},{80,120},{120,120},{80,80},{120,80},{80,40},{120,40}};
int period[]  ={5,5,5,5,5,10,15,20,30,60};
int plus[]    ={4,3,2,1,0,0,0,0,0,0};


void setup()
{
  size(200,200);
  smooth();
}

void draw()
{
  background(180);
  for(int n=0;n<coords.length;n++)
  {    
    noStroke();
    fill(0,50,100,5);
    quad(0,(height-second()*3.3),200,(height-second()*3.3),200,200,0,200);
    
    if((second()+plus[n]) % period[n] ==0)
      fill(255,0,0);
    else
      fill(255);
    
    ellipse(coords[n][0],coords[n][1], 20,20);
    
    
  }
  
}


                
                                                
