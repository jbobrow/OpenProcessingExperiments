
int counter;
int sizes = new int[250];
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  for(int i = 0; i < 250; i++)
  {
      sizes[i] = random(250);
  }
}

void draw() {  //draw function loops 
  counter++;
  background(255);
  for(int i2 = 0; i2 < 250; i2++)
  {
      stroke((sizes[i2] / 255) * 200, 255 - i2, 255 - i2);
      drawBar(sizes[i2], i2);
  }
  gnomesort();
    
}

void drawBar(s, p)
{
    line(p, 250, p, s);
}

void gnomesort()
{
    int i3 = 0;
    while(i3 < sizes.length)
    {
        if(i3 == 0 | sizes[i3] >= sizes[i3 - 1])
        {
           i3++;
        }
        else
        {
            int temp = sizes[i3];
            sizes[i3] = sizes[i3 - 1];
            sizes[i3 - 1] = temp;
            //i3--;
        }
    }
}
