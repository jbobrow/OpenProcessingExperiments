
color[][] color_schemes = {
{#FCFFF5,#D1DBBD,#91AA9D,#3E606F,#193441},
{#E6E2AF,#A7A37E,#EFECCA,#046380,#002F2F},
{#468966,#FFF0A5,#FFB03B,#B64926,#8E2800},
{#B9121B,#4C1B1B,#F6E497,#FCFAE1,#BD8D46},
{#000000,#263248,#7E8AA2,#FFFFFF,#FF9800},
{#7D8A2E,#C9D787,#FFFFFF,#FFC0A9,#FF8598},
{#FFF8E3,#CCCC9F,#33332D,#9FB4CC,#DB4105},
{#105B63,#FFFAD5,#FFD34E,#DB9E36,#BD4932},
{#DC3522,#D9CB9E,#374140,#2A2C2B,#1E1E20},
{#D8CAA8,#5C832F,#284907,#382513,#363942},
{#85DB18,#CDE855,#F5F6D4,#A7C520,#493F0B},
{#10222B,#95AB63,#BDD684,#E2F0D6,#F6FFE0},
{#B4AF91,#787746,#40411E,#32331D,#C03000},
{#225378,#1695A3,#ACF0F2,#F3FFE2,#EB7F00},
{#292929,#5B7876,#8F9E8B,#F2E6B6,#412A22},
{#595241,#B8AE9C,#FFFFFF,#ACCFCC,#8A0917},
{#004358,#1F8A70,#BEDB39,#FFE11A,#FD7400},
{#FF6138,#FFFF9D,#BEEB9F,#79BD8F,#00A388},
{#E8E595,#D0A825,#40627C,#26393D,#FFFAE4},
{#04BFBF,#CAFCD8,#F7E967,#A9CF54,#588F27},
{#F6F792,#333745,#77C4D3,#DAEDE2,#EA2E49},
{#1C1D21,#31353D,#445878,#92CDCF,#EEEFF7},
{#2F2933,#01A2A6,#29D9C2,#BDF271,#FFFFA6},
{#703030,#2F343B,#7E827A,#E3CDA4,#C77966},
{#96CA2D,#B5E655,#EDF7F2,#4BB5C1,#7FC6BC},
{#FF5335,#B39C85,#306E73,#3B424D,#1D181F},
{#000000,#333333,#FF358B,#01B0F0,#AEEE00},
{#2E0927,#D90000,#FF2D00,#FF8C00,#04756F},
{#332532,#644D52,#F77A52,#FF974F,#A49A87},
{#3E454C,#2185C5,#7ECEFD,#FFF6E5,#FF7F66},
{#E7E8D1,#D3CEAA,#FBF7E4,#424242,#8E001C},
{#CFC291,#FFF6C5,#A1E8D9,#FF712C,#695D46}
};

// Mathew Bonell
// trexmatt@hotmail.com
// www.matjb.com

float mousex_prev;
float mousey_prev;
int min_stroke = 1;
int max_stroke_set = 7;
int max_stroke = max_stroke_set;
int stroke_weight = max_stroke;
int count = 0;
int sign = -1;
boolean clicked_once = false;
int mirror_mode = 4;
int scheme_index = 0;
int color_index = 0;
color current_color;
int backgroundc = 255;


void setup()
{

  size( 600, 600 );
  background(255);

  current_color = color_schemes[scheme_index][color_index];
}


void draw()
{

  hint(ENABLE_STROKE_PURE);

  if ( clicked_once == false )
  {
    display_help();
  }

  if ( mousePressed == true )
  {

    if ( clicked_once == false )
    {
      clicked_once = true;
      background(backgroundc);
    }

    line( mousex_prev, mousey_prev, mouseX, mouseY );

    if ( mirror_mode == 1 )
    {
      // Mirror: y = x
      line( width - mousex_prev, height - mousey_prev, width - mouseX, height - mouseY );
    }

    if ( mirror_mode == 2 )
    {
      // Mirror: Horizontal 
      line( width - mousex_prev, mousey_prev, width - mouseX, mouseY );
    }

    if ( mirror_mode == 3 )
    {
      // Mirror: Vertical
      line( mousex_prev, height - mousey_prev, mouseX, height - mouseY );
    }

    if ( mirror_mode == 4 )
    {
      // Mirror: 4 way
      line( width - mousex_prev, mousey_prev, width - mouseX, mouseY );
      line( mousex_prev, height - mousey_prev, mouseX, height - mouseY );
      line( width - mousex_prev, height - mousey_prev, width - mouseX, height - mouseY );
    }

    if ( mirror_mode == 8 )
    {

      // Mirror: 8 way

      line( mousex_prev + 50, mousey_prev, mouseX + 50, mouseY );
      line( width - mousex_prev, mousey_prev, width - mouseX, mouseY );
      line( width - mousex_prev + 50, mousey_prev, width - mouseX + 50, mouseY );
      line( mousex_prev, height - mousey_prev, mouseX, height - mouseY );
      line( mousex_prev + 50, height - mousey_prev, mouseX  + 50, height - mouseY );
      line( width - mousex_prev, height - mousey_prev, width - mouseX, height - mouseY );
      line( width - mousex_prev + 50, height - mousey_prev, width - mouseX + 50, height - mouseY );
    }

    mousex_prev = mouseX;
    mousey_prev = mouseY;

    stroke( red(current_color), green(current_color), blue(current_color) );
    
    if( mouseButton == LEFT )
    {
      strokeWeight(stroke_weight);
    }
    else
    {
      strokeWeight(min_stroke);
    }


    if ( count % 4 == 0 )
    {
      stroke_weight =  stroke_weight + 1*sign;
      //current_opac = current_opac + 1*sign*10;
      color_index += 1;
      if ( color_index < 5 )
      {
        current_color = color_schemes[scheme_index][color_index];
      }
      else
      {
        color_index = 0;
        current_color = color_schemes[scheme_index][color_index];
      }
    }
    count += 1;

    // Oscillate stroke weight between 0 and max_stroke
    if ( stroke_weight <= min_stroke )
    {
      sign = 1;
    }

    if ( stroke_weight == max_stroke )
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

void display_help()
{
  float t = height * 0.025;
  background(255);
  textSize(width*0.05);
  text("Click to draw", width/2 - t*5, height/2 );
  textSize(t);
  text("Q: black background", width/2 - width/4, height/2 - height/4);
  text("W: white background", width/2 - width/4, height/2 - height/4 + t);
  text("DEL/Back: clear", width/2 + t*2, height/2 - height/4);
  text("ENTER: save image", width/2 + t*2, height/2 - height/4 + t);
  text("A: change colors up", width/2 - width/4, height/2 - t*4 );
  text("Z: change colors down", width/2 - width/4, height/2 - t*3 );
  text("1: mirror horizontal", width/2 - width/4, height/2 - t*7 );
  text("2: mirror vertical", width/2 - width/4, height/2 - t*6 );
  text("3: mirror diagonal", width/2 + t, height/2 - t*7 );
  text("4: mirror 4", width/2 + t, height/2 - t*6 );
  text("8: mirror 8!!!", width/2 + t*8, height/2 - t*6 );
  text("E: size +", width/2 + t*3, height/2 - t*4 );
  text("R: size -", width/2 + t*3, height/2 - t*3 );
  text("T: reset size", width/2 + t*8, height/2 - t*3 );
  fill(0);
}

void display_author()
{
  
  background(255);
  textSize(50);
  text("Mathew Bonell", width/2 - 200, height/2 );
  textSize(35);
  text("2013", width/2 - 80, height/2 + 50 );
  fill(0);
 
}

void keyPressed()
{

  // Display controls if you press others keys
  if ( key == 'd' ||  key == 'f' || key == 'c' || key == 'v' || key == 'f' || key == 'g' || key == 'l' || key == 'b'
    || key == 'y' || key == 'h' || key == 'n' || key == 'j' || key == 'u' || key == 'i' || key == 'k' || key == 'o'
    || key == 'p'  )
  {
    display_help();
    clicked_once = false;
  }

  // Display author (hey, that's me!)
  
  if( key == 'm' )
  {
    display_author();
  }

  // Save Image
  // Only works on your own computer
  /*
  if ( key == ENTER )
  {
    saveFrame( "C:\\Users\\Home\\Desktop\\myfile####.png" );
  }
  */

  // Change background color

  if ( key == 'q' )
  {
    backgroundc = 0;
    background(backgroundc);
  }

  if ( key == 'w' )
  {
    backgroundc = 255;
    background(backgroundc);
  }

  // Increase stroke
  if ( key == 'e' )
  {
    max_stroke = max_stroke + 10;
  }

  // Decrease stroke
  if ( key == 'r' )
  {
    max_stroke = max_stroke - 10;
  }

  // Reset stroke
  if ( key == 't' )
  {
    max_stroke = max_stroke_set;
  }

  // Change mirror mode to 1
  if ( key == '1' )
  {
    mirror_mode = 1;
  }

  // Change mirror mode to 2
  if ( key == '2' )
  {
    mirror_mode = 2;
  }

  // Change mirror mode to 3
  if ( key == '3' )
  {
    mirror_mode = 3;
  }

  // Change mirror mode to 4
  if ( key == '4' )
  {
    mirror_mode = 4;
  }

  // Change mirror mode to 8
  if ( key == '8' )
  {
    mirror_mode = 8;
  }
}

void keyReleased()
{
  // Move index forward
  if ( key == 'a' && scheme_index < color_schemes.length )
  {
    scheme_index += 1;
    if( scheme_index > color_schemes.length - 1 )
    {
      scheme_index = 0;
    }
  }
  // Move index backwards
  if ( key == 'z' && scheme_index > 0 )
  {
    scheme_index -= 1;
    if( scheme_index < 0 )
    {
      scheme_index = color_schemes.length;
    }
  }

  // Clear background
  if ( key == BACKSPACE )
  {
    background(backgroundc);
  }
}

