
import java.awt.*;

int cnum = 121;
int blocksize = 20;
int blockgap = 3;
int col = (int) ceil( sqrt( cnum ) );
int row = (int) ceil( cnum / ( col * 1.f ) );
println( cnum+" / "+col+" / "+row );

if( frame != null ) {
  println("runs locally");
  size( ( col * (blocksize + blockgap) ) + blockgap, ( row * (blocksize + blockgap) ) + blockgap );
} else {
  println("runs online");
  size( 256, 256 );
}

println( width +" / "+ height );
background( 0 );
noStroke();
colorMode(HSB, 1);
int currentcol = 0;
int currentrow = 0;
for (int i=0; i < cnum; i++ ) {
  float h = (i / (cnum * 1.f));
  fill( h, 1, 1 );
  int myColor = Color.HSBtoRGB(h, 1, 1);
  println("color: " + i + " >> " + (int)((myColor >> 16) & 0xFF) + " / " + (int)((myColor >> 8) & 0xFF) +" / "+ (int)((myColor) & 0xFF)  ); 
  rect( (currentcol* (blocksize+blockgap)) + blockgap, (currentrow* (blocksize+blockgap)) + blockgap, blocksize,blocksize );
  currentcol++;
  if ( currentcol >= col ) {
    currentcol = 0;
    currentrow++;
  }
}

