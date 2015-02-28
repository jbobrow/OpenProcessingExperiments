
PImage img;
color c;

int temp_size=0;
int total;


void setup()
{
  img=loadImage("problematic_sunset.jpg");
  img.loadPixels();
  size(img.width,img.height);
  colorMode(HSB,1,1,1);

  total=img.height*img.width;

  loadPixels();


  i=0;
  j=k=l=m=height/2;


  

  //cpyPix=blendme(cpyPix,cpyPix2);


}
color[] cpyPix;
color[] cpyPix2;
float threshold=.16;
float higherthreshold=1;
color r=color(255,0,0);
color g=color(0,255,0);
int i,j,k,l,m;


void draw()
{
  if(loadimage(i++*width)==false)
    ;
  else if(paintred(j++*width)==false)
    ;
  else if(expand(k++*width)==false)
    ;
  else if(greentored(l++*width)==false)
    ;
  else if(redtoblend(m++*width)==false)
    ;
  else
    ;


}

boolean paintred(int index)
{
  if(index<total)
  {
    int start=index;
    while(index<start+width)
    {
      c=pixels[index];
      if(brightness(c)<threshold)
      {
        pixels[index]=r;//index=fix(index);

      }
      index++;
    }
    updatePixels();
    return false;
  }
  return true;
}

boolean loadimage(int index)
{

  if(index<total)
  {
    int start=index;
    while(index<start+width)
    {
      pixels[index]=img.pixels[index];
      index++;
    }
    updatePixels();
    return false;
  }
  return true;


}

void displayPix(color[] pix)
{

  int i=0;
  while(i<total)
    pixels[i]=pix[i++];
  updatePixels();
}


color[] copyPix(color[] mypix)
{
  int i=0;
  int num=mypix.length;
  color[] copyP = new color[num];
  while(i<num)
  {
    copyP[i]=mypix[i];
    i++;
  }
  return copyP;
}

boolean expand(int i)
{
  if(i<total)
  {
    int start = i;

    while(i<start+width)
    {
      //if my guy is red
      if(pixels[i]==r)
      {
        //lookat neighbors
        for(int y2=-4;y2<5;y2++)
        {
          for(int x2=-4;x2<5;x2++)
          {
            int checkpix=i+(y2*width+x2);
            if(checkpix>=0&&checkpix<total)
            {
              if((pixels[checkpix]!=r)&&(brightness(pixels[checkpix])<higherthreshold))
                pixels[checkpix]=g;    
            }
          }
        }
      }
      i++;
    }
    updatePixels();
    return false;
  }
  return true;

}



boolean redtoblend(int index)
{
  int counter=0;
  int rememberindex;
  color blendC1, blendC2;
  blendC2=g;//pixels[0]; //just for initialization
  if(pixels[0]==r)
    index++;
  if(index<total)
  {
    int start = index;

    while(index<start+width)
    {
      if(pixels[index]==r)
      {
        rememberindex=index;
        blendC1=pixels[index-2];//blend(pixels[index-1],pixels[index-2],BLEND);
        while(pixels[index]==r||pixels[index+1]==r||pixels[index+2]==r||pixels[index+3]==r)
        {
          if(index<total-4)
          {
            counter++;
            index++;
          }
          else
            return true;
        }

        blendC2=pixels[index+1];//blend(pixels[index+1],pixels[index+2],BLEND);
        //check to make sure my C1 color is not from the previous row
        if((rememberindex-2)/width!=rememberindex/width)
          blendC1=blendC2;
        int number=index-rememberindex;
        float h1=hue(blendC1);
        float s1=saturation(blendC1);
        float b1=brightness(blendC1);
        float h2=hue(blendC2);
        float s2=saturation(blendC2);
        float b2=brightness(blendC2);
        float dh=h1-h2;
        float ds=s1-s2;
        float db=b1-b2;
        float myh,mys,myb;

        for(int i=0;i<=number+1;i++)
        {
           myh=h1-(dh*(i/(float)number));
           mys=s1-(ds*(i/(float)number));
           myb=b1-(db*(i/(float)number));


          pixels[rememberindex+i-1]=color(myh,mys,myb);

        }
        /* for debuging the start and end
         pixels[rememberindex]=r;
         pixels[index]=g;*/
        counter=0;

      }
      index++;
    }
    updatePixels();
    return false;
  }
  return true;
}

boolean greentored(int i)
{

  if(i<total)
  {
    int start = i;

    while(i<start+width)
    {
      c=pixels[i];
      if(c==g)
      {
        pixels[i]=r;//index=fix(index);

      }
      i++;
    }
    updatePixels();
    return false;
  }
  return true;
}

