
/*

    Implementation of Lindenmayer Systems:
    emulates plant growth via a simple formal grammar.

    Copyright (c) Daniel Jones 2007.
    http://www.erase.net/
   
    ----------------------------------------------------------------------

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

 */
 
/* Library for PDF creation */ 
// import processing.pdf.*;
 
String default_rule = "F[+aF][+F]F[-F]";

int    default_iterations = 4;
float  default_angle = PI / 3;
float  default_angle_chaos = 0.1;
float  default_extension = 20;
float  default_extension_chaos = 0.1;

float  col_saturation = random(80,100);
float  col_brightness = random(50,100);
float  col_base = random(100);
float  color_counter = col_base;
float  color_chaos = random(1,10);
float  rotation_chaos = random(0,0.1);
float  col_transparency = random(60,100);

int     default_x_offset = 400;
int     default_y_offset = 400;

boolean default_draw_tips = true;

String  default_filename = "iterations-0.pdf";

PShape m;

LSystem system;

class LSystem
{
  String axiom,
         string;
  String [] rules;
  String rule;
  float [] state;
  float [][] state_stack;
  int stack_size = 0;
  int pos = 0;
  
  
  float angle = default_angle;
  float angle_chaos = default_angle_chaos;
  float extension = default_extension;
  float extension_chaos = default_extension_chaos;
  
  LSystem ()
  {
    axiom = "F";
    string = "F";
    state = new float[3];
    state[0] = 0;
    state[1] = 0;
    state[2] = 0;
    
    rule = default_rule;
    state_stack = new float[4096][3];
  }
  
  void iterate ()
  {
    this.iterate(1);
  }
  
  void iterate (int count)
  {
    for (int i = 0; i < count; i++)
    {
      String string_next = "";
      
      for (int j = 0; j < string.length(); j++)
      {
        char c = string.charAt(j);
        if (c == 'F')
        {
          string_next = string_next + rule;
        } else {
          string_next = string_next + c;
        } 
      }
      string = string_next;
    } 
  }


  
  void draw()
  {
      
      translate(default_x_offset, default_y_offset);
      // rotate(1 * PI);

      for (int i = 0; i < string.length(); i++)
      {
        
        this.drawSegment();
        // addition rotate
        rotate(rotation_chaos * PI);
      }
      
      
  }
  
  void drawSegment ()
  {
    noStroke();
    if (pos >= string.length())
       { return; }
    
    char c = string.charAt(pos);
    switch (c)
    {
          case 'F':
            float ext_this = extension + random(-1.0 * extension * extension_chaos, extension * extension_chaos);
            float x_delta = ext_this * sin(state[2]);
            float y_delta = ext_this * cos(state[2]);

                    
            // line(state[0], state[1], state[0] + x_delta, state[1] + y_delta);
            
            // draw shape instead of line
            fill((color_counter)%100,col_saturation,col_brightness,col_transparency);
            color_counter += random(color_chaos);
            stroke(0);
            strokeWeight(0.01);
            shape(m,state[0], state[1],60,60) ;
            noStroke();
            
            state[0] += x_delta;
            state[1] += y_delta;
            
            if (default_draw_tips)
            {
                             
                // line(state[0], state[1], state[0] + 0.1, state[1] + 0.1);
                
                // draw shape instead of line
                fill((color_counter)%100,col_saturation,col_brightness,col_transparency);
                color_counter += random(color_chaos);
                stroke(0);
                strokeWeight(0.01);
                shape(m,state[0], state[1],40,40) ;
                noStroke();
            }

            break;
          case '-':
            state[2] -= (angle + random(-1 * angle * angle_chaos, angle * angle_chaos));
            break;
          case '+':
            state[2] += (angle + random(-1 * angle * angle_chaos, angle * angle_chaos));
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
}

void setup ()
{
  int iterations = default_iterations;

  size(800,800);
  background(250);
  frameRate(50);
  smooth();
  colorMode(HSB, 100);
  stroke(100,100,100);
  strokeWeight(2.9);
  
  // begin PDF creation - uncomment next line
  // beginRecord(PDF, default_filename);
  
  // load shape
  m = loadShape("bass.svg");   //lade dein Bild
  m.disableStyle();
  shapeMode(CENTER);
  
  // draw shape once in big size
  fill(100,0,0,10);
  shape(m,400,400,600,600) ;
  
  system = new LSystem();
  system.iterate(iterations);
  
  system.draw();
  
  // end PDF creation - uncomment next line
  // endRecord();
}

void _draw ()
{
  // To draw segment by segment, rename this routine to draw()
  // and remove system.draw() from setup().
  translate(default_x_offset, default_y_offset);
  // rotate(1.5 * PI);

  system.draw();
  for (int i = 0; i < random(10, 50); i++)
  {
    system.drawSegment();
  }
}


