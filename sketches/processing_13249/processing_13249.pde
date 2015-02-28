
class LSystem
{
  String axiom;
  int rootX,rootY;
  String string;
  String [] rules;
  String rule;
  float [] state;
  float [][]state_stack;
  int stack_size = 0;
  int pos = 0;
  color col;
  float angle = 0;
  int count;
  
  LSystem(int x, int y, String rule,int count)
  { 
    rootX = x;
    rootY = y;
    this.count = count;
    axiom = "F";
    string = "F";
    state = new float[3];
    state[0] = 0;
    state[1] = 100;
    state[2] = 0;
    col = color(0,100,0);
    
    this.rule = rule;
    state_stack = new float [2000][3];
  }
  
  void iterate()
{
  for(int i=0;i< count;i++)
   {
     String string_next = "";
     
     for(int j =0; j < string.length(); j++)
      {
        char c = string.charAt(j);
        if(c == 'F')
        {
          string_next = string_next + rule;
        }
        else if (c == 'O')
        {
          string_next = string_next + "Y";
        }
        else if (c == 'R')
        {
          string_next = string_next + "R";
        }
        else 
        {
          string_next = string_next + c ;
        }
      }
      string = string_next;
      println(string);
   }
}
  void draw1()
{ pushMatrix();
  translate(rootX,rootY);
  rotate(3 * PI);
  strokeWeight(0.5);
  
  for(int i=0; i< string.length(); i++)
  { 
    char c = string.charAt(pos);
   // println(c);
    
    switch (c)
    {
      case 'F':
      float branch = 10 + random(-1 * 10 * 0.5, 10 * 0.5);
      float x_delta = branch * sin(state[2]);
      float y_delta = branch * cos(state[2]);
      stroke(col);
      line(state[0],state[1], state[0]+x_delta, state[1]+y_delta);
      state[0]+= x_delta;
      state[1]+= y_delta;
      break;
      
      case 'B':
      float branch1 = 10 + random(-1 * 10 * 0.5, 10 * 0.5);
      float x_delta1 = branch1 * sin(state[2]);
      float y_delta1 = branch1 * cos(state[2]);
      stroke(139,69,19);
      line(state[0],state[1], state[0]+x_delta1, state[1]+y_delta1);
      state[0]+= x_delta1;
      state[1]+= y_delta1;
      break;
      
      case '-':
      state[2] -= (angle_dev + random(-1 * angle_dev * 0.5 , angle_dev* 0.5));
      break;
      
      case '+':
      state[2] += (angle_dev + random(-1 * angle_dev * 0.5 , angle_dev* 0.5));
      break;
      
      case 'Y':
      branch = 10 + random(-1 * 10 * 0.5, 10 * 0.5);
      x_delta = branch * sin(state[2]);
      y_delta = branch * cos(state[2]);
      stroke(255,255,0);
      line(state[0],state[1], state[0]+x_delta, state[1]+y_delta);
      break;
      
      case 'R':
      fill(255,0,0);
      stroke(255,0,0);
      ellipse(state[0],state[1],3.0,3.0);
      break;
      
      
      
      case '[':
      arraycopy(state, state_stack[stack_size++]);
      break;
      
      case ']':
      arraycopy(state_stack[--stack_size], state);
      break;
       }
   pos++;
   }
   popMatrix();
 }
}


