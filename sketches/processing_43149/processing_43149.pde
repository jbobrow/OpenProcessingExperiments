
class Lsystem {
  int xpos, ypos; //coordinates in drawspace of base
  String system; //actual system
  String axiom;
  int iterations;
  String Frule, Xrule;
  float minus_radians, plus_radians;
  float width_factor, root_width;
  float length_factor;
  int ticks_per_branch;
  int life_time;
  float perm_len;
  int leaf_size;
  color branch_vibrant, leaf_prev, leaf_next;
  int leaf_change_counter, leaf_change_increment;
  
  Lsystem(int rootx, int rooty, float high_point, int breed, int global_time)
  {
    branch_vibrant = color(108,28,107,200);
    leaf_next = color(109,255,19,170);
    leaf_prev = color(15,40);
    leaf_change_counter = 400;
    leaf_change_increment = leaf_change_counter;
    life_time = 0;
    xpos = rootx;
    ypos = rooty;
    root_width = 10;
    width_factor = 0.6;
    length_factor = 0.6;
    perm_len = high_point/2;
    leaf_size = (int)random(15,25);
    ticks_per_branch = (int)max(4,30-((float)global_time/50));
    println(ticks_per_branch);
    
    Xrule = "F";
    switch(breed)
    {
      case 1:
      axiom = "F[F]";
      iterations = 3;
      Frule = "F[+F][-F]";
      Xrule = Frule;
      minus_radians = 0.8;
      plus_radians = 0.8;
      width_factor = 0.7;
      break;
      
      case 2:
      axiom = "+F";
      iterations = 5;
      Frule = "F[-FF]";
      Xrule = Frule;
      minus_radians = 1.0;
      plus_radians = 0.8;
      break;
      
      case 3:
      axiom = "F-F";
      iterations = 3 + (int)random(-2,4);
      length_factor = random(0.55,0.8);
      Frule = "X[+F]";
      Xrule = "X";
      minus_radians = 0.8;
      plus_radians = 0.8;
      break;
      
      case 4:
      axiom = "FFF";
      iterations = 2;
      Frule = "F[+FF][-FF]";
      Xrule = Frule;
      minus_radians = 0.8;
      plus_radians = 0.8;
      break;
      
      case 5:
      axiom = "F[F]";
      iterations = 4;
      Frule = "F+F[-F-F]";
      Xrule = Frule;
      plus_radians = 0.1;
      minus_radians = 0.9;
      length_factor = 0.8;
      perm_len = high_point/3.7;
      break;
      
      case 6:
      axiom = "F";
      iterations = 4;
      Frule = "F[F-F+F]";
      Xrule = Frule;
      plus_radians = 0.7;
      minus_radians = 0.7;
      length_factor = 0.6;
      width_factor = 0.7;
      break;
      
      case 7:
      axiom = "FX";
      iterations = 3;
      Frule = "F[+X][-X]F";
      Xrule = "[-X][--X][+X][++X]";
      plus_radians = 0.2;
      minus_radians = 0.2;
      length_factor = 0.7;
      perm_len = high_point/3.7;
      break;
      
    }
      
    minus_radians += random(-0.1,0.1);
    plus_radians += random(-0.1,0.1);
    root_width = root_width + (int)random(-4,4);
    system = axiom;
    
    
    for (int i = 0; i < iterations; ++i)
    {
      println(system);
      println(' ');
      system = applyFrule(system);
      
    }
    println(system);
    println(breed);
  
  }
  
  // Frule applied to system
  String applyFrule(String input)
  {
    String output = "";
  
    for(int i = 0; i < input.length(); ++i)
    {
      if (input.charAt(i) == 'F')
      {
        if (random(1,100) > 200) //flip to X
        {
          output = output + Xrule;
        }
        else
        {
          output = output + Frule;
        }
      }
      else if (input.charAt(i) == 'X')
      {
        if(random(1,100) > 200)
        {
          output = output + Frule;
        }
        else
        {
          output = output + Xrule;
        }
      }
      else
      {   
        output = output + input.charAt(i);
      }
    }
      
    return output;
  }
  
  void draw(int global_time)
  {
    ++life_time;
    int time = life_time;
    int gray = 0;
    Branch[] stack = new Branch[64];
    int stack_pointer = 0;
    
    
    
    pushMatrix();
    translate(xpos,ypos);
    
    int curx, cury;
    curx = 0;
    cury = 0;
    float angel = 0;
    float prev_angel = 0;
    float len = perm_len;
    
    float branch_width = root_width;
    int branch_count = 0;
    plus_radians += sin(time/10)/400;
    minus_radians += cos(time/5)/1000;
    for (int i = 0; i < system.length(); ++i)
    {
      
      char operator = system.charAt(i);
      if (operator == 'F' || operator == 'X')
      {
        //controlling the growth
        float temp_len = len;
        ++branch_count;
        if (branch_count > time/ticks_per_branch)
        {
          len = len * ((time%ticks_per_branch) + 1) / ticks_per_branch;
        
        }
        
        
        noStroke();
        //branch color
        if (global_time < 200)
        {
          fill(gray,40);
        }
        else
        {
          fill(blend_color(color(gray,40),branch_vibrant,((float)global_time-200-branch_count*50)/(400)));
        }
        gray = gray + 1;
        
        int next_x = curx + (int)(len*sin(angel));
        int next_y = cury - (int)(len*cos(angel));
        
        int curx_1 = curx - (int)(branch_width*cos(prev_angel));
        int curx_2 = curx + (int)(branch_width*cos(prev_angel));
        int cury_1 = cury - (int)(branch_width*sin(prev_angel));
        int cury_2 = cury + (int)(branch_width*sin(prev_angel));
        
        branch_width = max(branch_width*width_factor,2);
        
        int next_x1 = next_x - (int)(branch_width*cos(angel));
        int next_x2 = next_x + (int)(branch_width*cos(angel));
        int next_y1 = next_y - (int)(branch_width*sin(angel));
        int next_y2 = next_y + (int)(branch_width*sin(angel));
      
        beginShape();
        vertex(curx_1,cury_1);
        vertex(curx_2,cury_2);
        vertex(next_x2,next_y2);
        vertex(next_x1,next_y1);
        endShape();
 
        curx = next_x;
        cury = next_y;
        prev_angel = angel;
        
        if (branch_count > time/ticks_per_branch)
        {
          break;
        }
        len = temp_len;
        len *= length_factor;
        
      }
      else if (operator == '+')
      {
        
        angel += plus_radians;
        
      }
      else if (operator == '-')
      {
    
        angel -= minus_radians;
      }
      else if (operator == '[') //push
      {
        if (stack[stack_pointer] == null)
        {
          stack[stack_pointer] = new Branch();
        }
       
        stack[stack_pointer].xpos = curx;
        stack[stack_pointer].ypos = cury;
        stack[stack_pointer].angel = angel;
        stack[stack_pointer].branch_width = branch_width;
        stack[stack_pointer].prev_angel = prev_angel;
        stack[stack_pointer].branch_length = len;
        ++stack_pointer;
      }
      else if (operator == ']')
      {
        --stack_pointer;
        //fade from color to color
        //counter tracks when next change, increased by increment each time
        float factor = ((float)time - leaf_change_counter + leaf_change_increment - (branch_count*(float)30*(leaf_change_counter-time)/leaf_change_increment))/leaf_change_increment;
        fill(blend_color(leaf_prev,leaf_next, factor));
        
        if (time > leaf_change_counter)
        {
          leaf_prev = leaf_next;
          leaf_next = color(random(1,255),random(1,255),random(1,255),random(150,255));
          leaf_change_increment *= 0.7;
          leaf_change_increment = max(leaf_change_increment,80);
          leaf_change_counter += leaf_change_increment;
          
        }
        ellipse(curx,cury,leaf_size,leaf_size);
     
        curx = stack[stack_pointer].xpos;
        cury = stack[stack_pointer].ypos;
        angel = stack[stack_pointer].angel;
        branch_width = stack[stack_pointer].branch_width;
        prev_angel = stack[stack_pointer].prev_angel;
        len = stack[stack_pointer].branch_length;
        
      }
    }
    
    popMatrix();
  } //end draw function
  
  //color fading function to blend
  color blend_color(color x, color y, float factor)
  {
    color output;
    if (factor < 0) 
    {
      output = x;
      return output;
    }
    else if (factor > 1)
    {
      output = y;
      return output;
    }
    
    output = color((1-factor)*red(x)+factor*red(y),(1-factor)*green(x)+factor*green(y),(1-factor)*blue(x)+factor*blue(y),(1-factor)*alpha(x)+factor*alpha(y));
    return output;
  }
      
    
  
}

