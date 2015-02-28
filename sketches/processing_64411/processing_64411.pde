

import peasy.PeasyCam;

import wblut.hemesh.core.HE_Selection;
import wblut.hemesh.core.HE_Mesh;
import wblut.hemesh.creators.HEC_Grid;
import wblut.hemesh.modifiers.HEM_Extrude;
import wblut.hemesh.subdividors.HES_CatmullClark;
import wblut.core.processing.WB_Render;

PeasyCam cam;
WB_Render renderer;

int mapWidth = 20;
int brick_edge = 10;
int max_height = 10;

float values[][] = new float[mapWidth][mapWidth];

PGraphics heightMap;

HE_Mesh mesh;


void setup() {
  size(600, 500, P3D); 

  cam = new PeasyCam(this, 100);
  renderer = new WB_Render(this);

  getHeightMap();

  getMesh();
}

void getHeightMap() {

  // initialize PGraphics object
  heightMap = createGraphics(mapWidth, mapWidth, P2D);

  // perlin vars
  float increment = 0.2;
  float xoff=0, yoff=0, noiseval;

  // for each map elements
  for (int i=0; i<mapWidth; i++) {
    xoff += increment;
    yoff = 0;
    for (int j=0; j<mapWidth; j++) {
      yoff += increment;

      // fill values with perlin noise
      noiseval = noise(xoff, yoff);
      values[i][j] = noiseval * max_height;
      heightMap.pixels[i+j*mapWidth] = color(noiseval * 255);
    }
  }
}

void getMesh() {
  
  // init HE_Mesh elements
  mesh = new HE_Mesh();
  HEC_Grid creator = new HEC_Grid(mapWidth, mapWidth, brick_edge*mapWidth, brick_edge*mapWidth);
  HE_Mesh grid = creator.create();
  HEM_Extrude extruder = new HEM_Extrude();
  HE_Selection selection = new HE_Selection(grid);
  
  mesh.add(grid);
  
  // proceed in layers.
  for (int level = 0; level < max_height; level++) {
    selection.clear();
    extruder.setDistance(level);

    // for each grid element
    for (int i = 0; i < mapWidth; i++) {
      for (int j = 0; j < mapWidth; j++) {
        
        // if the element's height touch the level
        if (level <= values[i][j]) {
          int elem = j*mapWidth + i;
          // include in selection
          selection.add(grid.getFacesAsList().get(elem));
        }
      }
    }

    mesh.add(extruder.apply(selection));
  }
  
  HES_CatmullClark s = new HES_CatmullClark().setKeepEdges(true).setKeepBoundary(true);
  mesh.subdivide(s,1);
}

void draw() {
  background(250);
  
  lights();
  fill(100, 100);
  stroke(120, 100);
  renderer.drawFaces(mesh);
  
  cam.beginHUD();
  scale(4);
  image(heightMap, 10, 10); 
  cam.endHUD();

}


