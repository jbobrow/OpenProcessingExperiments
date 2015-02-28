
int x=500;
  float r = random(200,300);

void setup()
{
 size(400,400);
background(255);
smooth();


  
  }
  
  void draw()
  {
    



  
fill(255,25);
noStroke();
rect(0,0,400,400);


for (int l=0; l<=1200; l = l+400){
for (int k=0; k<=1200; k = k+400){
pushMatrix();
scale(.25,.25);
translate(0+k,0+l);
    for (int j=0; j<=400; j=j+30){
    x=x-j;
    stroke(j/2,150,150);
   
    line(0,j,400,mouseY);
    fill(90);
    ellipse(0,j,5,5);
   
  }

popMatrix();
}
}


    
  }
