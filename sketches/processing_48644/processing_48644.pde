
float gravity = 20;

class Vector2D
{
  Vector2D(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
    float x;
    float y;
}

class Particle
{
    Particle(float x, float y, float vx, float vy)
    {
      position = new Vector2D(x, y);
      velocity = new Vector2D(vx, vy);
      life = random(5, 10);
    }
    
    void Draw()
    {
        fill(0);
        ellipse(position.x, position.y, life, life);
    }
    
    void Update(float secondsPassed)
    {
        position.x += velocity.x * secondsPassed;
        position.y += (velocity.y + gravity) * secondsPassed;
        
        life -= secondsPassed;
    }
    
    boolean Expired()
    {
        return life <= 0;
    }

    Vector2D position;
    Vector2D velocity;
    float life;
}

class Fountain
{
    Fountain(int x, int y)
    {
        this.x = x;
        this.y = y;
        
        particles = new ArrayList();
    }
    
    void FillList()
    {
        while(particles.size() < 100)
        {
          float heading = random(0, 360);
          float velocity = random(0, 20);
          
          float vx = velocity * cos(heading);
          float vy = velocity * sin(heading);
            
            particles.add(new Particle(x, y, vx, vy));
        }
    }
    
    void Draw(float secondsPassed)
    {
        FillList();
        
        for(int i = particles.size() - 1; i >= 0; i--)
        {
            Particle p = (Particle)particles.get(i);
            p.Update(secondsPassed);
            if(p.Expired())
            {
                particles.remove(i);
            }
            else
            {
                p.Draw();
            }
        }
    }
    
    int x;
    int y;
    
    ArrayList particles;
}

Fountain f;

void setup()
{
  size(250, 250);
  
  f = new Fountain(width/2, height/2);
}

float lastUpdate = 0;
void draw()
{
  background(255);  //set background white

  float currentTime = millis();
  float elapsed = (currentTime - lastUpdate) / 1000;
  f.Draw(elapsed);
  lastUpdate = currentTime;
}

