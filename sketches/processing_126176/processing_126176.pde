
float mousex_prev;
float mousey_prev;
int min_stroke = 1;
int max_stroke = 10;
int stroke_weight = max_stroke;
int count = 0;
int sign = -1;

color[] scheme1 = { color(52,46,89), color(10,122,166), color(217,198,176), color(242,120,92), color(166,43,31) };
color[] scheme2 = { color(60,54,88), color(62,200,183), color(124,208,180), color(185,216,177), color(247,224,174) };
color[] scheme3 = { color(54,70,86), color(93,107,116), color(148,164,165), color(242,245,233), color(191,192,162) };

color[] scheme4 = { color(0,0,0), color(0,0,0), color(0,0,0), color(0,0,0), color(0,0,0) };


color c = scheme1[0];
int ci = 0;
void setup()
{
  
  size( 1000, 1000 );
  background(255);
  
}


void draw()
{
  
  if( mousePressed == true )
  {
    
    line( mousex_prev, mousey_prev, mouseX, mouseY );
    
    // Mirror: y = x
    //line( width - mousex_prev, height - mousey_prev, width - mouseX, height - mouseY );
    
    // Mirror: Horizontal 
    //line( width - mousex_prev, mousey_prev, width - mouseX, mouseY );
    
    // Mirror: 4 way
    line( width - mousex_prev, mousey_prev, width - mouseX, mouseY );
    line( mousex_prev, height - mousey_prev, mouseX, height - mouseY );
    line( width - mousex_prev, height - mousey_prev, width - mouseX, height - mouseY );
    
    mousex_prev = mouseX;
    mousey_prev = mouseY;
    
    stroke(c);
    
    strokeWeight(stroke_weight);
    count += 1;
    if( count % 4 == 0 )
    {
      stroke_weight =  stroke_weight + 1*sign;
      ci += 1;
      if( ci < 5 )
      {
        c = scheme4[ci];
      }
      else
      {
        ci = 0;
        c = scheme4[ci];
      }
    }
    
    // Oscillate stroke weight between 0 and max_stroke
    if( stroke_weight <= min_stroke )
    {
      sign = 1;
    }
    
    if( stroke_weight == max_stroke )
    {
      sign = -1;
    }
    
    
  }
  
}

void mousePressed() 
{
  mousex_prev = mouseX;
  mousey_prev = mouseY;
}
