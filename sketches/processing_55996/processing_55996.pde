
size (250,250);// defines the size of the box 
background (255);// defines the colour of the background
stroke(0);//defines the colour of the line(s)
smooth();//smoothes 
for(int a=5; a<120;a+=20)
{  
  line(125,a,135+a,125);
  line(125,a,115-a,125);
  line(125,250-a,135+a,125);
  line(125,250-a,115-a,125);

}


