
class Blip{
  vec3[] pos;
  int idx;
  int count;
  
  int max;
  
  float speed = 0.1f;
  vec3 dir = new vec3();
  vec3 pre = new vec3();
  vec3 side = new vec3();
  color c;
  
  float size;
  
  void init(int _max)
  {
    max = _max;
    pos = new vec3[max];
    idx = 0;
    count = 0;
    
    for(int i=0; i<max; i++)
    {
      pos[i] = new vec3();
    }
  }

  void set(vec3 newPos)
  {
    set(
      newPos.x,
      newPos.y,
      newPos.z);    
  }
  
  void set(float _x, float _y, float _z)
  {
    count = min(max, count+1);  
  
    pre.x = pos[idx].x;  
    pre.y = pos[idx].y;  
    pre.z = pos[idx].z; 
    
    idx++;    
    idx = idx%max;
    pos[idx].x = _x;
    pos[idx].y = _y;
    pos[idx].z = _z;   
   
   if(count > 1)
   {    
    dir.x = pos[idx].x - pre.x;  
    dir.y = pos[idx].y - pre.y;  
    dir.z = pos[idx].z - pre.z;  
   } 
  }
  
  void draw()
  {
    for(int i=0; i<count; i++)
    {
      pushMatrix();
      translate(
        pos[i].x,
        pos[i].y,
        pos[i].z);
      float sizeMul = 1;
      if(i==idx)
      {
        sizeMul = 1.65f;
      }
      box(sizeMul*size);
      popMatrix();
    }
  }
}  

