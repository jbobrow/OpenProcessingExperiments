

PImage z =loadImage ("bugs.jpg");
PImage Y =loadImage ("tom.jpg");
PImage X =loadImage ("duck.gif");
PImage W =loadImage ("bush.jpg");
PImage V =loadImage ("explode.jpg");


float a = 100;
float b = 230;
float c =360;
float d = 490;

    float m = 1100;



void setup() 
{
  size(900, 400);
}

void draw() 
{
  
  background(0);
  a = a + 1; 
  fill(75,0,0);
  if (a>230){
    a=230;  
  }
  image(z,a,150,70,70);
  
  if(a==230)
  {b=b+1;
  fill(0,76,0);
  image (Y,b,150,70,70);}
  if(b>360){
    b=360;}
    
   
   
    if(b==360)
  {c=c+1;
  fill(0,0,75);
  image (X,c,150,70,70);}
  if(c>490){
    c=490;}
    
     if(c==490)
  {d=d+1;
  fill(123,39,94);
  
  image (W,d,150,70,70);}
  if(d>610){
    d=610;}
    
    
    
         
  if(d==610){
    
    {m=m-2;
    fill (150,0,0,90);
    
  ellipse (m,200,150,200);}
  }
  
  if(m<=800){
    m=mouseX;
    

}
    
    
    if(mousePressed){
     
      background(255,0,0,50);

    image(V,mouseX-10,150,150,150);
    image(W,mouseX,150,120,120);

  

}
    
    

    
  

}
  
  
  
  
  
  
  
  
  
  



