
size(640,360);
background(0);    
smooth();

int treeTrunkH =15;
int treeTrunkW =6;

/////////////////////////////////////////SKYLINE

//red triangle
noStroke();
fill(255,0,0);
for (int i=160; i<480; i +=40){
  for(int j=0; j<180; j +=40){
  triangle (i, j, i+40, j, i+40, j+40);
  }
}

//dark red triangle
fill(140,20,0);
for (int i=0; i<640; i +=80){
  for(int j=0; j<180; j +=40){
  triangle (i, j, i,j+40, i+40, j+40);
  }
}

//green neon line
noFill();
stroke(0,250,100);
for (int i=40; i<640; i +=80){
  for(int j=0; j<180; j +=40){
  line(i+20,j,i, j+20);
  line(i+40,j,i, j+40);
  line(i+40,j+20,i+20, j+40);
  }
}

//green triangle
fill(10,100,100);
noStroke();
for (int i=0; i<320; i +=20){
  for(int j=0; j<180; j +=40){
  triangle (i, j, i,j+20, i+20, j+20);
  }
}

//yello triangle
fill(253, 209, 0, 220);
for (int i=0;i<320; i +=20){
  for(int j=20; j<220; j +=40){
  triangle (i, j, i+20,j, i+20, j+20);
  }
}

/////////////////////////////////////////WATER
fill(0,100,255);
rect(0,160,640,62);
for (int i= 0; i<=640; i +=40)
{
   fill(0,100,255);
    ellipse(i,160, 40, 20);
}

for (int i= 0; i<=640; i +=40)
{
  for (int j= 180; j<=200; j +=10)
  {
   stroke(255);
   int waterEnd =(int)random(160,222);
   int waterStart =(int)random(i,i+30);
   line(waterStart,waterEnd,waterStart*2-300,waterEnd);
  }
}


/////////////////////////////////////////tree
noStroke();
for (int i= 0; i<=640; i +=60)
{
  // circle tree
  for (int j= 200; j<=360; j +=60)
  {
    fill(56, 244, 252);
    ellipse(i*2, j+20, 30, 30);
    rect(i*2-3,j+30,treeTrunkW,treeTrunkH);
  }
  
   // 3 circle tree
  for (int j= 200; j<=360; j +=60)
  {
    fill(120, 255, 170);
    ellipse(i*2+60, j+20, 20, 20);
    ellipse(i*2+55, j+30, 20, 20);
    ellipse(i*2+65, j+30, 20, 20);
    rect(i*2-63,j+35,treeTrunkW,treeTrunkH);
  }
  

  //triangle tree
  for (int j= 200; j<=360; j +=60){
    fill(43, 140, 79);
    triangle(i+30,j+30, i+15,j+60,i+45,j+60);
    rect(i+27,j+60,treeTrunkW,treeTrunkH);
  }
}


//light
/*
fill(255,255,0,140);
triangle(320,-30,260,310,380,310);
strokeWeight(0.8);
stroke(255,255,255);

for(int i=260; i<=380; i+=10)
{
  line(320,-30,i,310);
}
*/

/////////////////////////////////////////ME
//face
noStroke();
fill(255,0,0);
ellipse(320,212,62,62);
ellipse(320,253,36,32);
rect(302,254,36,22);
ellipse(320,273,36,32);
ellipse(298,193,24,24);
ellipse(345,193,24,24);
rect(305,282,12,15);
ellipse(311,297,12,12);
rect(323,282,12,15);
ellipse(329,297,12,12);

//eye
fill(255,255,255);
ellipse(310,215,6,6);
ellipse(332,215,6,6);
//lip
stroke(255,255,255);
line(315,229,325,229);

