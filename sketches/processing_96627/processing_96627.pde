
PVector[] vectors;
 
void setup()
{
    size(400, 400);
    colorMode(HSB, 360);
    vectors = new PVector[30];
    restart();
}
 
public void restart()
{
    for(int k = 0; k < vectors.length; k++)
        vectors[k] = new PVector();
}
 
public void mousePressed()
{
    restart();
}
 
void draw()
{
    //calculate:
    PVector move = new PVector(mouseX - width/2, mouseY - height/2);
    move.mult(pow(.01, vectors.length));
    vectors[vectors.length - 1].add(move);
 
    for(int k = 0; k < vectors.length - 1; k++)
    {
        vectors[k].add(vectors[k + 1]);
        vectors[k].mult(.99);
    }
    //for(int k = 0; k < vectors.length; k++)
      //  vectors[k].mult(.995);
         
    //now draw everything:
    fill(0, 10);
    rect(0, 0, width, height);
    translate(width/2, height/2);
    fill(0, 0, 360);
    ellipse(0, 0, 10, 10);
         
    for(int k = 0; k < vectors.length; k++)
    {
        PVector v = vectors[k];
        int factor = pow(100, k);
        fill((k * 35) % 360, 360, 360);
        ellipse(v.x * factor, v.y * factor, 10, 10);
    }
}

