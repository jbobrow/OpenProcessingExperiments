
float xcount; //counts as program draws along x axis
float ycount; //coutns along y axis, when it reaches, resets program
float xlimit; //when xcount hit xlimit, it adds y
float ylimit; //when ycount hits ylimit, it resets state
float state; //toggles program on and off
float diam;

float r;
float g;
float b;

void setup()
  {
    strokeWeight(0);
    size (400, 400);
    background (255);
    xcount = 0;
    ycount = 0;
    diam = 20;
    xlimit = 400/diam;
    ylimit = 400/diam;
    state = 1; //switching program on and ;off
  }
  
void draw()
{
 r = mouseX/2; 
 g = mouseY/2;
 b = (mouseX+mouseY)/2;
 fill(r,g,b);
 ellipseMode(CORNER);

if (state==0)
{ 
  if (xcount < xlimit);
   {
    ellipse(xcount*diam,ycount*diam,diam,diam);
    xcount++;
   } 

 if(xcount ==xlimit)
   {
   ycount++;
   xcount = 0;
   }

 if(ycount>ylimit)
   {
   state = 1;
   xcount = 0;
   ycount = 0;
   }
}

if (state == 1)
  {
    fill(255);
    rect(0,0,400,400);
   }
}

void mouseClicked()
{
  if (state == 1)
     {
       state  =0;
     }
}


