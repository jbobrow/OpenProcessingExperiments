
/* @pjs preload="100000.txt"; */
// Sam Fisk 2015 (gmaemoose.co.uk)
// Playing with pi
// If pi is [{xyz}], where x,y=coords, z=cardinal direction (doesn't match so 10th is different)
String pi;
int pi_it, pi_len;
//int colour;

void setup()
{
  String lines[] = loadStrings("http://www.angio.net/pi/digits/100000.txt");
  if ( lines.length > 0 ) pi = lines[0];
  else exit();
  
  pi_it = 0;
  pi_len = pi.length();
  size(500,500);
  stroke(0,0,0,31);
}

int digit(var val) { return val-'0'; }

void draw()
{
  if ( (pi_it+3) >= pi_len ) return;
  int x = digit(pi.charAt(pi_it+0)),
    y = digit(pi.charAt(pi_it+1)),
    z = digit(pi.charAt(pi_it+2));
  float targ_x = 0, targ_y = 0;
  switch ( z )
  {
  case 0: targ_x = 0; targ_y = 0; break;
  case 1: targ_x = 0; targ_y = 1; break;
  case 2: targ_x = 1; targ_y = 1; break;
  case 3: targ_x = 1; targ_y = 0; break;
  case 4: targ_x = 1; targ_y = -1; break;
  case 5: targ_x = 0; targ_y = -1; break;
  case 6: targ_x = -1; targ_y = -1; break;
  case 7: targ_x = -1; targ_y = 0; break;
  case 8: targ_x = -1; targ_y = -1; break;
  case 9: targ_x = 0.25; targ_y = 0.5; break;
  }
  line(x*50+25, y*50+25,
    x*50+targ_x*25+25, y*50+targ_y*25+25);
  pi_it += 3;
  //colour -= 32;
  //stroke(colour);
}

