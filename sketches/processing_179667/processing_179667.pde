
class LifeView {
   int left = 0, top = 0; // start
   int w = width-sideWidth , h = height; 
   
   LifeView( Life game ) {
   } 
}


class Life {

  color live = color( 127, 0, 0 );
  color dead = color( 0 );
  boolean debug = false;

  color[][] prev, f; // Field - Ð¿Ð¾Ð»Ðµ

  boolean run = false;
  
  // stats
  int total_cells = 0;
  int turns = 0;

  Life() {
    println( "Ctor", n );
    this.prev  = new color[ n ][ n ];
    this.f  = new color[ n ][ n ];

    for ( int x = 0; x < n; x ++ ) {
      for ( int y = 0; y < n; y++ ) {
        this.prev[x][y] = this.f[ x ][ y ] = dead;//color( 0 );
      }
    }
  }

  int getWidth() { return n; }  
  int getHeight() { return n; }

  boolean is_alive( int x, int y ) { return f[ x ][ y ] != dead; }

  void spawn( int x, int y ) { spawn( x, y, live ); }
  void spawn( int x, int y, color c ) { if( !is_alive(x, y)) {total_cells++;} f[ x ][ y ] = c;  }

  void die( int x, int y ) { if(is_alive(x,y)) total_cells--;  f[ x ][ y ] = dead;}
  
  void clear() {
    for ( int x = 0; x < getWidth(); x++ ) {
      for ( int y = 0; y < getHeight(); y++ ) {
        die( x, y );
      }
    }    
  }
  
  
  
  void prepare_draw() {
    scale( (float)(width-sideWidth) / getWidth(), (float)height / getHeight() );
    textSize( .5 ); 
  }
  

  
  void draw() {
    pushMatrix();
    prepare_draw();
    //if( key == 'r' ) background( dead );
    background( dead );
    //println( key, keyCode );
    
    for ( int x = 0; x < getWidth(); x++ ) {
      for ( int y = 0; y < getHeight(); y++ ) {
        //    if ( is_alive( x, y ) ) {
        //  }
        noStroke();
        fill( f[ x ][ y ] );
        rect( x, y, 1, 1 );

        if ( debug ) {
          //stroke( color( 255 - red(f[x][y]), 255-green(f[x][y]), 255-blue(f[x][y]) ));
          fill( 0, 255, 0 );
          //text( count_neibours( x, y ), x, y+1 );
        }
      }
    }
    
    popMatrix();
  }

 

  void turn() {

    color[][] ng = new color[getWidth()][getHeight()];

    for ( int x = 0; x < getWidth(); x ++ ) {
      for ( int y = 0; y < getHeight(); y ++ ) {

        NeiboursResult nr = count_neibours( x, y ); // Ð¿Ð¾Ñ�Ñ�Ð¸Ñ�Ð°ÐµÐ¼ Ñ�Ð¾Ñ�ÐµÐ´ÐµÐ¹ ÐºÐ»ÐµÑ�Ð¾Ñ�ÐºÐ¸
        ng[x][y] = f[x][y];

        if ( is_alive( x, y ) ) {
          if ( nr.count < 2 ) { //Ð¾Ð´Ð¸Ð½Ð¾Ñ�ÐµÑ�Ñ�Ð²Ð¾
            ng[x][y] = dead;
            total_cells--;
          }
          if ( nr.count > 3 ) { // Ð¿ÐµÑ�ÐµÐ½Ð°Ñ�ÐµÐ»ÐµÐ½Ð¸Ðµ
            ng[x][y] = dead;
            total_cells--;
          }
        } else {
          // Ð¿Ñ�Ñ�Ñ�Ð°Ñ�
          if ( nr.count == 3 ) {
            ng[x][y] = nr.middle; // Ñ�Ð¾Ð¶Ð´Ð°ÐµÐ¼ ÐºÐ»ÐµÑ�Ð¾Ñ�ÐºÑ� Ð·Ð´ÐµÑ�Ñ�
            total_cells++;
          }

        } // if ( is_alive( x, y ) )
        
        //println( x, y, f[x][y], ng[x][y] );
        
      } // for ( int y
    } // for ( int x
    
    //// Ð½Ð¾Ð²Ð¾Ðµ Ð¿Ð¾ÐºÐ¾Ð»ÐµÐ½Ð¸Ðµ
    boolean blinks = true;
    boolean changed = false;
    
    for ( int x = 0; x < getWidth(); x ++ ) {
      for ( int y = 0; y < getHeight(); y ++ ) {
        if( f[x][y] != ng[x][y] ) {
           changed = true;
        }
        if ( prev[x][y] != ng[x][y] ) {
          blinks = false;
        }
        
        prev[x][y] = f[x][y];
        f[x][y] = ng[x][y];
      }
    }
    
    turns++;
    
    if ( !changed ) {
     this.run = false;
     println( "Not changed! Live is stopped." );
    }
   
   if ( blinks ) {
     this.run = false;
     println( "Blinks! Live is stopped." );
    }  



//    f = ng;
  }
  
  class NeiboursResult {
    int count = 0;
    color middle;
  }  

  ///            
  ///  +-----+-----+-----+
  ///  |x-1  |x,y-1|x+1  |
  ///  |y-1  |     |y-1  |  
  ///  +-----+-----+-----+
  ///  |x-1,y|x,y  |x+1,y|
  ///  |     |     |     |  
  ///  +-----+-----+-----+
  ///  |x-1  |x,y+1|x+1  |
  ///  |y+1  |     |y+1  |  
  ///  +-----+-----+-----+
  NeiboursResult count_neibours( int x, int y ) {

    //int result = 0;
    int r = 0, g = 0, b = 0;
    NeiboursResult result = new NeiboursResult();

    for ( int dx = -1; dx <= 1; dx++ ) {
      for ( int dy = -1; dy <= 1; dy++ ) {

        int nx = x + dx, ny = y + dy;

        if ( dx == 0 && dy == 0 ) { 
          continue;
        }


        if ( nx < 0 ) { 
          nx += getWidth();
        }
        if ( nx >= getWidth() ) { 
          nx -= getWidth();
        }
        if ( ny < 0 ) { 
          ny += getHeight();
        }
        if ( ny >= getHeight() ) { 
          ny -= getHeight();
        }

        if ( is_alive( nx, ny ) ) {
          result.count++;
          r += red(f[ nx ][ ny ]);
          g += green(f[ nx ][ ny ]);
          b += blue(f[ nx ][ ny ]);
        }
      }
    }
    
    if ( result.count > 0 ) {
      result.middle = color(r / result.count, g / result.count, b / result.count);
    }

    return result;
  }
}


/**
 * ÐºÐ»Ð°Ñ�Ñ� Ñ�Ð¿Ñ�Ð°Ð²Ð»ÐµÐ½Ð¸Ñ� Ð¸Ð³Ñ�Ð¾Ð¹
 */
class LifeControl {

  Life life;

  int x, y;
  int fr; // rate
  color[] pallette = { 
    color(255), 
    color(255, 0, 0), // red
    #FFA500, // orange
    #FFFF00, // yellow
    #008000, // green
    #00ffff, // blue
    #0000ff, 
    #800080, // violet
  };
  int active_color = 0;

  LifeControl( Life life_ ) {
    this.life = life_;
    pallette[0] = life.live;

    x = life.getWidth() / 2;
    y = life.getHeight() / 2;
    fr = 0;    
    // frameRate( fr );
  }

  void draw() {
    // ÐºÐ¾Ð³Ð´Ð° Ñ�Ð¸Ð¼Ñ�Ð»Ñ�Ñ�Ð¸Ñ� Ð² Ð¿Ñ�Ð¾Ñ�ÐµÑ�Ñ�Ðµ - Ð½Ðµ Ñ�Ð¸Ñ�Ñ�ÐµÐ¼ Ñ�Ð°Ð¼ÐºÑ�
    //if ( life.run ) return;
    //println( x, y ); 
    // Ñ�Ð¸Ñ�Ñ�ÐµÐ¼ Ñ�Ð°Ð¼ÐºÑ�

    pushMatrix();
    life.prepare_draw();
    strokeWeight( life.getWidth() / (float)width );
    stroke(color(255-red(life.f[x][y]), 255-green(life.f[x][y]), 255-blue(life.f[x][y])));
    noFill();
    rect( x, y, 1, 1 );
    popMatrix();

    textSize( 12 );
    fill( 0, 255, 0 );
    textAlign(   CENTER, TOP );
    text( frameRate, width-sideWidth/2, 0 );
    text( life.total_cells, width-sideWidth/2, 15 );
    text( life.turns, width-sideWidth/2, 30 );

    for ( int y = 0; y < pallette.length; y++ ) {
      noStroke();

      if ( active_color == y ) {
        strokeWeight(1);
        stroke( 255 );
      }

      fill( pallette[ y ] );
      rect(  width-sideWidth/2, 50 + y*50, 40, 40 );
      fill(255);
      text( y+1, width-sideWidth/2+25, 50 + y*50 +15 );
    }
  }

  boolean onKeyPressed() {
    if ( key >= '1' && key < '1' + pallette.length ) {
      active_color = key - '1'; 
      return true;
    }
    switch( key ) {
      
    case ' ': 
      if ( life.is_alive( x, y ) ) {
        life.die( x, y );
      } else {
        life.spawn( x, y, pallette[ active_color ] );
      } 
      break;
    case 'x':
      fr -= 50;
      fr = constrain( fr, 0, 5000 );
      println( "Current delay: " + fr );
      break;
    case 'z':
      fr += 50;
      fr = constrain( fr, 0, 5000 );
      println( "Current delay: " + fr );
      break;
    case ESC: {
        life.run = false;
        return true;
    }
    case ENTER: {
        life.run = !life.run;
        return true;
    }
    case BACKSPACE: {
       life.clear();
        return true; 
    }
    
    case 'r': {
      randomize();
      return true;
    }

    case CODED:
      switch( keyCode ) {
      case UP: 
        { 
          y--; 
          check_bounds(); 
          return true;
        }
      case DOWN: 
        { 
          y++; 
          check_bounds(); 
          return true;
        }
      case RIGHT: 
        { 
          x++; 
          check_bounds(); 
          return true;
        }
      case LEFT: 
        { 
          x--; 
          check_bounds(); 
          return true;
        }

      }

      break;
    }


    return false;
  }
  
  void mouseDragged() {
     
//println( mouseX, mouseY, gameView.left, gameView.left+gameView.w );    
    
    
    if( mouseX >= gameView.left && mouseX <= gameView.left + gameView.w &&
      mouseY >= gameView.top && mouseY <= gameView.top + gameView.h ) {
      game.spawn( 
        (int)map( mouseX, 0, width-sideWidth, 0, game.getWidth() - 1 ),
        (int)map( mouseY, 0, height, 0, game.getHeight() - 1),
        pallette[ active_color ]
      );        
    }
  }
  
  void randomize() {
    
    float density = 10; // 0 .. 100 - Ð¿Ð¾ÐºÐ°Ð·Ñ�Ð²Ð°ÐµÑ� Ð·Ð°Ð¿Ð¾Ð»Ð½ÐµÐ½Ð½Ð¾Ñ�Ñ�Ñ� Ð¿Ð¾Ð»Ñ� 0 Ð¿Ñ�Ñ�Ñ�Ð¾Ðµ, 1 Ð¿Ð¾Ð»Ð½Ð¾Ðµ
    
    for ( int x = 0; x < life.getWidth(); x++ ) {
      
      for ( int y = 0; y < life.getHeight(); y++ ) {
        
         if ( random( 100 ) <= density ) {
           life.spawn( x, y, pallette[ (int)random( pallette.length ) ] );
         }  
      }
    }
  }

  void check_bounds() {
    if ( x < 0 ) { 
      x += life.getWidth();
    }
    if ( x >= life.getWidth() ) { 
      x -= life.getWidth();
    }
    if ( y < 0 ) { 
      y += life.getHeight();
    }
    if ( y >= life.getHeight() ) { 
      y -= life.getHeight();
    }
  }
}

//LifePixels game = new LifePixels();
int n = 50;
int sideWidth = 200; // in pixels
int last_turn = 0;/// last moment of turn

Life game = new Life();
LifeControl gameControl = new LifeControl( game );
LifeView gameView;


void setup() {
  size( 800, 600 );
  //frameRate( .2 );
  noStroke();
  gameView = new LifeView( game );
}

void keyPressed() {
  
  //if ( gameControl.onKeyPressed() ) return;
  gameControl.onKeyPressed();

  switch( key ) {
  case 'p':
    game.run = !game.run;
    if ( game.run ) { 
      println( "Started" );
    } 
    else { 
      println( "Paused" );
    } 
    break;
  }
}

void mouseClicked() {
  //stroke( game.live );
  //println( "clicked: " + mouseX, width, game.getWidth() );
  //game.spawn( (int)map( mouseX, 0, width, 0, game.getWidth() ), (int)map( mouseY, 0, height, 0, game.getHeight() ) );
  //redraw();
  //game.draw();
}

void mouseDragged() {
  gameControl.mouseDragged();
//  stroke( game.live );
  //`game.spawn( (int)map( mouseX, 0, width, 0, game.getWidth() ), (int)map( mouseY, 0, height, 0, game.getHeight() ) );
  //redraw();
  //game.draw();
}

void draw() {
  
  if ( millis() - last_turn >= gameControl.fr ) {
    if ( game.run ) { 
      game.turn();
      last_turn = millis();
    }
  }
  
  
  game.draw();
  gameControl.draw();
  
}


