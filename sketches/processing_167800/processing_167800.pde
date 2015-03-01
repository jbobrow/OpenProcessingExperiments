
int a=#E32020;
int b=#FC17D3;
int c=#5317FC;
int d=#3610A0;
int e=#5EB2E8;
float f,g,h;

void setup()
{
  size(400,400);
  background(255);
  smooth();

}
void draw()
{
  f=random(40,210);
  g=random(10,245);
  h=random(0,255);
  
  fill(a);
  rect(350,0,height/6,width/6);
  fill (b);
  rect(350,65,height/6,width/6);
  fill(c);
  rect(350,130,height/6,width/6);
  fill(d);
  rect(350,195,height/6,width/6);
  fill(e);
  rect(350,260,height/6,width/6);
  fill(f,g,h);
  rect(350,325,height/6,width/6);
  if(mousePressed){
     line(pmouseX,pmouseY,mouseX,mouseY);
     
     }
    if((pmouseX>=350) &&(mouseX<400)&&(mouseY>=0)&&(mouseY<65))
    {
      stroke(a);
    }
if(mousePressed){
  line(pmouseX,pmouseY,mouseX,mouseY);
} 
if((pmouseX>=350)&&(mouseX<400)&&(mouseY>=65)&&(mouseY<130))
{
  stroke(b);

}
if((pmouseX>=350)&&(mouseX<400)&&(mouseY>130)&&(mouseY<195))
{
  stroke(c);
}
if((pmouseX>=350)&&(mouseX<400)&&(mouseY>195)&&(mouseY<260))
{
  stroke(d);
}
if((mouseX>=350)&&(mouseX<400)&&(mouseY>260)&&(mouseY<325))
{
  stroke(e);
}
if((mouseX>=350)&&(mouseY<400)&&(mouseY>325)&&(mouseY<390))
{
  stroke(f,g,h);
  
  
}
if(keyPressed){
  if(key==' ')
  {
    background(#FFFFFF);
  }
}
}

