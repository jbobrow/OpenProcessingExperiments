
size (250,250);
background (180,20); //grey

//dots background
for (int y=0; y<=250; y+=8){
  for (int x=0; x<=250; x+=8){
    smooth();
    stroke(250);
    strokeWeight (2.5);
    point(x,y);
    
smooth();
noStroke(); 
for(int t=0;t<=250;t+=50){
 
//topline triangles 
fill(121,202,255,15);
triangle(t,100,t+25,0,t+50,100);

fill (35,164,247,5);
triangle(t,175,t+25,100,t+50,175);

fill(70,55,216,10);
triangle(t,225,t+25,175,t+50,225);

//bottomline triangles
fill (43,36,106,10);
triangle(t,250,t+25,225,t+50,250);
    } 
  }
}

