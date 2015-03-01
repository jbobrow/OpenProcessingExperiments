
void setup()
{
size(500,500);
background(255);

}
void draw()
{
  float a = random (255);
  float b= random (255);
float c= random (255);
fill(#2C4AE8);
rect(450,0,50,50);
fill(#E82C4F);
rect(450,50,50,50);
fill(#2CE84D);
rect(450,100,50,50);
fill(#02D3D8);
rect(450,150,50,50);
fill(#FCF508);
rect(450,200,50,50);
fill(#FF7205);
rect(450,250,50,50);
fill(#FF05EF);
rect(450,300,50,50);
fill(a,b,c);
rect(450,350,50,50);
if(mousePressed){
line(pmouseX,pmouseY,mouseX,mouseY);}
  
  if(mouseX>450 && mouseY<50)
  {
  if (mousePressed)
  {
    stroke(#2C4AE8);
  }
  }
  else if(mouseX>450 && mouseY>50 && mouseY<100) 
  {
    if(mousePressed)
  {
    stroke(#E82C4F);
  }
  }
   else if(mouseX>450 && mouseY>100 && mouseY<150) 
  {
    if(mousePressed)
  {
    stroke(#2CE84D);
  }
  }
   else if(mouseX>450 && mouseY>150 && mouseY<200) 
  {
    if(mousePressed)
  {
    stroke(#02D3D8);
  }
  }
   else if(mouseX>450 && mouseY>200 && mouseY<250) 
  {
    if(mousePressed)
  {
    stroke(#FCF508);
  }
  }
   else if(mouseX>450 && mouseY>250 && mouseY<300) 
  {
    if(mousePressed)
  {
    stroke(#FF7205);
  }
  }
    else if(mouseX>450 && mouseY>300 && mouseY<350) 
  {
    if(mousePressed)
  {
    stroke(#FF05EF);
  }
  }
   else if(mouseX>450 && mouseY>350 && mouseY<400)
  {
    if (mousePressed)
    stroke(a,b,c);
  }
  }
