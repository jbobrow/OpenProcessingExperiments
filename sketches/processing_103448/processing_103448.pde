
class Analyzer {
  
  PVector 
    source, 
    center; 
  float 
    //The range (in pixels) of distance to the source point [5, 10, 15...]. If you select big ranges there will appear glitches in the picture (it's hard to fit so many arcs in a little display).
    range = 5f, 
    //initial radius
    radius = 0f, 
    //maximum radius
    maxRadius = 900f,
    //Width of the arcs 
    sw; 
  PImage image;
  HashMap <Integer, Integer> [] distance_colors;
  
  Analyzer (PImage img, int x, int y) {
    image = img;
    center = new PVector(img.width/2, img.height/2);
    source = new PVector (x, y);
    //The furthest point in the picture will determine the total range of distances to take into account
    //That point will be one of the vertices of the image, so let's look for it
    int[][] vertices = { {0, 0}, {image.width, 0}, {0, image.height}, {image.width, image.height}};
    float maxDist = 0;
    for (int i=0; i < vertices.length; i++) {
      float dis = sqrt ( sq (vertices[i][0] - x) + sq (vertices[i][1] - y) );
      maxDist =  dis > maxDist ? dis : maxDist;
    }
    int maxIndex =  int (maxDist/range);
    distance_colors = new HashMap [maxIndex+1];
    for (int i=0; i<distance_colors.length; distance_colors[i++] = new HashMap <Integer,Integer>());
    //Calculate the strokeweight of the arcs
    sw = (maxRadius-radius) / distance_colors.length;
  }

  void analyze () {
    //Iterate through the pixels of the image
    image.loadPixels();
    int w = image.width;
    for (int i=0; i < image.pixels.length; i++) {
      //Calculate position and distance to source
      PVector pos = new PVector (i%w, i/w);
      float d = pos.dist(source);
      //Calculate position in the array taking into account distance and range
      int ind = int(d/range);
      //Get the color
      int c = image.pixels[i];
      //Populate the hashmap with the gotten color.
      HashMap <Integer, Integer> tmp = distance_colors [ind];
      if (tmp.get(c) != null) {
        tmp.put (c, tmp.get(c)+1);
      } 
      else {
        tmp.put (c, 1);
      }
    }
  }

  //Visualizing method, quite straightforward.
  void visualize () {
    background (-1);
    strokeWeight (sw);   
    //For any range of colors
    for (int i=0; i<distance_colors.length; i++) {
      //Get pixel density to calculate the angles of the arcs
      int pixelsNumber = 0;
      float initialAngle = 0f;     
      for (int c : distance_colors[i].keySet()) {
        pixelsNumber += distance_colors[i].get(c);
      }
      float alfa = TWO_PI/pixelsNumber;
      //Draw the arcs 
      for (int c : distance_colors[i].keySet()) {
        float angle = alfa * distance_colors[i].get(c);
        stroke (c);
        arc (center.x, center.y, radius, radius, initialAngle, initialAngle+=angle);
      } 
      //Increase the radius of the next iteration
      radius += (sw);
    }
  }
}


