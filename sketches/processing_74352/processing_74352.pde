

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
WhiteNoise wn;
BandPass bpf;
LowPassSP lpf;

// Properties that can be modified
private static final int ms_nWorldWidth = 20;
private static final int ms_nWorldHeight = 20;
private static final int ms_nWorldDepth = 20;

private static final int ms_nEnvWidth = 800;
private static final int ms_nEnvHeight = 800;
private static final int ms_nEnvDepth = 800;

private static final int ms_nParticlesCount = 400;
private static final int ms_nParticlesHistorySize = 50;
private static final float ms_fGravitationConstant = 8000.0f;
private static final float ms_fFrictionFactor = 0.98f;
private static final float ms_fMaximumParticleAcceleration = 15.0f;

// Private attributes
private final float m_fXOffset = (float)ms_nEnvWidth / (float)ms_nWorldWidth;
private final float m_fYOffset = (float)ms_nEnvHeight / (float)ms_nWorldHeight;
private final float m_fZOffset = (float)ms_nEnvDepth / (float)ms_nWorldDepth;

private final float m_fXcamOffset = (float)ms_nEnvWidth * 0.5f;
private final float m_fYcamOffset = (float)ms_nEnvHeight * 0.5f;
private final float m_fZcamOffset = (float)ms_nEnvDepth * 1.1f;
private final float m_fZcamCenterOffset = (float)ms_nEnvHeight * 0.5f;

PImage iBackground;

private Particle[] m_Particles;


public void setup() {
  size(800, 800, P3D);
  iBackground = loadImage ("LogoBackground.jpg");
  resetWorld();
}

public void draw() {
  float fTime = millis();

  // Camera definition
  float fCamPosX = (cos(fTime / 10000.0f) * m_fZcamOffset) + m_fXcamOffset;
  float fCamPosY = (cos(fTime / 20000.0f) * m_fZcamOffset) + m_fYcamOffset;
  float fCamPosZ = (sin(fTime / 10000.0f) * m_fZcamOffset) + m_fYcamOffset;

  beginCamera();
  camera(fCamPosX, fCamPosY, fCamPosZ, m_fXcamOffset, m_fYcamOffset, m_fZcamCenterOffset, 0.0f, 1.0f, 0.0f);
  endCamera();

  updateWorld();
  updateSound();

  background(iBackground);

  drawWorld();
  drawCorners();
}

public void mousePressed() {
  out.close();
  resetWorld();
}

public void stop() {
  out.close();
  minim.stop();

  super.stop();
}

private void initializeSound() {
  minim = new Minim(this);
  out = minim.getLineOut();
  wn = new WhiteNoise(0.1f);
  out.addSignal(wn);
  lpf = new LowPassSP(100, out.sampleRate());
  bpf = new BandPass(440, 20, out.sampleRate());
  out.addEffect(lpf);
  out.addEffect(bpf);
}

private void resetWorld() {
  initializeSound();

  m_Particles = new Particle[ms_nParticlesCount];

  for (int i = 0; i < ms_nParticlesCount; ++i)
  {
    m_Particles[i] = new Particle(new PVector(random(ms_nEnvWidth), random(ms_nEnvHeight), random(ms_nEnvDepth)));
  }
}

private void updateWorld() {
  PVector vDir, vAcc, vLoc1, vLoc2;

  for (int i = 0; i < ms_nParticlesCount; ++i) {
    vDir = new PVector (0, 0, 0);
    vAcc = new PVector (0, 0, 0);

    vLoc1 = m_Particles[i].GetLoc();

    for (int j = 0; j < ms_nParticlesCount; ++j) {
      if (j != i) {
        vLoc2 = m_Particles[j].GetLoc();

        vDir = PVector.sub(vLoc2, vLoc1);
        float fDist = vLoc1.dist(vLoc2);
        float acc = ms_fGravitationConstant / (fDist * fDist);

        vDir.normalize();
        vDir.mult(acc);

        vAcc.add(vDir);
      }
    }

    vAcc.div(ms_nParticlesCount - 1);

    m_Particles[i].SetAcc(vAcc);
    m_Particles[i].Update();
  }
}

private void drawWorld() {
  strokeWeight(3);
  stroke(255, 127);

  for (int i = 0; i < ms_nParticlesCount; ++i) {
    m_Particles[i].Render();
  }
}

private void drawCorners() {
  strokeWeight(1);
  stroke(85);

  line (0.0f, 0.0f, 0.0f, m_fXOffset, 0.0f, 0.0f);
  line (0.0f, 0.0f, 0.0f, 0.0f, m_fYOffset, 0.0f);
  line (0.0f, 0.0f, 0.0f, 0.0f, 0.0f, m_fZOffset);

  line (ms_nEnvWidth, 0.0f, 0.0f, ms_nEnvWidth - m_fXOffset, 0.0f, 0.0f);
  line (ms_nEnvWidth, 0.0f, 0.0f, ms_nEnvWidth, m_fYOffset, 0.0f);
  line (ms_nEnvWidth, 0.0f, 0.0f, ms_nEnvWidth, 0.0f, m_fZOffset);

  line (0.0f, ms_nEnvHeight, 0.0f, m_fXOffset, ms_nEnvHeight, 0.0f);
  line (0.0f, ms_nEnvHeight, 0.0f, 0.0f, ms_nEnvHeight - m_fYOffset, 0.0f);
  line (0.0f, ms_nEnvHeight, 0.0f, 0.0f, ms_nEnvHeight, m_fZOffset);

  line (ms_nEnvWidth, ms_nEnvHeight, 0.0f, ms_nEnvWidth - m_fXOffset, ms_nEnvHeight, 0.0f);
  line (ms_nEnvWidth, ms_nEnvHeight, 0.0f, ms_nEnvWidth, ms_nEnvHeight - m_fYOffset, 0.0f);
  line (ms_nEnvWidth, ms_nEnvHeight, 0.0f, ms_nEnvWidth, ms_nEnvHeight, m_fZOffset);

  line (0.0f, 0.0f, ms_nEnvDepth, m_fXOffset, 0.0f, ms_nEnvDepth);
  line (0.0f, 0.0f, ms_nEnvDepth, 0.0f, m_fYOffset, ms_nEnvDepth);
  line (0.0f, 0.0f, ms_nEnvDepth, 0.0f, 0.0f, ms_nEnvDepth - m_fZOffset);

  line (ms_nEnvWidth, 0.0f, ms_nEnvDepth, ms_nEnvWidth - m_fXOffset, 0.0f, ms_nEnvDepth);
  line (ms_nEnvWidth, 0.0f, ms_nEnvDepth, ms_nEnvWidth, m_fYOffset, ms_nEnvDepth);
  line (ms_nEnvWidth, 0.0f, ms_nEnvDepth, ms_nEnvWidth, 0.0f, ms_nEnvDepth - m_fZOffset);

  line (0.0f, ms_nEnvHeight, ms_nEnvDepth, m_fXOffset, ms_nEnvHeight, ms_nEnvDepth);
  line (0.0f, ms_nEnvHeight, ms_nEnvDepth, 0.0f, ms_nEnvHeight - m_fYOffset, ms_nEnvDepth);
  line (0.0f, ms_nEnvHeight, ms_nEnvDepth, 0.0f, ms_nEnvHeight, ms_nEnvDepth - m_fZOffset);

  line (ms_nEnvWidth, ms_nEnvHeight, ms_nEnvDepth, ms_nEnvWidth - m_fXOffset, ms_nEnvHeight, ms_nEnvDepth);
  line (ms_nEnvWidth, ms_nEnvHeight, ms_nEnvDepth, ms_nEnvWidth, ms_nEnvHeight - m_fYOffset, ms_nEnvDepth);
  line (ms_nEnvWidth, ms_nEnvHeight, ms_nEnvDepth, ms_nEnvWidth, ms_nEnvHeight, ms_nEnvDepth - m_fZOffset);
}

private void updateSound() {
  PVector vTemp = new PVector(0, 0, 0);

  for (int i = 0; i < ms_nParticlesCount; ++i) {
    vTemp.add(m_Particles[i].GetLoc());
  }

  vTemp.div(ms_nParticlesCount);

  float averageX = map(vTemp.x, 0, 800, 100, 1000);
  float averageY = map(vTemp.y, 0, 800, 50, 500);
  float averageZ = map(vTemp.z, 0, 800, 20, 1000);

  bpf.setBandWidth(averageX);
  bpf.setFreq(averageY);
  lpf.setFreq(averageZ);
}

// A simple Particle class
class Particle {
  private int m_nCurrentIndex;
  private PVector[] m_vLoc;
  private PVector m_vVel;
  private PVector m_vAcc;

  public Particle(PVector v) {
    m_vAcc = new PVector(0.0f, 0.0f, 0.0f);
    m_vVel = new PVector(0.0f, 0.0f, 0.0f);
    m_vLoc = new PVector[ms_nParticlesHistorySize];

    for (int i = 0; i < ms_nParticlesHistorySize; ++i) {
      m_vLoc[i] = v.get();
    }

    m_nCurrentIndex = 0;
  }

  public PVector GetLoc() {
    return m_vLoc[m_nCurrentIndex];
  }

  public void SetAcc(PVector v) {
    m_vAcc = v.get();

    m_vAcc.limit(ms_fMaximumParticleAcceleration);
  }

  // Method to update location
  public void Update() {
    m_vVel.add(m_vAcc);
    m_vVel.mult(ms_fFrictionFactor);

    // Fills the location history array
    int nNextIndex = getFollowingIndex(m_nCurrentIndex, 1);
    m_vLoc[nNextIndex] = m_vLoc[m_nCurrentIndex].get();
    m_vLoc[nNextIndex].add(m_vVel);

    // Increments the current index
    m_nCurrentIndex = nNextIndex;

    // Keep the particle inside the environment
    stayInEnvironment();
  }

  // Method to display
  public void Render() {
    strokeWeight(1);

    // Draws the particle trails
    for (int i = 0; i < ms_nParticlesHistorySize - 1; ++i) {
      stroke(0, map(i, 0, ms_nParticlesHistorySize, 70, 3));

      int j = getPastIndex(m_nCurrentIndex, i);
      int k = getPastIndex(m_nCurrentIndex, i + 1);
      line(m_vLoc[j].x, m_vLoc[j].y, m_vLoc[j].z, m_vLoc[k].x, m_vLoc[k].y, m_vLoc[k].z);
    }

    // Draws the particle current location
    strokeWeight(3);
    stroke(45);
    point(m_vLoc[m_nCurrentIndex].x, m_vLoc[m_nCurrentIndex].y, m_vLoc[m_nCurrentIndex].z);
  }

  private void stayInEnvironment() {
    if (m_vLoc[m_nCurrentIndex].x > ms_nEnvWidth) {
      m_vLoc[m_nCurrentIndex].x = 800;
      m_vVel.x = - m_vVel.x;
    }

    if (m_vLoc[m_nCurrentIndex].y > ms_nEnvHeight) {
      m_vLoc[m_nCurrentIndex].y = 800;
      m_vVel.y = - m_vVel.y;
    }

    if (m_vLoc[m_nCurrentIndex].z > ms_nEnvDepth) {
      m_vLoc[m_nCurrentIndex].z = 800;
      m_vVel.z = - m_vVel.z;
    }

    if (m_vLoc[m_nCurrentIndex].x < 0) {
      m_vLoc[m_nCurrentIndex].x = 0;
      m_vVel.x = - m_vVel.x;
    }

    if (m_vLoc[m_nCurrentIndex].y < 0) {
      m_vLoc[m_nCurrentIndex].y = 0;
      m_vVel.y = - m_vVel.y;
    }

    if (m_vLoc[m_nCurrentIndex].z < 0) {
      m_vLoc[m_nCurrentIndex].z = 0;
      m_vVel.z = - m_vVel.z;
    }
  }

  private int getFollowingIndex(int nIndex, int nOffset) {
    int nModulo = (nIndex + nOffset) % ms_nParticlesHistorySize;
    return nModulo >= 0 ? nModulo : nModulo + ms_nParticlesHistorySize;
  }

  private int getPastIndex(int nIndex, int nOffset) {
    int nModulo = (nIndex - nOffset) % ms_nParticlesHistorySize;
    return nModulo >= 0 ? nModulo : nModulo + ms_nParticlesHistorySize;
  }
}


