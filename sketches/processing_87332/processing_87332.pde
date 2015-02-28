

XMLElement palette;
XMLElement palette1;

int w = 33;
int h = 29;

int numCol=1;
int randomn,randomm = 5;

color[] colors = new color[numCol];

float tick = frameCount/60.0 * PI * (1+ 0.5*sin(frameCount/60.0)) ;

void setup() {
  size(800, 800);
  //background(0);

  palette1 = new XMLElement(this, "http://www.colourlovers.com/api/palettes/top?resultOffset="+round(random(0,1)));
  smooth();
  noStroke();

  colorMode(RGB);
  strokeWeight(1);
  stroke(0);
 //noStroke();
  palette = palette1.getChildren("palette/colors")[round(random(0,3))];
  numCol = palette.getChildCount();
  
  randomn = round(random(1,20));
  
  print(palette);
  
  colors = new color[numCol];
  for(int i=0;i<numCol;i++){
     
      String s = palette.getChild(i).getContent();
      colors[i] = color(
       Integer.valueOf( s.substring( 0, 2 ), 16 ),
       Integer.valueOf( s.substring( 2, 4 ), 16 ),
       Integer.valueOf( s.substring( 4, 6 ), 16 )
       );
       print(  s + "\n" );
  }
  

}

void draw() {
  //background(0);

 
  if (mousePressed | frameCount%300==0)  {
    palette = palette1.getChildren("palette/colors")[round(random(0,10))];
    numCol = palette.getChildCount();
   colors = new color[numCol];
   for(int i=0;i<numCol;i++){
     
      String s = palette.getChild(i).getContent();
      colors[i] = color(
       Integer.valueOf( s.substring( 0, 2 ), 16 ),
       Integer.valueOf( s.substring( 2, 4 ), 16 ),
       Integer.valueOf( s.substring( 4, 6 ), 16 )
       );
       print(  s + "\n" );
        randomn = round(random(0,2));
        randomm = round(random(0,5));
  }
    //save(frameCount+"triangles.png");
  }

 noStroke();
  int count = 0;
  for ( int i=-w; i<=width; i+=w) {
    beginShape(TRIANGLE_STRIP);
    for ( int j=-h; j<=(height+2*h); j+=h) {
      float x10=1;//fft.calcAvg(map(i*j,-w*h,width*height,0,10000), map(j*i+w*h,-w*h,width*height,0,10000));
      tick = frameCount/60.0 * PI * (1+ 0.11*sin(i-frameCount/(6000.0+1000.0*randomn))) ;
      count++;
      fill(colors[abs(j-i)%colors.length], 200 + 50*(sin((j+i)/100.0+tick)));
      
      vertex(i-(4+2*sin(tick*j/100.0)), j+h*sin((j+1)*PI/60.0*randomm/10 + tick+x10));
      count++;
      //fill(colors[abs(i+j+randomn)%colors.length], 200 + 50*(sin((j+1)/100.0*tick)));
      vertex(i+w+(4+2*sin(tick*(j+h)/100.0)), j+h*sin((j+1)*PI/60.0*randomm/10 + tick+x10));

    } 
    endShape();
  }
  
}


