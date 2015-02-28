
size(640,360);
background(0);    
smooth();


int triangleGap = 40;
int treeGap =30;
int circleTreeWidth =20;
int treeTrunkH =treeGap/2; 
int treeTrunkW =treeGap/5;

//red triangle
noStroke();
fill(255,0,0);
for (int i=width/4; i<width/4*3; i +=triangleGap)
{
  for(int j=0; j<height/2 ; j +=triangleGap)
  {
    triangle (i, j, i+triangleGap, j, i+triangleGap, j+triangleGap);
  }
}

//dark red triangle
fill(140,20,0);
for (int i=0; i<width; i +=triangleGap*2)
{
  for(int j=0; j<height/2; j +=triangleGap)
  {
    triangle (i, j, i,j+triangleGap, i+triangleGap, j+triangleGap);
  }
}

//green neon line
noFill();
stroke(0,250,100);
for (int i=triangleGap; i<width; i +=triangleGap*2)
{
  for(int j=0; j<height/2; j +=triangleGap)
  {
 // triangle (i,j,i, j+40,i+40, j+40);
    line(i+triangleGap/2,j,i, j+triangleGap/2);
    line(i+triangleGap,j,i, j+triangleGap);
    line(i+triangleGap,j+triangleGap/2,i+triangleGap/2, j+triangleGap);
  }
}



//green triangle
fill(10,100,100);
noStroke();
for (int i=0; i<width/2; i +=triangleGap/2)
{
  for(int j=0; j<height/2; j +=triangleGap)
  {
    triangle (i, j, i,j+triangleGap/2, i+triangleGap/2, j+triangleGap/2);
  }
}

//yello triangle
fill(253, 209, 0, 220);
for (int i=0;i<width/2; i +=triangleGap/2){
  for(int j=triangleGap/2; j<height/2; j +=triangleGap){
  triangle (i, j, i+triangleGap/2,j, i+triangleGap/2, j+triangleGap/2);
  }
}

//water
fill(0,100,255);
rect(0,height/2-triangleGap/2,width,62);
for (int i= 0; i<=width; i +=triangleGap)
{
   fill(0,100,255);
   ellipse(i, height/2-triangleGap/2, triangleGap, triangleGap/2);
}

for (int i= 0; i<=width; i +=triangleGap){
  for (int j= height/2; j<=200; j +=10){
   stroke(255);
   int waterEnd =(int)random(160,222);
   int waterStart =(int)random(i,i+30);
   line(waterStart,waterEnd,waterStart*2-300,waterEnd);
  }
}



 // tree
noStroke();
for (int i= 0; i<=width; i +=treeGap*2){
  // circle tree
  for (int j= 200; j<=width/2; j +=treeGap*2){
    fill(56, 244, 252);
    ellipse(i*2, j+circleTreeWidth, treeGap, treeGap);
    rect(i*2-3,j+treeGap,treeTrunkW,treeTrunkH);
  }
  
   // 3 circle tree
  for (int j= 200; j<=width/2; j +=treeGap*2){
    fill(120, 255, 170);
    ellipse(i*2+treeGap*2, j+circleTreeWidth, circleTreeWidth, circleTreeWidth);
    ellipse(i*2+treeGap*2-5, j+treeGap, circleTreeWidth,circleTreeWidth);
    ellipse(i*2+treeGap*2+5, j+treeGap, circleTreeWidth, circleTreeWidth);
    rect(i*2-treeGap*2-3,j+treeGap+5,treeTrunkW,treeTrunkH);
  }
  

  //triangle tree
  for (int j= 200; j<=width/2; j +=treeGap*2){
    fill(43, 140, 79);
    triangle(i+treeGap,j+treeGap, i+treeGap/2,j+treeGap*2, i+treeGap+treeGap/2, j+treeGap*2);
    rect(i+treeGap-3,j+treeGap*2,treeTrunkW,treeTrunkH);
  }
}

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

