
int MAX_ELEM=800;
int nbElem=20;
float cloudSize=150;
float[] coefs1= new float[MAX_ELEM];
float[] coefs2= new float[MAX_ELEM];
    float count=0;
void setup()
{
  size(640,480);
  smooth();
  frameRate(25);
  background(0);
  for(int i=0;i<MAX_ELEM;i++)
  {
    coefs1[i] = random(cloudSize);
    coefs2[i] = random(cloudSize);
  }
}
void draw()
{
  if(frameCount%12==0)
  {

    count=(count<101)?count+0.1:0;
    
    fill(0,count);
  rect(0,0,width,height);
  }
  if(mousePressed==true)
  {
 
  noStroke();
  fill(#ff0000,100);
  for(int i=0;i<nbElem;i++)
  ellipse(mouseX+coefs1[i]*cos(frameCount),mouseY+coefs2[i]*sin(frameCount),10,10);
  }
  //ellipse(mouseX+40*cos(frameCount),mouseY+50*sin(frameCount),10,10);
}


void mousePressed()
{
  for(int i=0;i<nbElem;i++)
  {
    coefs1[i] = random(cloudSize);
    coefs2[i] = random(cloudSize);
  }
}

void keyPressed()
{
  switch(key)
  {
    case 'r':
      cloudSize+=0.3;
       for(int i=0;i<nbElem;i++)
 {
    coefs1[i]+=0.3;
    coefs2[i]+=0.3;
  }
      break;
    case 'e':
      if(cloudSize>10)
      {
        cloudSize-=0.3;
             for(int i=0;i<nbElem;i++)
 {
    coefs1[i]-=0.3;
    coefs2[i]-=0.3;
  }
      }
      break;
        case 'd':
        if(nbElem>1)
      nbElem--;
      break;
      case 'f':
      if(nbElem<MAX_ELEM)
      nbElem++;
      break;
  }
}

