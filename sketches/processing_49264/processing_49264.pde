
float angle1, angle2, angle3, angle4;

float phaser;
void setup()
{
  size(500, 500);
}


void draw()
{
  background(0);
  for(float x = 0; x < width+1; x+= 0.5)
  {
    float gain = 10; // ModSin
    float freq1 = height*2;
    angle1 += TWO_PI/freq1;
    if(angle1 > TWO_PI) angle1 = 0;
    float modulation = (sin(angle1) * (gain/2)) + (gain/2);
    
    float freq2 = height/(modulation+1); //Modulated Sin
    angle2 += TWO_PI/freq2;
    if(angle2 > TWO_PI) angle2 = 0;    
    float y = (sin(angle2) * (height/10)) + (height/10)+ height/5;
    
    stroke(255);
    strokeWeight(1);
    point(x, y);
  }
  
  for(float x = 0; x < width+1; x+= 0.25)
  {
    float gain = 50; // ModPhaser
    float freq1 = height* 100;
    phaser += 1/freq1;
    if(phaser > 1) phaser = 0;
    float modulation = (phaser * (gain/2)) + (gain/2);
    
    float freq3 = height*(1); //Modulated Sin
    angle3 += TWO_PI/freq3;
    if(angle3 > TWO_PI) angle3 = 0;    
    float y = (sin(angle3) * (height/(modulation))) + (height/(modulation))+ height/2;
    
    stroke(255);
    strokeWeight(1);
    point(x, y);
  }
  
  for(float x = 0; x < width+1; x+= 0.25)
  {
    
    float freq4 = height/1; //Modulated Sin
    angle4 += TWO_PI/freq4;
    if(angle4 > TWO_PI) angle4 = 0;    
    float modulation = (sin(angle4) * (50)) + (height/(50));
    
    
    
    
    float gain = 100; // ModPhaser
    float freq1 = height* modulation;
    phaser += 1/freq1;
    if(phaser > 1) phaser = 0;
    float y = (phaser * (gain/2)) + (gain/2) + (width/5)*3;
    
    
    stroke(255);
    strokeWeight(1);
    point(x, y);
  }
  
  
  
}
      

