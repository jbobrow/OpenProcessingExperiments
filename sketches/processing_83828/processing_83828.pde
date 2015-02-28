
public class PBvh
{
  public BvhParser parser;  

  public PBvh(String[] data)
  {
    parser = new BvhParser();
    parser.init();
    parser.parse( data );
  }
  
  public void update( int ms )
  {
    parser.moveMsTo( ms );//30-sec loop 
    parser.update();
  }
    float t = 0;
    float n;

  public void draw()
  {
    fill(color(255));
      t = t + 0.1;
      n = noise(t);
    for( BvhBone b : parser.getBones())
    {
      pushMatrix();
      translate(b.absPos.x, b.absPos.y, b.absPos.z);
      fill(255,0,200*n+50,10+80*n);
      noStroke();
      beginShape(TRIANGLE_STRIP);
        vertex(b.absPos.x, b.absPos.z);
        vertex(b.absPos.y, b.absEndPos.y);
        vertex(b.absEndPos.z, b.absPos.x);
        vertex(b.absEndPos.x, b.absPos.x);
        vertex(b.absPos.x, b.absEndPos.y);
        vertex(b.absEndPos.x, b.absEndPos.z);
      endShape();
      popMatrix();
      if (!b.hasChildren())
      {
        pushMatrix();
        translate( b.absEndPos.x, b.absEndPos.y, b.absEndPos.z);
        fill(0,100,200*n,10+80*n);
        beginShape();
        vertex(b.absEndPos.x, b.absEndPos.y);
        vertex(b.absEndPos.y, b.absEndPos.z);
        vertex(b.absEndPos.x, b.absEndPos.z);
        endShape();
        popMatrix();
      }
        
    }
  }
}

