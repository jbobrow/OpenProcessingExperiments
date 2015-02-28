
String word = "Remember";

int rememberedMillis;
float fadeSpeed = 6;
float maxReflectedDist;

float waterTop;
int nStars = 200;
Star[] stars;

float maxBackgroundColor = 1.0f;
float minBackgroundColor = 1.0f;
float actualBackground = 0.0;

float waterBrightnessScale = .5;
void setup()
{
  noStroke();
  size(800, 600);
  textFont(createFont("Arial",64,true));
  colorMode(RGB, 1.0f, 1.0f, 1.0f, 1.0f);
  waterTop = height * .52;
  
  maxReflectedDist = height * .4;
  
  stars = new Star[nStars];
  for (int i = 0; i< nStars; i++)
  {
    stars[i] = new Star();
  }
}

void draw()
{
  drawBackground();
  textAlign(CENTER);
  
  float fade = ((millis() - rememberedMillis) * .001) / fadeSpeed;
  fade *= fade;
  fill(1, (1 - fade) * maxBackgroundColor);
  text(word, width/2, height/2);
  
  fill(1, (1 - fade) * .125 * maxBackgroundColor);
  scale(1, -1);
  text(word, width/2, - (waterTop + (waterTop - height / 2)));
}

void drawBackground()
{
  background(0);
  fill(.1, .05, .4);
  rect(0, waterTop, width, height - waterTop);
  
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].Draw();
  }
  
  float fade = ((millis() - rememberedMillis) * .001) / fadeSpeed;
  fade = constrain(fade, 0, 1);
  fade *= fade;
  
  float targetBkg = lerp(1 - minBackgroundColor, 1- maxBackgroundColor, 1 - fade);
  actualBackground = lerp(actualBackground, targetBkg, .15);
  fill(0, actualBackground);
  rect(0, 0, width, height);
}

void mousePressed()
{
  rememberedMillis = millis();
  
  fadeSpeed *= .6f;
  
  maxBackgroundColor *= .85f;
  minBackgroundColor *= .6f;
}

class Star
{
  float twinkleOffset;
  float twinkleDuration;
  float x;
  float y;
  float size;
  
  public Star()
  {
    twinkleOffset = random(0, PI * 2);
    twinkleDuration = random(.001, .005);
    
    x = random(0, width);
    y = random(0, waterTop - 5);
    size = random(2, 4);
  }
  
  public void Draw()
  {
    float intensity = sin(twinkleOffset + twinkleDuration * millis());
    intensity = map(intensity, -1, 1, .1, .9);
    
    fill(1, intensity);
    ellipse(x, y, size, size);
    
    float waterDistInterp = (waterTop - y) / maxReflectedDist;
    waterDistInterp = constrain(waterDistInterp, 0, 1);
    
    fill(1, intensity * (1 - waterDistInterp) * waterBrightnessScale);
    ellipse(x, waterTop + (waterTop - y), size, size);
  }
}


