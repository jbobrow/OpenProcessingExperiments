
//////////////////////////////////
// OBSERVE THE PATTERN TILL END THEN TRY LOOKING ELSE WHERE
//BY KADAMBARI SAHU
//////////////////////////////////////
PGraphics p;
float i=0;
int g=0;
void setup()
{
  size(800,800);
  background(255);
  p = createGraphics(4000, 4000, P2D);
  frameRate(100);
}

void draw()
{
  fill(255);
  rect(0,0,width,height);
  p.beginDraw();
  p.noStroke();
  if(i<= 3000)
  {
    float m = map(i, 0,3500, 30, 255 );
    p.fill(0,255-m,m);

    p.smooth();
    p.translate(width/2, height/2);
    p.rotate(i*radians(137.5));
    p.stroke(m,255-m,0,90);
    p.rect(0,7*sqrt(i),10,10);
    i=i+1;
    p.noStroke(); 

    println(i);
  }
  p.endDraw(); 
  translate(width/2,height/2);
  rotate(radians(g));
  imageMode(CENTER);

  image(p,1600,1600);
  g+=1;
}


