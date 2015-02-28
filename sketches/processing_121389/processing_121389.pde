
void setup() {
  size(1280, 360);
  fgHeight = (height/4)*3;
  f = createFont("Arial",16,true); // STEP 3 Create Font
  
}

int timeCounter;
int additiveCounter = 0;

float[] bgc1 = {89.0f, 63.0f, 142.0f};
float[] bgc2 = {251.0f, 214.0f, 131.0f};
float[] bgc3 = {157.0f, 233.0f, 254.0f};
float[] bgc4 = {252.0f, 171.0f, 91.0f};

float[] fgc1 = {165, 147, 203};
float[] fgc2 = {140, 159, 202};
float[] fgc3 = {190, 254, 136};
float[] fgc4 = {252, 96, 116};

color sun = color(251, 239, 50);
color moon = color(255,255,255);

color bgc;
color fgc;

color circleColor;

float fgHeight;

boolean disturbed;

float moonHeight;

PFont f;

void draw() {
  


  strokeWeight(0);
  
  if(timeCounter >= 0 && timeCounter < 21600)
  {
    bgc = color((bgc1[0] + ((bgc2[0] - bgc1[0]) * (timeCounter/21600))), (bgc1[1] + ((bgc2[1] - bgc1[1]) * (timeCounter/21600))), (bgc1[2] + ((bgc2[2] - bgc1[2]) * (timeCounter/21600))));
    fgc = color((fgc1[0] + ((fgc2[0] - fgc1[0]) * (timeCounter/21600))), (fgc1[1] + ((fgc2[1] - fgc1[1]) * (timeCounter/21600))), (fgc1[2] + ((fgc2[2] - fgc1[2]) * (timeCounter/21600))));
    circleColor = moon;
    moonHeight = (-(height/4))+((timeCounter/21600)*(height/0.75f));
  }
  if(timeCounter >= 21600 && timeCounter < 43200)
  {
    bgc = color((bgc2[0] + ((bgc3[0] - bgc2[0]) * ((timeCounter-21600)/21600))), (bgc2[1] + ((bgc3[1] - bgc2[1]) * ((timeCounter-21600)/21600))), (bgc2[2] + ((bgc3[2] - bgc2[2]) * ((timeCounter-21600)/21600))));
    fgc = color((fgc2[0] + ((fgc3[0] - fgc2[0]) * ((timeCounter-21600)/21600))), (fgc2[1] + ((fgc3[1] - fgc2[1]) * ((timeCounter-21600)/21600))), (fgc2[2] + ((fgc3[2] - fgc2[2]) * ((timeCounter-21600)/21600))));
    circleColor = sun;
    moonHeight = height-(((timeCounter-21600)/21600)*(height/0.75f));
  }
  if(timeCounter >= 43200 && timeCounter < 64800)
  {
    bgc = color((bgc3[0] + ((bgc4[0] - bgc3[0]) * ((timeCounter-43200)/21600))), (bgc3[1] + ((bgc4[1] - bgc3[1]) * ((timeCounter-43200)/21600))), (bgc3[2] + ((bgc4[2] - bgc3[2]) * ((timeCounter-43200)/21600))));
    fgc = color((fgc3[0] + ((fgc4[0] - fgc3[0]) * ((timeCounter-43200)/21600))), (fgc3[1] + ((fgc4[1] - fgc3[1]) * ((timeCounter-43200)/21600))), (fgc3[2] + ((fgc4[2] - fgc3[2]) * ((timeCounter-43200)/21600))));
    circleColor = sun;
    moonHeight = (-(height/4))+(((timeCounter-43200)/21600)*(height/0.75f));
  }
  if(timeCounter >= 64800 && timeCounter <= 86400)
  {
    bgc = color((bgc4[0] + ((bgc1[0] - bgc4[0]) * ((timeCounter-64800)/21600))), (bgc4[1] + ((bgc1[1] - bgc4[1]) * ((timeCounter-64800)/21600))), (bgc4[2] + ((bgc1[2] - bgc4[2]) * ((timeCounter-64800)/21600))));
    fgc = color((fgc4[0] + ((fgc1[0] - fgc4[0]) * ((timeCounter-64800)/21600))), (fgc4[1] + ((fgc1[1] - fgc4[1]) * ((timeCounter-64800)/21600))), (fgc4[2] + ((fgc1[2] - fgc4[2]) * ((timeCounter-64800)/21600))));
    circleColor = moon;
    moonHeight = height-(((timeCounter-64800)/21600)*(height/0.75f));
  }
  
  if(mousePressed)
  {
    if (mouseButton == LEFT) {
      additiveCounter += 300;
    }
    else
    {
      additiveCounter = 0;
      disturbed = false;
    }
  }
  if(!disturbed)
  {
    timeCounter = (second() + (minute() * 60) + (hour() * 3600) + additiveCounter);
  }
  if(disturbed)
  {
    timeCounter = additiveCounter;
  }
  if(timeCounter > 86400 && additiveCounter > 0)
  {
    disturbed = true;
    timeCounter = 0;
    additiveCounter = 0;
  }
  
  
  background(bgc);
  fill(circleColor);
  stroke(circleColor);
  ellipse((width/2),moonHeight,(height/4),(height/4));
  fill(fgc);
  stroke(fgc);
  rect(0,fgHeight, width, height/4);
  
  textFont(f,16);
  fill(0);
//  text(timeCounter,50,50);
  
  
}
