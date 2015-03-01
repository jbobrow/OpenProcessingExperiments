
int h = 62;            // hue of fairy
int s = 40;            // saturation of fairy
int b = 78;            // brightness of fairy

float nPos = 0;
float size = 50;
int diam;
float inc = 0.005;

int butX = 220;        // rect constraint X
int butY = 300;        // rect constraint Y
int butW = 200;        // rect constraint W
int butH = 100;        // rect constraint H
color rectColor;        // color holder variable
color rectColor0 = #6E6E6E;    // when !lightOn
color rectColor1 = #FFF700;    // when lightOn

boolean lightOn = false;

void setup()
{
 size(600,600);
 ellipseMode(CENTER);
 colorMode(HSB,100);
 noStroke(); 
}

void draw()
{ 
  background(0,0,0);
  
  checkLight();
  button();
  createFairy();
}

void button()
{
 fill(rectColor);
 rect(butX,butY,butW,butH); 
}

void createFairy()
{
  float x = noise(nPos)*width;
  float y = noise(nPos+1)*height;
      for (diam = 60; diam > 0; diam = diam - 10) {
        noStroke();
        fill(h,s,b);
        ellipse(x,y,diam,diam);
        s = s - 10;
        nPos = nPos + inc;
      }
      s = 92;
}

void mousePressed()
{
  if (mouseX > butX && mouseX < butX + butW && mouseY > butY && mouseY < butY + butW)
  {
    lightOn =!lightOn;    
  }
}

void mouseReleased()
{
 fill(0,0,255); 
}

void checkLight()
{
 if(lightOn)
  {
    background(0,0,100);
    inc = 0;
    rectColor = rectColor1;
  } else {
    background(0,0,0);
    inc = 0.005;
    rectColor = rectColor0;
  } 
}


