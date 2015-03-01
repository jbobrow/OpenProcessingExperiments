
class Cilium
{
  final int LENGTH = 190;
  final float POINTS_DIST = 2.2;//distance between each point
  final int NB_POINTS = (int)(LENGTH/POINTS_DIST);
  final float AMPLITUDE = random(1.5, 2);
  final float MIN_SPEED = .2;//min 'elastic speed' of each segment
  final float MAX_SPEED = .99;//max 'elastic speed' of each segment
  final float period = random(.5, 4);//number of 'complete waves' per cilium
  final float step = random(.02, .12);//speed of the wave
  final float PERIODS = random(1.2, 2);
  final float s = TWO_PI * PERIODS / NB_POINTS;
  float radius;
  PVector[] pos = new PVector[NB_POINTS];
  float angle;
  PVector D;//default delta when at rest
  float time = random(123456);//used to cycle the oscillation
  color[] colors = new color[NB_POINTS];
  float colorAdjust = random(0, 20);

  PVector location;
  PVector direction;
  PVector target;

  float speed, SPEED;

  Cilium(float p_radius, float p_angle, PVector location, PVector direction, float speed)
  {
    this.location = location;
    this.direction = direction;
    this.speed = speed;
    SPEED = speed;

    angle = p_angle;
    radius = p_radius;
    D = new PVector(POINTS_DIST*cos(angle), POINTS_DIST*sin(angle));
    for (int i = 0; i < NB_POINTS; i++)
    {
      pos[i] = new PVector(location.x, location.y);     
      colors[i] = color (324, 90, 90);
    }

    target = new PVector (0, 0);
  }

  void move ()
  {
    float maxDis = dist (0, 0, width, height);
    float dis = dist (target.x, target.y, location.x, location.y);

    float forceStrength = map (dis, 0, maxDis, 0.5, 0.05);

    float a = atan2 (target.y - location.y, target.x - location.x);
    PVector acceleration = new PVector (cos(a)*forceStrength, sin (a)*forceStrength);

     if (dis > 40 && speed < 1) speed += 0.005;

    direction.add (acceleration);
    direction.normalize();


    location.x += speed * direction.x; 
    location.y += speed * direction.y;

    if (speed > SPEED) speed*= 0.995;
    if (speed < SPEED) speed*= 1.002;
  }

  void setTarget(float x, float y)
  {
    target.x = x;
    target.y = y;
  }

  void process(float targetX, float targetY)
  {
    setTarget (targetX, targetY);
    move();
    time += step;

    pos[0] = new PVector(location.x + radius * cos(angle), location.y + radius * sin(angle));
    for (int i = 1; i < NB_POINTS; i++)
    {
      PVector delta = new PVector(pos[i].x - pos[i-1].x, pos[i].y - pos[i-1].y);
      float coeff = map(i, NB_POINTS, 0, MIN_SPEED, MAX_SPEED);
      delta.x -= coeff * (delta.x - D.x);
      delta.y -= coeff * (delta.y - D.y);

      float tmpX = i * period / NB_POINTS;
      float tmpY = AMPLITUDE * sin(i * s + time) * cos(HALF_PI + HALF_PI * i / NB_POINTS);
      delta.x += tmpX * cos(angle) - tmpY * sin(angle);//angle roatation of the oscillation
      delta.y += tmpX * sin(angle) + tmpY * cos(angle);//angle roatation of the oscillation

      delta.normalize();
      delta.mult(POINTS_DIST);

      pos[i].x = pos[i-1].x + delta.x;
      pos[i].y = pos[i-1].y + delta.y;
    }
  }

  void render(int p_rank)
  {
    //line(pos[p_rank-1].x, pos[p_rank-1].y, pos[p_rank].x, pos[p_rank].y);
    noStroke();
    //fill(constrain(2.2*(NB_POINTS-p_rank) - 20, 0, 250));
    //fill(map(p_rank, NB_POINTS, 0, 0, 250));
    if (p_rank == 0)
    {
      colors[p_rank] = color(constrain(R, 0, 360), constrain(G, 0, 100), constrain(B, 0, 100));
    }
    else if (p_rank == 1)
    {
     //colors[p_rank] = color(colorAdjust+R, colorAdjust+G, colorAdjust+B);
      //colors[p_rank] = color(R, G, B);
      colors[p_rank] = color(/*(colorAdjust+R)%360*/R, (colorAdjust+G)%255, (colorAdjust+B)%255); 
      //colors[p_rank] = color(R%255, G%255, B%255);
    }
    else
    {
      //colors[p_rank] = color(R, G, B);
      colors[p_rank] = colors[p_rank-1];
    }
    fill(colors[p_rank]);
    ellipse(pos[p_rank].x, pos[p_rank].y, (int)sqrt(10*(NB_POINTS-p_rank)), (int)sqrt(10*(NB_POINTS-p_rank)));
  }
}


