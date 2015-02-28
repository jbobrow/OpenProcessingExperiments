
class Ent
{
  float x, y, a, v;
  
  float r, g, b;
  float fb1, fb2, fb3;
  
  float[] l_eye;
  float[] r_eye;
  
  float energy;
  float near;
  float biterange;
  
  float a2;
  
  NN nn;
  
  int v_id;
  
  Ent()
  {
    x = random(10, sx-10);
    y = random(10, sy-10);
    
    biterange = 0.0;
        
    a = random(-PI, PI);
  
    r = 1.0;
    g = 0.0;
    b = 0.0;
    
    energy = 0;
   
    l_eye = new float[3]; 
    r_eye = new float[3];
    
    near = 9999;
    
    nn = new NN(10, 7, 4, 9);
    
  }
  
  void checkEyes()
  {
    l_eye[0] = 0.0;   
    l_eye[1] = 0.0;
    l_eye[2] = 0.0;
    r_eye[0] = 0.0;
    r_eye[1] = 0.0;
    r_eye[2] = 0.0;
    
    float la = a - 0.32;
    float ra = a + 0.32;
    
    float range = 0.74;
      
    for (int i = 0; i < visibles.size(); i++)
    {        
      PVector v1 = new PVector(x, y);  
      PVector v2 = new PVector((visibles.get(i)).x, (visibles.get(i)).y);
    
      float ab = atan2((visibles.get(i)).x - x, (visibles.get(i)).y - y);
    
      float r = v1.dist(v2);
      
      if((Float.isInfinite(r)) || (Float.isNaN(r)) || (r == 0.0))
        continue;
        
      if((Float.isInfinite(ab)) || (Float.isNaN(ab)))
        continue;
      
      if ((visibles.get(i)).id == v_id)
        continue;
      
      if ((r < near) && ((visibles.get(i)).id == -1))
        near = r;
      
      float ld = a_diff(la, ab);
      float rd = a_diff(ra, ab);
      
      if((Float.isNaN(ld)) || (Float.isInfinite(ld)))
        continue;

      if((Float.isNaN(rd)) || (Float.isInfinite(rd)))
        continue;
            
      if ((ld > -range) && (ld < range))
      {       
        l_eye[0] += 16*((visibles.get(i)).r/r);
        l_eye[1] += 16*((visibles.get(i)).g/r);
        l_eye[2] += 16*((visibles.get(i)).b/r);  
      }
      else if ((rd > -range) && (rd < range))
      { 
        r_eye[0] += 16*((visibles.get(i)).r/r);
        r_eye[1] += 16*((visibles.get(i)).g/r);
        r_eye[2] += 16*((visibles.get(i)).b/r);    
      }      
        
      l_eye[0] = nn.tanh(l_eye[0]);   
      l_eye[1] = nn.tanh(l_eye[1]);
      l_eye[2] = nn.tanh(l_eye[2]);
      r_eye[0] = nn.tanh(r_eye[0]);
      r_eye[1] = nn.tanh(r_eye[1]);
      r_eye[2] = nn.tanh(r_eye[2]);
      
      if(Float.isNaN(l_eye[0]))
        l_eye[0] = 0;
      if(Float.isNaN(l_eye[1]))
        l_eye[1] = 0;
      if(Float.isNaN(l_eye[2]))
        l_eye[2] = 0;
      if(Float.isNaN(r_eye[0]))
        r_eye[0] = 0;
      if(Float.isNaN(r_eye[1]))
        r_eye[1] = 0;
      if(Float.isNaN(r_eye[2]))
        r_eye[2] = 0;
      
      noStroke();
      float ex = x + sin(la)*4;
      float ey = y + cos(la)*4;
      
      fill(l_eye[0]*255, l_eye[1]*255, l_eye[2]*255);
      ellipse(ex, ey, 4, 4);
      
      ex = x + sin(ra)*4;
      ey = y + cos(ra)*4;
      
      fill(r_eye[0]*255, r_eye[1]*255, r_eye[2]*255);
      ellipse(ex, ey, 4, 4);
      
    }    
  }
    
  void update()
  {     
    float[] ins = {l_eye[0], l_eye[1], l_eye[2], r_eye[0], r_eye[1], r_eye[2], 1/near, biterange, v, map(a2, -0.1, 0.1, -1, 1)};
    
    float[] outs = nn.update(ins);
    
    biterange = 0.0;
    
    a2 += abs(outs[0])*0.03;
    a2 -= abs(outs[1])*0.03;
    
    if (a2 > 0.1)
      a2 -= 0.2;
    if (a2 < -0.1)
      a2 += 0.2;
        
    a += a2;
    
    v += outs[2]*0.05;
    
    r = map(outs[3], -1, 1, 0, 1);
    g = map(outs[4], -1, 1, 0, 1);
    b = map(outs[5], -1, 1, 0, 1);    
    
    if (a > PI)
      a -= 2*PI;
    if (a < -PI)
      a += 2*PI;
    
    if (v > 1)
      v = 1;
    if (v < -1)
      v = -1;
      
    v *= 0.9;
    
    if ((Float.isNaN(x))||(Float.isNaN(y))||(Float.isNaN(a)))
    {
      println("FUCK!");
      println(ins);
      
      x = random(10, sx-10);
      y = random(10, sx-10);
      a = random(-PI, PI);
    }
      
    x += sin(a)*v*2;
    y += cos(a)*v*2;
    
//    if (x > sx)
//      x -= sx;
//    if (x < 0)
//      x += sx;
//      
//    if (y > sy)
//      y -= sy;
//    if (y < 0)
//      y += sy;
    
    x = constrain(x, 10, sx-10);
    y = constrain(y, 10, sy-10);
         
    fill((1/near)*255);
    stroke(int(map(r, 0, 1, 0, 255)), 
      int(map(g, 0, 1, 0, 255)),
      int(map(b, 0, 1, 0, 255)));
    
    ellipse(x, y, 5, 5);
 
    for (int i = 0; i < maxfood; i++)
    {
      PVector v1 = new PVector(x, y);
      PVector v2 = new PVector(food[i].x, food[i].y);
      
      float r = v1.dist(v2);
      
      if ((r < 20) && (outs[6] > 0.0))
      {              
        float ab = atan2(food[i].x - x, food[i].y - y);
        float diff = a_diff(ab, a);
        
        if((diff > -0.5) && (diff < 0.5))
        {
          line(x, y, food[i].x, food[i].y);  
          food[i].a = ab;

          food[i].speed += 0.05;

          energy += bitesize;
          
          biterange = map(r, 0, 20, 0, 1);
    
        }
      }
    }

    if (energy >= 1.0)
    {
     // println("yum");
      energy = 0.0;
      stroke(0, 0, 255);
      fill(255, 50);
      ellipse(x, y, 30, 30);
      bitesize *= 0.99;
      if(bitesize < 0.001)
        bitesize = 0.001;
      genepool.addGenes(nn.weights);
      rnd_score++;
      print(".");
    }
    
    near = 9999;
    checkEyes();    
  }
}



