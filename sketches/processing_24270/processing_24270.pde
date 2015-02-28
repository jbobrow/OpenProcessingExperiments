
int _max = 1500;
float i=1;
float r;
int _clr_Max = 255;

float _jump = 0.3;

int x=1;
void setup()
{
  size(600,600);
  background(255);
}

void draw()
{


  if(i<= 140)
  {
    float m = map(i, 0,100, 0, 255 );
   fill(0,255-m,m); 
   
    smooth();
    
    translate(width/2, height/2);
    x=x+50;
    
    rotate(radians(x));
    
    //stroke(m,255-m/3,0,90);
    
    if(i < 30)
    {
       //fill(255,170-m/50,0);
      fill(0,155-m,m); 
      r= pow(i,0.5)/7;
    }
    else
    {
     // fill(178,40-m/10,34);
       fill(235,255,m,60); 
       r= pow(i,1.3)/7;
    }
    
    //r=theta ^(1/2)
   

    //strokeWeight(m);
   // rect(255,r*(i/10),55/i/2,55/i/2);
    
    //filling the ellipsei
    
   
     println(r);
    //stroke(255);
    stroke(0,199,55);
     strokeWeight(0.2);
    
    // fill(0,155-m,255-m); 
    //ellipse(0,r*i/50,1020/i,1020/i);
    
    
    
    //ellipse(0,r*i/50,1000/i,1000/i);
    
    rect(0,r*i/90,1200/i,1200/i);
    
    
    rect(200,r*i/90+100,1200/i,1200/i);
    
    
    rect(400,r*i/90-100,1200/i,1200/i);
    
   
    
    
   
  

    i=i+ _jump;
    
    //i=i+(i/4)+(0.0001);
    noStroke(); 

  }
}
                                
