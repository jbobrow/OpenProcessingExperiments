
import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer jingle;
FFT fft;
float  angle = 200;
int num = 20;
Effect[] myEffect = new Effect[num];
void setup()
{
  size(1600,950);
  for(int i =0 ; i < num;  i++)
  {
//    myEffect[i] = new Effect(color(random(255),random(255),random(255)), random(0,3), random(0.003, 0.01));
    myEffect[i] = new Effect(color(random(25,020)), random(250,3), random(200.00,22.901));
  }
  minim = new Minim(this);
  
  jingle = minim.loadFile("Spring Rain.mp3", 2048);
  jingle.loop();
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  smooth(10000);
  noStroke();
  background(20);
}
 
void draw()
{
  background(250);
  fft.forward(jingle.mix);
  fft.window(FFT.HAMMING);
  
  for(int i =2 ; i < num-1;  i++)
  {
    myEffect[i].add_won_size = fft.getBand(i)/20+2;
    myEffect[i].add_num = i;
    myEffect[i].c_alpha = fft.getBand(i)*5;
    myEffect[i].b =  myEffect[i].b + fft.getBand(i)/200;
    myEffect[i].mix_level = jingle.mix.level()*10;
    myEffect[i].display();
    myEffect[i].drive();
  }
}
 
void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}
 
class Effect
{
  float xpos, ypos;
  float won_size;
  float add_won_size;
  float speed;
  float speed_a = 20;
  float b = 0;
  float add_num;
  float c_alpha;
  color c;
  float mix_level;
//  Effect(color temp_c, float temp_won_size, float temp_add_num)
    Effect(color temp_c, float temp_won_size, float temp_speed)
  {
    c = temp_c;
    won_size = temp_won_size;
    speed = temp_speed;
  }
  
  void display()
  {
    if(c_alpha > 30)
    {
    stroke(c, c_alpha/0.1);
    line(width/2, height/3000, xpos, ypos);
    fill(140,130);
    stroke(c, c_alpha/0.1);
    line(width/2, height/1, xpos, ypos);  

  }
    noStroke();
    fill(c,100+c_alpha);
    ellipse(xpos, ypos, won_size + 1, won_size + 10);
    fill(c,36+c_alpha);
    ellipse(xpos, ypos, won_size + 1 + mix_level*2, won_size + 80 + mix_level*2);
    fill(c,100+c_alpha);
    ellipse(xpos, ypos, won_size + 1 + mix_level*2, won_size + 100 + mix_level*2);
  }
  void drive()
  {
    xpos = width/2 + sin(speed_a+(2))*(24 * sin(b));
    ypos = height/2 + cos(speed_a+(2))*(20 * sin(b));
    speed_a+=speed;  // 회전속도
  }
}

