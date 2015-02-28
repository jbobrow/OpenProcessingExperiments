
size(250,250);
background(255);
smooth();

for(int y=0; y<=height; y+=5){
  for(int x=0; x<=width; x+=5){
    noFill();
    stroke(0, 200);
    line(x, y, 250*2, 250*2);
  }
}

//
for(int y=20; y<=250; y+=15){
  for(int x=0; x<=250; x+=15){
    noFill();
    stroke(255, 200);
    line(x, y, 250*2, 250*2);
  }
}

//
stroke(255, 150);
for(int x=0; x<250; x=x+2)
{
  line(random(x),0,random(500),250);
}

for(int x=0; x<250; x=x+2)
{
 
  line(random(x),0,random(250),250);
}

stroke(255, 60);
for(int x=50; x<250; x=x+2)
{
  line(random(x),0,random(100),250);
}

