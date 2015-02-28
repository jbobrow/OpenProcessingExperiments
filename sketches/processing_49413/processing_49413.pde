
//Trevor Wilson
//1/17/2012

background(255);

size(500,500);
smooth();
noFill();

for(int i=0;i<width;i=i+10)
{ stroke(255-i/2); 
  ellipse(width/2,height/2,i,i);
}

