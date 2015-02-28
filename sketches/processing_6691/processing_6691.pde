
class Critter extends Particle
{
  float z;
  float dir, dir_head, v_dir_head;

  Critter()
  {
  }

  void Update()
  {
    super.Update();
    
    v_vx += vx * 0.1;
    v_vy += vy * 0.1;
    dir = atan2(v_vy, v_vx) - PI * 0.5;
    v_vx *= 0.9;
    v_vy *= 0.9;

    v_dir_head += (atan2(vy, vx) - PI * 0.5 - dir) * 0.1;
    dir_head += v_dir_head * 0.1;
    dir_head = constrain(dir_head, -PI * 0.2, PI * 0.2);
    v_dir_head *= 0.95;
    dir_head *= 0.9;
  }
  
  void DrawCritter(PGraphics pg)
  {
    float t = age;
    z = r_visual + abs(r_visual * sin(t + phase));

    int c_alpha = (int)(p_alpha * 255);
    if(c_alpha > 100) c_alpha = 255;
    pg.fill(cR + cD, cG + cD, cB + cD, c_alpha);
    pg.pushMatrix();
    pg.translate(x, y, z);
    pg.rotateZ(dir);
    pg.box(r_visual);
    pg.popMatrix();

    pg.fill(255 + cD, 255 + cD, 255 + cD, c_alpha);
    pg.pushMatrix();
    pg.translate(x, y, z + r_visual * 0.5 + 2 * cos(t + phase));
    pg.rotateZ(dir);
    pg.rotateX(PI * 0.05 * sin(t * 0.9 + phase));
    pg.translate(0, r_visual * 0.5, 0);
    pg.rotateZ(dir_head);
    pg.translate(0, r_visual * 0.5, 0);
    pg.box(r_visual * 0.5);
    pg.popMatrix();

    pg.pushMatrix();
    pg.translate(x, y + r_visual * 0.2, z);
    pg.rotateZ(dir);
    pg.rotateX(PI * 0.25 * sin(t + phase));
    pg.translate(0, 0, -r_visual);
    pg.scale(1, 1, 4);
    pg.box(r_visual * 0.2);
    pg.popMatrix();

    pg.pushMatrix();
    pg.translate(x, y - r_visual * 0.2, z);
    pg.rotateZ(dir);
    pg.rotateX(PI * 0.25 * sin(t + phase + PI));
    pg.translate(0, 0, -r_visual);
    pg.scale(1, 1, 4);
    pg.box(r_visual * 0.2);
    pg.popMatrix();
  }
}



