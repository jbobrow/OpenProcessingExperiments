
ArrayList AArray;
float aa = 0;
PFont font;

void setup()
{
  size(400,500);
  smooth();
  
  AArray = new ArrayList();
  AArray.add(new float[20]);
  
  font = loadFont("Hae.vlw");
  textFont(font,20);
  textAlign(CENTER);
  
  frameRate(10);
}

void draw()
{
  //background(30,30,30,30);
  fill(30,120);
  rect(0,0,width,height);
  stroke(234);
  strokeWeight(1);
  
  fill(234);
  text("vk.com/",width/2,330);
  text("processing_ru",width/2,350);
  
  noFill();
  
  aa=aa+0.03;
  
  float[] temp = new float[20];
  for (int i=0; i<20; i++)
  {
    temp[i] = noise(i,aa,random(100));
  }
  AArray.add(temp);
  
  println(AArray.size());
  
  
  for (int i=AArray.size()-1; i>0; i--)
  {
    beginShape();
    for (int j=0; j<20; j++)
    {
      float[] temp2 = (float[]) AArray.get(i);
      curveVertex(j*21,height-i*12+temp2[j]*80);
      temp2[j] = temp2[j]*0.92;
    }
    endShape();
  }
  
   if (AArray.size()>59)
   {
     //AArray.remove(0);
     AArray.clear();
   }
  
}

