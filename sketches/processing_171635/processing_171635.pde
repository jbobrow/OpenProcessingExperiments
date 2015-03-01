
// Doug Blase

// Other commands not shown in on-screen text:
// RIGHT-CLICK: remove the cluster overlay to see the original picture.
// pressing the 'c' key: perform clusters until completion.

int numberOfClusters = 5; // Max = 9


Cluster clusters[];
PImage picture;
boolean stillNeedToCluster = true;
ArrayList<Pixel> image;
boolean enlargeCenters = true;
color clusterColors [] = { 
  color(8, 140, 203, 100), color(0, 0, 255, 100), color(31, 204, 255, 100), 
  color(255, 31, 244, 100), color(31, 255, 118, 100), color(255,141,0),
  color(125, 101, 134), color(0, 255, 180), color(73, 155, 154)
};
int clustersPerformed = 0;
String instructionText;

void setup() {
  picture = loadImage("ginger.jpg");
  image  = new ArrayList<Pixel>();
  initializePictureData();
  prepareClusters();
  assignClusterCenters();
  size(400, 300 + 20);
  instructionText = "Left click to cluster";
}

void initializePictureData() {
  for (int i = 0; i < picture.width * picture.height; i++) {
    image.add(new Pixel(picture.pixels[i], i));
  }
}

void prepareClusters() {
  clusters = new Cluster[numberOfClusters];
  for (int i = 0; i < numberOfClusters; i++) {
    clusters[i] = new Cluster();
  }
}

void assignClusterCenters() {
  for (int i = 0; i < numberOfClusters; i++) {
    clusters[i].setCenter(image.get(int(random(0, picture.width * picture.height))));
  }
}

float getBrightness(color srcColor) {
  return sqrt( .299 * sq((srcColor >> 16) &0xFF) + .587 * 
    sq((srcColor >> 8) & 0xFF) + .114 * sq(srcColor & 0xFF));
  //return red(srcColor);
}

void draw() {
  background(0);
  image(picture, 0, 0);
  displayClusters();
  textSize(18);
  fill(255);
  text("Clusters performed " + clustersPerformed, 0, height - 2);
  text(instructionText, width /2, height - 2);
  //noLoop();
}

void displayClusters() {
  int pixelX, pixelY;
  for (int i = 0; i < numberOfClusters; i++) {
    stroke(255);
    fill(clusterColors[i]);
    pixelY = clusters[i].getCenter().getId() / width;
    pixelX = clusters[i].getCenter().getId() % width;
    ellipse(pixelX, pixelY, 10, 10);
    stroke(clusterColors[i]);
    for (Pixel p: clusters[i].getPixels()) {
      pixelY = p.getId() / width;
      pixelX = p.getId() % width;
      if (enlargeCenters)
        ellipse(pixelX, pixelY, .5, .5);
    }
  }
}

void performCluster() {
  // Unassign each pixel from the cluster
  for (Cluster c: clusters)
    c.getPixels().clear();
  // Determine the most similar cluster based on the pixel's brightness.
  for (Pixel p: image) {
    Cluster mostSimilar = clusters[0];
    for (Cluster c: clusters) {
      if (abs(getBrightness(p.getPixelData()) - getBrightness(mostSimilar.getCenter().getPixelData())) > 
        abs(getBrightness(p.getPixelData()) - getBrightness(c.getCenter().getPixelData()))) {
        p.setCluster(c);
        mostSimilar = c;
      }
    }
    mostSimilar.addPixel(p);
  }
  clustersPerformed++;
  instructionText = "Press 'e' to evaluate.";
}

void evaluateClusters() {
  long sum = 0;
  stillNeedToCluster = false;
  for (Cluster c: clusters) {
    sum = 0;
    int centerColor = int(getBrightness(c.getCenter().getPixelData()));
    for (Pixel p: c.getPixels())
      sum += int(getBrightness(p.getPixelData()));
    int average = int(sum /c.getPixels().size());
    if (average != centerColor) {
      // The cluster center was not a good choice for the final cluster...
      stillNeedToCluster = true;
      for (Pixel p: c.getPixels()) {
        int brightness = int(getBrightness(p.getPixelData()));
        if (brightness == average) {
          c.setCenter(p);
          break;
        }
      }
    }
  }
  instructionText = stillNeedToCluster ? "Left click to cluster" : 
  "Clustering complete";
}

void mouseClicked() {
  //loop();
  if (mouseButton == RIGHT) {
    enlargeCenters = !enlargeCenters;
  }
  else if (stillNeedToCluster) performCluster();
}

void keyPressed() {
  if (key == 'e') {
    evaluateClusters();
  }
  if (key == 'c') {
     while (stillNeedToCluster) {
        performCluster();
        evaluateClusters();
     } 
  }
}

import java.util.ArrayList;

/**
 * @author Doug Blase
 *
 */
public class Cluster {

  private ArrayList<Pixel> pixels;
  private Pixel center;

  public Cluster() {
    pixels = new ArrayList<Pixel>();
  }


  /**
   * @return the pixels
   */
  public ArrayList<Pixel> getPixels() {
    return pixels;
  }

  /**
   * @param pixels
   *            the pixels to set
   */
  public void setPixels(ArrayList<Pixel> pixels) {
    this.pixels = pixels;
  }

  /**
   * @return the center
   */
  public Pixel getCenter() {
    return center;
  }

  /**
   * @param center
   *            The Pixel that will act as the center of this cluster.
   */
  public void setCenter(Pixel center) {
    this.center = center;
  }
  
  /**
   * @param p
   *            the pixel to be added to this cluster.
   */
  public void addPixel(Pixel p) {
     this.pixels.add(p); 
  }
}

/**
 * @author Doug Blase
 *
 */
public class Pixel {
  private int pixelData;
  private Cluster cluster;
  private int id;

  /**
   * @param pixelData
   * @param id
   */
  public Pixel(int pixelData, int id) {
    this.pixelData = pixelData;
    this.id = id;
  }

  /**
   * @return the id
   */
  public int getId() {
    return id;
  }

  /**
   * @param id the id to set
   */
  public void setId(int id) {
    this.id = id;
  }

  /**
   * @return the pixelData
   */
  public int getPixelData() {
    return pixelData;
  }

  /**
   * @param pixelData
   *            the pixelData to set
   */
  public void setPixelData(int pixelData) {
    this.pixelData = pixelData;
  }

  /**
   * @return the red component of this Pixel.
   */
  public int getRed() {
    return pixelData >> 16 & 0xFF;
  }

  /**
   * @return the green component of this Pixel.
   */
  public int getGreen() {
    return pixelData >> 8 & 0xFF;
  }

  /**
   * @return the blue component of this Pixel.
   */
  public int getBlue() {
    return pixelData & 0xFF;
  }

  /**
   * @return the cluster
   */
  public Cluster getCluster() {
    return cluster;
  }

  /**
   * @param cluster
   *            the cluster to set
   */
  public void setCluster(Cluster cluster) {
    this.cluster = cluster;
  }
}



