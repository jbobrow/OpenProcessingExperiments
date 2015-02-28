
//ROWAN CASSIUS, CP1, B7
/* @pjs globalKeyEvents="true"; */
int ranX = 10;
int ranY = 10;
int ranZ = 10;
int sph = 10; 
int num = 1;
int count = 1;
void setup()
{
  //background(0);
  size(600,600,P3D);
  //frameRate(.1);
}
void draw()
{  
  
  lights();
  
  while(num <= count)
  {
  noStroke();
  ranX = int(random(10,591));
  ranY = int(random(10,591));
  //ranZ = int(random(10,-500));
  translate(ranX,ranY,ranZ);
  fill(int(random(0,226)),int(random(0,226)),int(random(0,226)),100);
  sph = int(random(7,int(random(20,90))));
  box(sph);
  translate(-ranX,-ranY,-ranZ);
  num++;
  }
  strokeWeight(5);
  stroke(0);
  textSize(60);
  text(count,50,50);
  
}
void mouseClicked()
{
    
    num = 1;
    background(int(random(0,226)),int(random(0,226)),int(random(0,226)));
    count = count*2;
    if(count>1200)
  {
    count=1;
  }
}
