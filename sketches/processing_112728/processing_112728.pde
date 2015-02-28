
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: none");

/**
* HexagonalBZ. Showing up a Belousov-Zhabotinsky reaction onto a hexagonal grid. 
*
*/
  
HexBZ matrix;

void setup()
{
    size(600, 600);
    background(-1);
    colorMode(RGB, 1);
    noStroke();
    noCursor();
    //Create the matrix: canvas dimensions, offset and side of the hexagon
    matrix = new HexBZ(width, height, 0, 10f);
}

void draw()
{
    background(-1);
    matrix.update();
    matrix.draw();
}


/**
* HexBZ
*
* A hexagonal grid composed of cells in a Belousov-Zhabotinsky reaction
*
*/

public class HexBZ {
    
    //A matrix of hexagonal cells, objects of a nested class, with its main parameters
    private int size, 
                 row, 
                 col;
    private BZCell[] cells;
    
    //A flag to control the iteration of the reaction
    private int p = 0, 
                q = 1;
    
    /** 
      Constructor 
    */  
    public HexBZ(int W, int H, int mainOffset, float side)
    {      
        //Caculate the geometric parameters we need to set up the grid
        row = int(((W-mainOffset*2)/side -.5)/1.5);
        
        float horOffset   = side * 1.5,
              verOffset   = side * sqrt(0.75),
              verOffset_2 = verOffset*2;
        
        //Instantiate a hexagon generator for the grid
        RegularPolygonGenerator HEXAGON_GENERATOR = new RegularPolygonGenerator(6, side, 0.);
        
        //Create the grid
        col = floor((H-mainOffset*2)/verOffset_2);
        size = col * row;
        cells = new BZCell[size];
        
        //Populate the grid with beautiful hexagons
        float h, v = mainOffset + verOffset;
        int index;
        for (int r = 0; r < col; r++) { 
            h = mainOffset + side;
            for (int c = 0; c < row; c++) {
                index = r*row+c;
                cells[index] = new BZCell(HEXAGON_GENERATOR.generateAt(h, v+verOffset*(c % 2)));
                cells[index].friends = friends(r, c);
                h += horOffset;
            }
            v += verOffset_2;
        }
    }

    //Given the row and column of a cell, returns the indices of the adjacent hexagons in a toroidal space 
    public int[] friends(int r, int c)
    {
          int c_m1 = (c-1+row) % row, 
              c_p1 = (c+1) % row,
              r_m1 = (r+col-1) % col,
              r_p1 = (r+1) % col;
          if (c % 2 == 0 ) return new int[] { i(r_m1,c), i(r, c_m1), i(r, c_p1), i(r_p1, c_m1), i(r_p1, c_p1), i(r_p1, c) };        
          return new int[] { i(r_m1,c), i(r_m1, c_m1), i(r_m1, c_p1), i(r, c_m1), i(r, c_p1), i(r_p1, c) };
    }
        
    //A helper function to write less code
    private int i(int r, int c) {
        return r*row+c;  
    }
    
    //Draws the cells in the matrix
    void draw() { for (int i=0; i < size; cells[i++].draw());  }
    
    //Updates the matrix following a BZ reaction, as modelled by Alasdair Turner, as stated here:
    // http://eprints.ucl.ac.uk/17241/1/17241.pdf
    void update() 
    {
        BZCell cell;
        for (int i = 0; i < size; i++) {
            cell = cells[i];
            float cA = cell.A[p], 
                  cB = cell.B[p], 
                  cC = cell.C[p];
                
             for (int j = 0; j < 6; j++) {
                 cA += cells[cell.friends[j]].A[p]; 
                 cB += cells[cell.friends[j]].B[p];
                 cC += cells[cell.friends[j]].C[p];
             }
             
          cA /= 7; cB /= 7; cC /= 7;  
          cell.A[q] = constrain(cA*(cB-cC+1), 0, 1);
          cell.B[q] = constrain(cB*(cC-cA+1), 0, 1);
          cell.C[q] = constrain(cC*(cA-cB+1), 0, 1);
      }
      if (p == 0) {p=1; q=0;} else {p=0; q=1;}
    }
  
    public class BZCell 
    {
        private int fillColor = 0;
        private PVector[] vertices;
        private int[] friends; 
        private float[] A = {random(1), 0},
                        B = {random(1), 0}, 
                        C = {random(1), 0};
     
        public BZCell(PVector[] vertices) { this.vertices = vertices; }
       
        public void draw() { 
            fill(A[q]);
            beginShape(); 
            for (int i = 0; i < 6; vertex(vertices[i].x, vertices[i++].y));      
            endShape(CLOSE);
        }  
    }  
}

/**
* RegularPolygonGenerator
*
* A useful datatype for generating regular polygons.
*
*/

public class RegularPolygonGenerator {
 
    private int sides;
    private float referenceAngle, side;
  
    private float[] nX, nY;
  
    //Constructors
    public RegularPolygonGenerator(int s) { this(s, 1f, 0f); }
  
    public RegularPolygonGenerator(int s, float r, float rAngle) 
    {
        if (s <= 0 || r <=0) throw new IllegalArgumentException("Both number of sides and radius must be positive numbers.");
        sides = s;
        float a = TWO_PI/s;
        referenceAngle = rAngle;
        nX = new float[sides];
        nY = new float[sides];
        for (int i = 0; i < s; i++) 
        {
            referenceAngle += a;
            nX[i] = cos(referenceAngle)*r;
            nY[i] = sin(referenceAngle)*r;
        }
        referenceAngle = rAngle;
        side = sqrt( (nY[1]-nY[0]) * (nY[1]-nY[0]) + (nX[1]-nX[0]) * (nX[1]-nX[0]) );
    }

    // Return number of sides
    public int getSides() { return sides; }
    
    //Return the reference angle to the starting vertex of the shape
    public float getAngle() { return referenceAngle; }

    //Return the reference angle to the starting vertex of the shape
    public float getSide() { return side; }

    //Generates a Polygon object as specified at the constructor in a given center
    public PVector[] generateAt(float centerX, float centerY)
    {
        PVector[] v;
        v = new PVector[sides];
        for (int i = 0; i < sides; i++) v[i] = new PVector(centerX + nX[i], centerY + nY[i]);
        return v;   
    }
    
    //Draws the regular polygon specified at the constructor in a given center
    public void drawAt(float centerX, float centerY)
    {
        beginShape();
        for (int i = 0; i < sides; i++) vertex(centerX + nX[i], centerY + nY[i]);
        endShape(CLOSE);
    }
}
