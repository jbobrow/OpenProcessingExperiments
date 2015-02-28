
//Jennifer Kang
//jmkang
//©jennifer kang


 
float [ ] xList = {random(30, 250), random(30, 250), random(30, 250), random(30, 250),
                  random(30, 250), random(30, 250), random(30, 250), random(30, 250), 
                  random(30, 250), random(30, 250) };
float [ ] yList = {random(30, 250), random(30, 250), random(30, 250), random(30, 250),
                  random(30, 250), random(30, 250), random(30, 250), random(30, 250), 
                  random(30, 250), random(30, 250) };
float [ ] sizeList = {random(15, 30), random(15, 30), random(15, 30), random(15, 30),
                    random(15, 30), random(15, 30), random(15, 30), random(15, 30),
                    random(15, 30), random(15, 30) };
color [ ] col= {color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)) };
                   
 float [ ] deltaX = {random(2, 10), random(2,10),
 random(2, 10), random(2,10),
 random(2, 10), random(2,10),
 random(2, 10), random(2,10),
 random(2, 10), random(2,10)};
                     
float [ ] deltaY = {random(2, 10), random(2,10),
 random(2, 10), random(2,10),
 random(2, 10), random(2,10),
 random(2, 10), random(2,10),
 random(2, 10), random(2,10)};

                        
void setup()
{
  size(400, 400); 

 
}
 
 
void draw()
{
  background(103, 255, 246);
  moveDrop ( );
  for(int i = 0; i < xList.length; i++)
  {
    noStroke();
    fill(col[i]);
   rect(xList[i], yList[i], sizeList[i], sizeList[i]);

   ellipse(xList[i], yList[i]+sizeList[i], sizeList[i]*2, sizeList[i]*2);
   ellipse(xList[i]*2, yList[i]*2, sizeList[i]/1.8, sizeList[i]/1.8);
  }
}


void moveDrop ( )
{
  for (int a=0; a<xList. length; a++)
 {
 xList[a]=xList[a]+deltaX[a];
 yList[a]=yList[a]+deltaY[a];
  
 if(xList[a] > width || yList[a] > height || xList[a] < 0 || yList[a] < 0)
    {
      deltaX[a] = -deltaX[a];
      deltaY[a] = -deltaY[a];
    }
 
 }
 
  
}



