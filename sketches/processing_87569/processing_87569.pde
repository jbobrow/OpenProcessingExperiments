
final float GRID_SIZE = 16;
final int NUM_THINGS = 150;
final int TAIL_LENGTH = 10;
final int SIZE = 512;

class Thing
{
  Thing()
  {
    m_x = floor(random(SIZE / GRID_SIZE)) * GRID_SIZE;
    m_y = floor(random(SIZE / GRID_SIZE)) * GRID_SIZE;
    m_gx = new float[TAIL_LENGTH];
    m_gy = new float[TAIL_LENGTH];
    m_tailHead = 0;
    m_speed = random(10) + 1;
    m_direction = 0;
    m_movement = 0;
    m_depth = random(1);
    m_hue = random(255);
  }
  
  void update()
  {
    float movementMade = 0;
    while (movementMade < m_speed)
    {
      if (m_movement >= GRID_SIZE)
      {
        m_tailHead--;
        if (m_tailHead<0) m_tailHead = TAIL_LENGTH - 1;
        m_gx[m_tailHead] = m_x;
        m_gy[m_tailHead] = m_y;
        m_movement -= GRID_SIZE;
        m_direction = (m_direction + 4 + floor(random(3)) - 1) % 4;
      }
      
      float movementThisUpdate = min(m_movement + m_speed, GRID_SIZE) - m_movement;
      switch (m_direction)
      {
        case 0:
          m_x += movementThisUpdate;
          if (m_x >= SIZE) m_x -= SIZE;
          break;
        case 1:
          m_y += movementThisUpdate;
          if (m_y >= SIZE) m_y -= SIZE;
          break;
        case 2:
          m_x -= movementThisUpdate;
          if (m_x < 0) m_x += SIZE;
          break;
        case 3:
          m_y -= movementThisUpdate;
          if (m_y < 0) m_y += SIZE;
          break;
      }
      m_movement += movementThisUpdate;
      movementMade += movementThisUpdate;
    }

    for (int i = 0; i < TAIL_LENGTH - 1; i++)
    {
      int i1 = (m_tailHead + i) % TAIL_LENGTH;
      int i2 = (m_tailHead + i + 1) % TAIL_LENGTH;
      clippedLine(m_gx[i1], m_gy[i1], m_gx[i2], m_gy[i2]);
    }
    clippedLine(m_gx[m_tailHead], m_gy[m_tailHead], m_x, m_y);
  }
  
  void clippedLine(float x1, float y1, float x2, float y2)
  {
    if (abs(x1-x2) < GRID_SIZE*2 && abs(y1-y2) < GRID_SIZE*2)
    {
      float z1 = (((y1/SIZE) - 0.5) * 2000 + s_translate) % 2000; 
      float z2 = (((y2/SIZE) - 0.5) * 2000 + s_translate) % 2000;
      if (abs(z1-z2) < 500)
      {
        float radius = m_depth * 100 + 50;
        stroke(m_hue,200,200, ((1-m_depth) * 200 + 55) * (z2/500));
        line(sin((x1/SIZE) * 2*PI) * radius, 
             cos((x1/SIZE) * 2*PI) * radius,
             z1, 
             sin((x2/SIZE) * 2*PI) * radius, 
             cos((x2/SIZE) * 2*PI) * radius,
             z2);
      }
    }
  }
  
  float m_x, m_y;
  float[] m_gx;
  float[] m_gy;
  int m_tailHead;
  float m_speed;
  int m_direction;
  float m_movement;
  float m_depth;
  float m_hue;
}

Thing[] s_things;
float s_translate = 0;

void setup()
{
  size(512, 512, P3D);
  frameRate(25);
  colorMode(HSB);

  s_things = new Thing[NUM_THINGS];
  for (int i = 0; i < NUM_THINGS; i++)
  {
    s_things[i] = new Thing();
  }
}

void draw()
{
  background(0);
  
  s_translate += 10;
  
  float cameraY = height/2.0;
  float fov = PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  translate(width/2,height/2,0);
  rotateZ(sin((float)millis()/10000) * PI);
  
  for (int i = 0; i < NUM_THINGS; i++)
  {
    s_things[i].update();
  }
}




