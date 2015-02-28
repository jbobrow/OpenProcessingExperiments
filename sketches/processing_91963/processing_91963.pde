
//Jennifer Kang
//jmkang
//©jennifer kang

final int MAX = 3;
 
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

                        
void setup()
{
  size(400, 400); 
  background(103, 255, 246);
}
 
 
void draw()
{
  for(int i = 0; i < xList.length; i++)
  {
    noStroke();
    fill(col[i]);
   rect(xList[i], yList[i], sizeList[i], sizeList[i]);

   ellipse(xList[i], yList[i]+sizeList[i], sizeList[i]*2, sizeList[i]*2);
   ellipse(xList[i]*2, yList[i]*2, sizeList[i]/1.8, sizeList[i]/1.8);
  }
}





