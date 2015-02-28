
//all angles in radians
// enemy(float xi, float yi, float vxi, float diameter, float angle)//input in radians

class enemy//===========================================================[enemy]=============
{
  float x;
  float y;
  
  float v_x;
  
  int max_health;
  int health;
  
  color e_color;
  int diameter;
  float angle; //in radians
  
  
  void render()//-----[render]---------------------------------------------------
  {
    stroke(0);
    fill(e_color);
    strokeWeight(1);
    arc(x,y, diameter, diameter, PI - angle/2, PI + angle/2);
  }
  
  void update()//-----[update]--------------------------------------------
  {
    //removing old enemies
    if (x > width + 10) {
      HEALTH -= health;
      enemies.remove(this);
      return;
    }
    
    //moving forward
    x += v_x * t_frame;
    
    //--------------------[checking for collision]------------------------------
    float bx;
    float by;
    int bd;
    
    for (int i = 0; i < bullets.size(); i++) {
      if (health <= 0) return; //making sure ship doesn't get destroyed twice
      
      bx = ((proj_class)bullets.get(i)).x;
      by = ((proj_class)bullets.get(i)).y;
      //HIT HIT HIT HIT HIT HIT
      if (abs(bx - x + diameter/2) + abs(by - y) < diameter/2) {
        //bullet is close to the ship, hit
        damage( ((proj_class)bullets.get(i)).diameter);  //damaging shell size
        bullets.remove(i);
      }
    }
  }
  
  //---------[damage]-------------------------------------------------------------
  void damage(int d)
  {
    health -= d;
    
    if (health <=0) {
      explode(x,y, max_health);
      score += 30 * max_health / wave/wave;
      enemies.remove(this);
    }
  }
      
  //---------[constructor]--------------------------------------------------------
  
  enemy(float xi, float yi, float vxi, float a, int h)//input in radians
  {
    e_color = color(random(200,255),0,0);
    x = xi;
    y = yi;
    v_x = vxi;
    
    max_health = h;
    health = max_health;
    
    //diameter = d;
    diameter = 40 + 15 * int(log(max_health));
    angle = a;
  }
}

