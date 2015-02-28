
void setup()
{
  size (600,700);
}

float Vivian = 0;
float stress = 0;
float Vivianspeed=1;
float stressspeed=1;
int yay = 0;
int nay = 0;

void draw()
{
  float paddle = 80;
  if(Vivian < 0 ||  Vivian > width) Vivianspeed = -Vivianspeed;
  if(stress> height) {
  stressspeed = -stressspeed;
  float distance = abs(mouseX-Vivian);
  if(distance < paddle) Vivianspeed= -Vivianspeed;
 else stress= 0;
  }
  else stressspeed +=1;
  
  Vivian += Vivianspeed;
  stress += stressspeed;
 background(#006266);
 ellipse(Vivian, stress, 50, 50);
 noStroke();
 fill(#D62F2A);
rect(mouseX-paddle, height-10, 2*paddle,10); 
 fill(#E6A73F);
}
