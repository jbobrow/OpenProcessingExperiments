
// class for the tentacles of the jellyfish
class Tentacles
{
  ArrayList tentacles_body_vertices;

  float centerXT, centerYT; // x and y co-ordinate of the center of the jellyfish for later processing

  // Constructor
  Tentacles()
  {
    tentacles_body_vertices = new ArrayList();
    centerXT =0;
    centerYT =0;
  }
  void render(int M)
  {   
    fill(0,0,255);
    noStroke();
    beginShape(); // render the body of the jellyfish as a shape
    for(int i = 0; i < tentacles_body_vertices.size(); i++) 
    {
      XY_Tentacles xyt = (XY_Tentacles)tentacles_body_vertices.get(i); // get the x and y co-ordinates from the XY_Tentacles class
      vertex(xyt.X_cord_tent/2+M,xyt.Y_cord_tent/2+M);

    }
    endShape(); 
  }
}


