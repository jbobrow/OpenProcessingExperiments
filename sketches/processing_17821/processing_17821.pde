
size(250,250);
smooth();
background(0);

//Lines
for(
  int j=0; j<250; j+=8)
{
  strokeWeight(0.5);
  stroke(255,20);
  line(j,0,j,250);
}

//Dots
for(
  int k=0; k<250; k+=8)
    for(
    int l=4; l<250; l+=8)
  {
    stroke(255);
    point(l,k);
  }

//Circles
for(
int m=45; m<245; m+=50)
{
  fill(255,12);
  stroke(255,50);
  strokeWeight(0.5);
  ellipse(50,m,25,25);
  fill(255,24);
  stroke(255,62);
  ellipse(100,m+7,25,25);
  fill(255,36);
  stroke(255,74);
  ellipse(150,m+14,25,25);
  fill(255,48);
  stroke(255,86);
  ellipse(200,m+14,25,25);
}

//Waves
for(
int i=0; i<50; i+=1)
{
  noFill();
  strokeWeight(30);
  float h = 25;
  stroke(200,100,100,5);
  bezier(0,h,75,h-25,125,h+25,250,h);
  float h2 = 75;
  stroke(200,100,200,10);
  bezier(0,h2,75,h2-25,125,h2+25,250,h2);
  float h3 = 125;
  stroke(100,100,200,15);
  bezier(0,h3,75,h3-25,125,h3+25,250,h3);
  float h4 = 175;
  stroke(100,200,200,20);
  bezier(0,h4,75,h4-25,125,h4+25,250,h4);
  float h5 = 225;
  stroke(100,200,100,25);
  bezier(0,h5,75,h5-25,125,h5+25,250,h5);
  float h6 = 0;
  stroke(200,100,100,5);
  bezier(0,h6,75,h6-25,125,h6+25,250,h6);
  translate(0, i);
}


