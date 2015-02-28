
import java.awt.Color;

public class Balls implements ISOSurface {
  public PVector[] balls;
  float[] masses, noiseSeeds;
  PVector minVec, maxVec;
  color[] ballColors;// = {#FF0000, #00FF00, #0000FF, #FFFF00, #FF00FF, #00FFFF};
  public Balls(int ballCount, PVector minVec, PVector maxVec) {
    this.minVec = minVec;
    this.maxVec = maxVec;
    balls = new PVector[ballCount];
    masses = new float[ballCount];
    noiseSeeds = new float[ballCount];
    ballColors = new color[ballCount];
    for (int i = 0; i < ballCount; i++) {
      noiseSeeds[i] = random(1000.0);
      masses[i] = noise(noiseSeeds[i] + 20) * 300.0 + 100.0;
      balls[i] = new PVector(
        noise(noiseSeeds[i] - 10) * (maxVec.x - minVec.x) + minVec.x,
        noise(noiseSeeds[i]) * (maxVec.y - minVec.y) + minVec.y,
        noise(noiseSeeds[i] + 10) * (maxVec.z - minVec.z) + minVec.z
      );
      int bc = Color.HSBtoRGB(((255.0/ballCount) * i)/255.0, 0.9, 0.9);
      ballColors[i] = color((bc >> 16) & 0xFF, (bc >> 8) & 0xFF, bc & 0xFF);
    }
  }

  public float getISOValue(PVector p, float isoVal) {
    float energy = 0.0;
    float r, g, b;
    r = g = b = 0;
    for (int i = 0; i < balls.length; i++) {
      
      float eb = PVector.sub(p,balls[i]).mag();
      float ec = masses[i]/(eb * eb);  
      r += red(ballColors[i]) * ec;
      g += green(ballColors[i]) * ec;      
      b += blue(ballColors[i]) * ec;
      energy += ec;
    }
    fill(r / isoVal, g / isoVal, b / isoVal);
    return energy;
  }

  public PVector getNormal(PVector p) {
    PVector surfNorm = new PVector(0,0,0);    

    for (int i = 0; i < balls.length; i++) {
      PVector nv = PVector.sub(p, balls[i]);
      nv.mult(2 * masses[i]);
      surfNorm.add(PVector.div(nv,pow((float)nv.mag(), 3.0)));
    }
    surfNorm.div(balls.length);
    surfNorm.normalize();
    return surfNorm;
  }
  public void animate(int fc) {
    for (int i = 0; i < balls.length; i++) {

      balls[i] = new PVector(
        noise(noiseSeeds[i] - 10.0 + fc / 200.0) * (maxVec.x - minVec.x) + minVec.x,
        noise(noiseSeeds[i] + fc / 200.0) * (maxVec.y - minVec.y) + minVec.y,
        noise(noiseSeeds[i] + 10.0 + fc / 200.0) * (maxVec.z - minVec.z) + minVec.z
      );
      masses[i] = noise(noiseSeeds[i] + 20.0 + fc / 200.0) * 300.0 + 100.0;
    }
  }
  public PVector[] getHints() {
    return balls;
  }
}




