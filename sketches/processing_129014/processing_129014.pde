
/*                                                                 Иллюзия 1-ая
/*и в обратную сторону ,и // -- это знаки коммен. !                                                                                                                    */
int n = 19; // порядок нашей доски
float sqx, sqy; // square x, y
float r = 12, pad = 10; // circle radius, padding, of 100  
boolean do_illusion = true;

color color1 = color( 0 );
color color2 = color( 255 );


void setup() {
  size( 500, 500 ); 
  rectMode( CORNERS );
  sqx = (float)width/n;
  sqy = (float)height/n;
  println( n, sqx, sqy );
  noStroke();
}

void mousePressed() {
  do_illusion = false;
}
void mouseReleased() {
  do_illusion = true;
}

void draw() {

  boolean q; // в какой четверти доски мы находимся - для I и III - true
  color bg, fg; // background, foreground
  float cx, cy, cx2, cy2;

  for ( int y = 0; y < n; y++ ) {
    for ( int x = 0; x < n; x++ ) {

      q  = (x < n/2 && y < n/2) || (x >= n/2 && y >= n/2) ;// мы слева вверху или справа внизу

      if ( (x + y) % 2 == 0 ) {// чет - будем красить
        bg = color1;
        fg = color2;
      } 
      else {
        bg = color2;
        fg = color1;
      }

      fill( bg );
      rect( x * sqx, y * sqy, (x+1) * sqx, (y+1) * sqy );// рисуем поле...
      fill( fg );


      if ( do_illusion && (x != int(n/2) && y != int(n/2)) ) {

        pushMatrix(); // сохранить систему координат save coordinat system
        translate( x*sqx, y*sqy );
        scale(sqx / 100, sqy / 100 ); // makes 100 as maximum coordinat inside square-based coordinat system 


        fill( fg );

        cy = pad + r;
        cy2 = 100 - pad - r;        

        if ( (x + y) % 2 == (q ? 0 : 1) ) {

          cx = 100 - pad - r;
          cx2 = pad + r;
        } 
        else {
          cx = pad + r;
          cx2 = 100 - pad - r;
        }

        ellipse( cx, cy, 2*r, 2*r );
        ellipse( cx2, cy2, 2*r, 2*r );

        popMatrix();

        //text( x + " " + y + " " + q, x * sqx + sqx / 2, y * sqy + sqy /2 );// ( если хотим ) подписываем...
      }
    }
  }
}

