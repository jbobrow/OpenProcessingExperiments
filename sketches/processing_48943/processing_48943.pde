
import java.util.ArrayList;

long state      = 0;
long temp_state = 0;

boolean rnd     = false;

int cols        = 59;
int t           = 0;

int box_size    = 8;
int padding     = 2;
boolean stroke  = true;

// laws
// enlists only laws that give 1
byte law        = 0;
byte[] laws = {1,4,6};

long PART       = 7;
int start_pos   = 1;
int end_pos     = cols;
  
void setup() 
{
  
  size(cols*box_size, cols*box_size);
  background(255);
  if(rnd)
  {
    for(int i = start_pos; i < end_pos; ++i)
    {
      state |= ((random(2) < 1) ? 1L << i : 0);
    }    
  }
  else
  {
    state |= 1 << (cols/2 + start_pos);
  }
  
  if(!stroke)
  {
    noStroke();
  }
}

void step()
{
  temp_state = 0;
  state |= (state >> end_pos) & 1;
  state |= (state << end_pos) & (1L << (end_pos+1)) ;
  
  for(int i = start_pos; i <= end_pos; ++i)
  {
    for(int j = 0; j < laws.length; ++j)
    {
      temp_state |= ((state >> (i-1) & PART) == laws[j]) ? 1L << i : 0;
    }
  }
  
  state = temp_state;

}

void draw()
{
  for(int i = start_pos; i <= end_pos; ++i)
  {
    
    if(((state >> i) & 1) == 1)
    {
      fill(0, 0, 0);
    }
    else
    {
      fill(255,255,255);
    }
    rect((end_pos-i)*box_size, t*box_size, box_size-padding, box_size-padding);
  }
  
  step();
  
  if(++t == cols) t = 0;
}

/*void setLaw(byte law)
{
  laws.clear();
  
  for(byte i = 0; law > 0; law >>>= 1, ++i)
  {
    if(law & 1 == 1) laws.add(i);
  }
  this.law = law;
}*/

