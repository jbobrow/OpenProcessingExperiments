
float counter = 0;
float mode;
float mode2;
float colour;

void setup()
{
  size(500,500);
  smooth();
  background(255);
  colorMode(HSB,360,100,100);
}

void draw()
{
  background(360,100,0);
float huepfen1 = map((sin(counter)*2)/(mouseX/40),-1,1,-10,100);
float huepfen2 = map((sin(counter)*2)/(mouseX/40),-1,1,100,-10);
float zittern = map(sin(6*counter)*10,-1,1,0.1,1);

float blau = map(sin(counter),-1,1,187,188);
float orange = map(sin(counter),-1,1,43,44);

if (mouseX<300)
{
  mode = huepfen1;
  mode2 = huepfen2;
  colour = orange;
  
} else {
  mode = zittern;
  mode2 = zittern;
  colour = blau;
  translate(0,50);
}


translate(0,height/2);
fill(colour,80,90);
ellipse(100,mode,100,100);
ellipse(400,mode,100,100);
ellipse(250,mode2,100,100);

counter += 0.1;
}
  
  
