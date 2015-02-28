
import beads.*;
import java.io.File;
import java.io.IOException;
import javax.sound.sampled.*;
import org.tritonus.*;

int bg = 0;
AudioContext ac;
RecordToFile wav;
Clock clk;
int clockFreq = 500;
float G = 0.01;
SonicMap smap;
float avgx = 0;
float avgy = 0;
float camx = 0;
float camy = 0;

// -------------------------

class Particle {
   public float mass;
   public float x, y;
   public float mind, maxd, avgd;
   public float xvelo, yvelo;
   public float gravdensity = 0;
   public int mutefor;
   public int mutedur;
   private WavePlayer wp;
   public Particle(){
     mutefor = 0;
     mutedur = 50;
     mass = 1 + (float)Math.random()*3;
     xvelo = (float)(Math.random()-0.5)*2;
     yvelo = (float)(Math.random()-0.5)*2;
   }
   public void pluck(){
     if (mutefor <= 0){
       float vol = 0.04 + abs(xvelo*xvelo + yvelo*yvelo)/mass/5000;
       float freq = max(40, 100 + x);//log(Math.round((4.0-mass)*2)/2)*200;
       WavePlayer wp = new WavePlayer(ac, freq, Buffer.SINE);
       Gain g = new Gain(ac, 1, new Envelope(ac, vol));
       ((Envelope)g.getGainEnvelope()).addSegment(0, 2000, new KillTrigger(g)); //1000000/freq
       g.addInput(wp);
       ac.out.addInput(g);
       mutefor = mutedur;
     }
   }
   public void play(){
      if (mutefor > 0) mutefor--;
      this.draw();
   }
   private void draw(){
      if (mutefor > 0 && mass < 3){
        int beatage = mutedur - mutefor;
        float r = mass + 2 + beatage*beatage/30;
        strokeWeight(1);
        stroke(bg + max(0, 120 - beatage*2.5));
        noFill();
        ellipse(x, y, r, r);
      }
      noStroke();
      fill(min(170+mutefor*10, 255));
      float s = mass + mutefor/mass/3.0 + (float)Math.random()*abs(xvelo/2.0);
      if (mutefor <= 0) s /= 1.2;
      ellipse(x, y, s, s);
   }
}

// -------------------------

class SonicMap {
  public Particle[] particles;
  public OscillatorBank obank;
  public SonicMap(){
    int population = 200;
    particles = new Particle[population];
    for (int i = 0; i < population; i++){
      particles[i] = new Particle();
      particles[i].x = (float)Math.random() * width - width/2;
      particles[i].y = ((float)Math.random() * height - height/2)*1.25;
    }
  }
  public void interact(){
    strokeWeight(0.25);
    stroke(bg+40);
    for (int i = 0; i < particles.length; i++){
      float ax = 0, ay = 0;
      float min_d = 9999;
      float max_d = 0;
      float avg_d = 0;
      float d0 = dist(particles[i].x, particles[i].y, 0, 0);
      float gd = 0;
      for (int j = 0; j < particles.length; j++){
        if (i == j) continue;
        float dx = particles[j].x - particles[i].x;
        float dy = particles[j].y - particles[i].y;
        float d = sqrt(dx*dx + dy*dy);
        float a = G * particles[j].mass / (d);
        //gd += particles[j].mass / (d);
        ax += dx / d * a;
        ay += dy / d * a;
        //avg_d += d;
        if (d < min_d) min_d = d;
        //if (d > max_d) max_d = d;
        if (d < 15){
          line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
        }
        // mouse gravity well
        if (mousePressed){
          float dm = dist(particles[i].x, particles[i].y, mouseX - width/2, mouseY - height/2);
          float dmx = mouseX - width/2 - particles[i].x;
          float dmy = mouseY - height/2 - particles[i].y;
          float am =  G * (1) / dm;
          ax -= dmx / dm * am;
          ay -= dmy / dm * am;
        }
      }
      //particles[i].avgd = avg_d / particles.length;
      //particles[i].mind = min_d;
      //particles[i].maxd = max_d;
      //particles[i].gravdensity = gd;
      particles[i].xvelo += min(5,abs(ax))*(ax<0?-1:1);
      particles[i].yvelo += min(5,abs(ay))*(ay<0?-1:1);
      if (min_d < 0.5){
        particles[i].pluck();
      }
    }
    for (int i = 0; i < particles.length; i++){
      particles[i].x += particles[i].xvelo;
      particles[i].y += particles[i].yvelo;
      avgx += particles[i].x;
      avgy += particles[i].x;
    }
    avgx /= particles.length;
    avgy /= particles.length;
  }
  public void play(){
    interact();
    noStroke();
    fill(255);
    for (int i = 0; i < particles.length; i++){
      particles[i].play();
    }
  }
}

// -------------------------

void setup(){
  frameRate(30);
  //smooth();
size(674,350);
  ac = new AudioContext();
  smap = new SonicMap();
  ac.start();
  //wav.start();
  background(bg);
}

// -------------------------

void draw(){
  fill(bg, 240);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  camx += (avgx - camx) * 0.1;
  camy += (avgy - camy) * 0.1;
  translate(camx, camy);
  smap.play();
  if (frameCount == 30*30){
     //wav.kill();
     //exit(); 
  }
}

