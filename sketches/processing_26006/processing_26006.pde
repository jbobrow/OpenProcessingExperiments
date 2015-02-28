
class Particle
{
  float positionX;
  float positionY;
  float moveX;
  float moveY;
  float gravity;
  byte intensity;

  public Particle()
  {
    initPartic();
  }

  private void initPartic()
  {
    positionX = (width / 2f) + random(1f);
    positionY = (height / 2f) + random(1f);
    moveX = 0f;
    moveY = 0f;
    gravity = 4f + random(5f);
    intensity = (byte) random(80f);
  }

  void update()
  {
    // movement
    positionX += moveX;
    positionY += moveY;

    final float fDistX = mouseX - positionX;
    final float fDistY = mouseY - positionY;
    final float fDist = (float) Math.sqrt((fDistX * fDistX) + (fDistY * fDistY));

    if (fDist != 0f)
    {
      // attraction force is calculated from particle "weight" and distance
      final float fForce = gravity * fDist;

      // impact particle movement by attraction force
      moveX += fDistX / fForce;
      moveY += fDistY / fForce;
    }
  }

  void render(PImage img)
  {
    final int x = (int) positionX;
    final int y = (int) positionY;

    if ((x >= 0) && (x < img.width) && (y >= 0) && (y < img.height))
    {
      final int offset = (y * img.width) + x;
      final color c = img.pixels[offset];  
      final float b = brightness(c) + 0.3f;
      img.pixels[offset] = color(globalHue, 1f, (b > 1f)? 1f : b);
    }
  }
}


