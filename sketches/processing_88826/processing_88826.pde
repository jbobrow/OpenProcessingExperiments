
float seed = 0;
float x, y, z;
 
int numAssets = 2000;
 
int startX = 200;
int startY = 300;
int spacingX = 2;
int spacingY = 2;
int gridCols = 126;
 
PVector[] gridPos;
 
void setup(){
    size(640, 640, OPENGL);
    background(#000000);
 
    gridPos = new PVector[numAssets];
 
    for (int i = 0; i<numAssets; i++){
        int row = floor ( i/gridCols );
        int col = i % gridCols;
         
        x = startX + (col * spacingX);
        y = startY + (row * spacingY);
 
        PVector pt = new PVector();
        pt.x = x;
        pt.y = y;
        gridPos[i] = pt;
    }
}
 
void draw(){
    background(#000000);
         
    for (int i = 0; i<numAssets; i++){
        PVector pt = gridPos[i];
 
        // float z = pt.z + noise( (pt.x + seed ) * 0.001, (pt.y + seed ) * 0.01, (pt.z + seed )* 0.009) * 640;
        // float z = pt.z + noise( (pt.x + seed ) * 0.01, (pt.y + seed ) * 0.01, (pt.z + seed )* 0.009) * 640;
        float z = pt.z + noise( (pt.x + seed ) * 0.01, (pt.y + seed ) * 0.03, (pt.z + seed )* 0.001) * 900;
 
        stroke(
            (width/2) - (pt.y - z / 2),
            (width/2) - (pt.x - z / 2),
            (width/2) - (z / 2),
            255 );
        noFill();
 
        point(pt.x, pt.y, z);
    }
    seed++;
}
