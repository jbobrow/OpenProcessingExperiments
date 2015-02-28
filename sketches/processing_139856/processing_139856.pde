
final int BEACON_ZONE_W = 400;
final int BEACON_ZONE_H = 250;
final int BEACON_NB_W = 60;
final int BEACON_NB_H = 40;
final float BEACON_BOUNCE = -.98;
final float BEACON_SIZE = 6;
final float FRICTION_BEACON_FLUID = .92;
final float FRICTION_MOBILE_FLUID = .35;
final float FRICTION_BEACON_OVER_MOBILE = 6;
final float FRICTION_BEACON_OVER_MOBILE_MAX = .9;
final float MOBILE_SPEED_STEP = 4;
final float SPEED_MOBILE_MAX = 80;
final float RADIUS_MIN = 20;
final float RADIUS_MAX = 80;
final float THETA_STEP = .02;
final float NOISE_SPEED_X = (random(1) > .5 ? 1 : -1) * random(.005, .02);
final float NOISE_SPEED_Y = (random(1) > .5 ? 1 : -1) * random(.005, .02);
final float COEFF_INFLUENCE = 1.01;//radius coeff where the mobile influences beacons
float radiusMobile = random(RADIUS_MIN, RADIUS_MAX);
float noiseX = random(123456);
float noiseY = random(123456);

Boolean up = false;
Boolean down = false;
Boolean left = false;
Boolean right = false;

float frictionBeaconOverMobile = 0;
PVector mobilePos;
PVector mobileSpeed = new PVector(0, 0);
Boolean isDragging = false;
Beacon[][] beacons = new Beacon[BEACON_NB_W][BEACON_NB_H];

Boolean noiseMode = false;
Boolean wireMode = false;


void setup()
{
  size(600, 500, P2D);
  mobilePos = new PVector(random(width), random(height));

  for (int i = 0; i < BEACON_NB_W; i++)
  {
    for (int j = 0; j < BEACON_NB_H; j++)
    {
      beacons[i][j] = new Beacon(i*BEACON_ZONE_W/(BEACON_NB_W - 1) + (width - BEACON_ZONE_W)/2, 
      j*BEACON_ZONE_H/(BEACON_NB_H - 1) + (height - BEACON_ZONE_H)/2, 
      color(random(255), random(255), random(255)));
      beacons[i][j].theta = atan2(mobilePos.y - beacons[i][j].y, mobilePos.x - beacons[i][j].x);
    }
  }
}

void draw()
{
  background(120);

  noiseX += NOISE_SPEED_X;
  noiseY += NOISE_SPEED_Y;

  moveMobile();

  float distance, deltaX, deltaY, signDX, signDY, angle, newDist;
  int beaconOverMobileNb = 0;//number of beacons that are in contact with the mobile
  for (int i = 0; i < BEACON_NB_W; i++)
  {
    for (int j = 0; j < BEACON_NB_H; j++)
    {
      distance = dist(mobilePos.x, mobilePos.y, beacons[i][j].x, beacons[i][j].y);

      deltaX = mobilePos.x - beacons[i][j].x;
      deltaY = mobilePos.y - beacons[i][j].y;
      angle = atan2(deltaY, deltaX);
      float alpha = atan2(beacons[i][j].target.y-mobilePos.y, beacons[i][j].target.x-mobilePos.x);
      float sign = alpha + angle > PI ? 1 : -1;
      float n = 0;//noise of each beacon

      beacons[i][j].theta = angle;
      if (distance < COEFF_INFLUENCE * radiusMobile)
      {
        beaconOverMobileNb++;

        beacons[i][j].speed.x += beacons[i][j].mass * cos(angle) / distance;
        beacons[i][j].speed.y += beacons[i][j].mass * sin(angle) / distance;
        beacons[i][j].speed.mult(.1);

        signDX = (deltaX > 0) ? -1 : 1;
        signDY = (deltaY > 0) ? -1 : 1;

        newDist = COEFF_INFLUENCE * radiusMobile;
        beacons[i][j].x = mobilePos.x + signDX * newDist * abs(cos(angle));
        beacons[i][j].y = mobilePos.y + signDY * newDist * abs(sin(angle));
      }

      angle = atan2(beacons[i][j].target.y - beacons[i][j].y, beacons[i][j].target.x - beacons[i][j].x);
      distance = dist(beacons[i][j].x, beacons[i][j].y, beacons[i][j].target.x, beacons[i][j].target.y);

      beacons[i][j].speed.x += beacons[i][j].mass * cos(angle) * distance/100;
      beacons[i][j].speed.y += beacons[i][j].mass * sin(angle) * distance/100;

      beacons[i][j].speed.mult(FRICTION_BEACON_FLUID);   
      beacons[i][j].add(beacons[i][j].speed);

      if (noiseMode)
      {
        n = .6 - noise(noiseX+.01*beacons[i][j].x, noiseY+.01*beacons[i][j].y);
        n *= 5;
        beacons[i][j].add(new PVector(n*cos(n * TWO_PI), n*sin(n * TWO_PI)));
      }

      if ((beacons[i][j].x < 0) || (beacons[i][j].x > width))
      {
        beacons[i][j].x = constrain(beacons[i][j].x, 0, width);
        beacons[i][j].speed.x *= BEACON_BOUNCE;
      }
      if ((beacons[i][j].y < 0) || (beacons[i][j].y > height))
      {
        beacons[i][j].y = constrain(beacons[i][j].y, 0, height);
        beacons[i][j].speed.y *= BEACON_BOUNCE;
      }

      if (noiseMode)
      {
        fill(color(map(n, 0, 1, 30, 220)));
      }
      else
      {      
        fill(beacons[i][j].col);
      }
      stroke(0);
      //noStroke();
      pushMatrix();
      rectMode(CENTER);
      translate(beacons[i][j].x, beacons[i][j].y);
      rotate(beacons[i][j].theta);
      rect(0, 0, BEACON_SIZE, BEACON_SIZE);
      popMatrix();
      if (wireMode)
      {
        line(beacons[i][j].x, beacons[i][j].y, beacons[i][j].target.x, beacons[i][j].target.y);
      }
    }
  }
  frictionBeaconOverMobile = constrain(beaconOverMobileNb / (radiusMobile*radiusMobile)*FRICTION_BEACON_OVER_MOBILE, 0, FRICTION_BEACON_OVER_MOBILE_MAX);
}

void moveMobile()
{
  if (up) mobileSpeed.y -= MOBILE_SPEED_STEP;
  else if (down) mobileSpeed.y += MOBILE_SPEED_STEP;
  if (left) mobileSpeed.x -= MOBILE_SPEED_STEP;
  else if (right) mobileSpeed.x += MOBILE_SPEED_STEP;

  mobileSpeed.x = constrain(mobileSpeed.x, -SPEED_MOBILE_MAX, SPEED_MOBILE_MAX);
  mobileSpeed.y = constrain(mobileSpeed.y, -SPEED_MOBILE_MAX, SPEED_MOBILE_MAX);

  mobileSpeed.mult(1-FRICTION_MOBILE_FLUID);
  mobileSpeed.mult(1-frictionBeaconOverMobile);

  mobilePos.add(mobileSpeed);

  if (mobilePos.x - radiusMobile > width) mobilePos.x = 0 - radiusMobile;
  else if (mobilePos.x + radiusMobile < 0) mobilePos.x = width + radiusMobile;
  if (mobilePos.y - radiusMobile > height) mobilePos.y = 0 - radiusMobile;
  else if (mobilePos.y + radiusMobile < 0) mobilePos.y = height + radiusMobile;

  //Drawing of the mobile
  noStroke();
  fill(0);
  ellipse(mobilePos.x, mobilePos.y, 2*radiusMobile - BEACON_SIZE, 2*radiusMobile - BEACON_SIZE);
  int B = 220;
  for (int i = floor(2*radiusMobile - BEACON_SIZE - 1); i > 0; --i)
  {
    fill(color(0, 0, B--));
    ellipse(mobilePos.x, mobilePos.y, i, i);
  }
}

void keyPressed()
{
  //println(keyCode);
  switch(keyCode)
  {
  case 37://left
    left = true;
    break;
  case 38://up
    up = true;
    break;
  case 39://right
    right = true;
    break;
  case 40://down
    down = true;
    break;
  case 65://a
    radiusMobile = constrain(radiusMobile-5, RADIUS_MIN, RADIUS_MAX);
    break;
  case 90://z
    radiusMobile = constrain(radiusMobile+5, RADIUS_MIN, RADIUS_MAX);
    break;
  case 32://space
    noiseMode = !noiseMode;
    break;
  case 87://w
    wireMode = !wireMode;
    break;
  }
}

void keyReleased()
{
  switch(keyCode)
  {
  case 37://left
    left = false;
    break;
  case 38://up
    up = false;
    break;
  case 39://right
    right = false;
    break;
  case 40://down
    down = false;
    break;
  }
}

class Beacon extends PVector
{
  PVector target;
  PVector speed = new PVector(0, 0);
  float theta = 0;
  color col;
  float mass = 1;
  Beacon(float p_x, float p_y, color p_col)
  {
    super(p_x, p_y);
    col = p_col;
    target = new PVector(p_x, p_y);
    mass = random(.8, 1.5);
  }
}


