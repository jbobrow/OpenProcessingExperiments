
size(500,650);
background(255,255,255);
smooth();
noStroke();

for(int i=1; i<1000; i=i+1)

{
 
  if(i<500)
  {
    fill(0,random(50),random(100), random(90));
 rect(100,150,random(100),random(100),random(30),random(300));
  }
  else if (i>700)
  {
    fill(50,random(20),random(100),random(50));
    rect(80,200,random(200),random(200),random(40),random(400));
  }
  else
  {
    
     fill(random(50),random(50),random(100),random(30));
    rect(100, 300,random(300),random(300),random(50),random(500));
  }
}


