
import java.util.Arrays;

String word = "words";

float[] xpositions;
float[] c_offsets;
float[] theta_offsets;

static final float FONTSIZE = 72.0;

int num_letters = 125;
float max_c = 3.0;
float max_theta = 5*PI/num_letters;
float c_time;
float theta_time;
float lastMillis;
float c_speed = 0.2;
float theta_speed = 0.1;

static final char[] charset = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

float myNoise(float x)
{
  //float val = 4.0*(noise(x)-0.25);
  //float val = noise(x);
  float val = 2.0*(noise(x)-0.5);
  //println(val);
  return val;
}

void setup()
{
  size(600,600,P2D);
  //noiseDetail(3,0.5);
  //hint(ENABLE_NATIVE_FONTS);
  if( Arrays.asList(PFont.list()).contains("Helvetica") ) 
  {
    textFont(createFont("Helvetica",FONTSIZE,true,charset));
  } else {
    textFont(createFont("Arial",FONTSIZE,true,charset));
  }
  textSize(FONTSIZE);
  xpositions = new float[word.length()];
  c_offsets = new float[word.length()];
  theta_offsets = new float[word.length()];
  float wordlength = textWidth(word);
  float letterpos = (width - wordlength)/2.0;
  for(int i = 0; i < word.length(); ++i) {
    c_offsets[i] = random(1000.);
    theta_offsets[i] = random(1000.);
    xpositions[i] = letterpos;
    float letterwidth = textWidth(word.charAt(i));
    letterpos += letterwidth;
  }
  c_time = millis()/1000.0;
  theta_time = millis()/1000.0;
  lastMillis = millis()/1000.0;
}

void draw()
{
  c_speed = map(mouseX,0,width,0.0,0.5);
  theta_speed = map(mouseY,0,height,0.0,0.25);
  float y_0 = 20.0 + FONTSIZE;
  background(0);
  float curMillis = millis()/1000.0;
  c_time += c_speed*(curMillis - lastMillis);
  theta_time += theta_speed*(curMillis - lastMillis);
  lastMillis = curMillis;
  float h = height/8.0;
  for(int i = 0; i < word.length(); ++i) {
    float c = max_c*myNoise(c_offsets[i] + c_time);
    float theta = max_theta*myNoise(theta_offsets[i] + theta_time);
    fill(255);
    text(word.charAt(i), xpositions[i], y_0);
    fill(255,255,255,8);
    float[] x = new float[4];
    float[] y = new float[4];
    x[0] = xpositions[i]; x[1] = x[0];
    x[2] = width/2.0 + c*(xpositions[i] - width/2.0);
    x[3] = x[2];
    y[0] = y_0; y[1] = y[0] + height/8.0;
    y[3] = height - 1.5*FONTSIZE;
    y[2] = y[3] - height/8.0;
    for(int j = 1; j <= num_letters; ++j) {
      pushMatrix();
      float t = (float)j/num_letters;
      translate( bezierPoint(x[0],x[1],x[2],x[3],t), bezierPoint(y[0],y[1],y[2],y[3],t) );
      rotate( theta*j );
      text(word.charAt(i),0,0);
      popMatrix();
    }
  }
}
  

