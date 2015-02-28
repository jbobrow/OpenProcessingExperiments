
/*Original code created by Felix Woitzel found at http://www.openprocessing.org/sketch/7919*/
/*Code adapted by Anne Marie Hood, YSDN Interactivity 2, Project 3*/
public static int MAX_GRID_WIDTH = 184;
public static int MAX_GRID_HEIGHT = 148;
 
WarpGrid itsWarpGrid;
PImage img;
 
void setup() {
    size(600, 400);
 
    itsWarpGrid = new WarpGrid(width, height, 16, 16);
    img = loadImage("ball.jpg");
 
    noCursor();
 
}
 
public void draw() {
    applyWarp();
}
 
/**
 * applies the warp on the previous frame, then draws the warped image back
 * to the applet's canvas
 */
private void applyWarp() {
    itsWarpGrid.update();
    img.loadPixels();
    itsWarpGrid.applyWarp(img.pixels);
    background(itsWarpGrid.bufferImage);
}
 
 
public class VectorType {
    float x, y;
 
    public VectorType() {
        x = 0;
        y = 0;
    }
 
    public VectorType(float x, float y) {
        this.x = x;
        this.y = y;
    }
 
    public VectorType(VectorType v) {
        x = v.x;
        y = v.y;
    }
 
    public VectorType add(VectorType vector) {
        x += vector.x;
        y += vector.y;
 
        return this;
    }
 
    public VectorType sub(VectorType vector) {
        x -= vector.x;
        y -= vector.y;
 
        return this;
    }
 
    public float distance(VectorType theOtherVector) {
        return sqrt((x - theOtherVector.x) * (x - theOtherVector.x)
                + (y - theOtherVector.y) * (y - theOtherVector.y));
    }
 
}
 
public class WarpGrid {
 
    private PImage bufferImage;
 
    private GridNode[][] nodes = new GridNode[MAX_GRID_WIDTH][MAX_GRID_HEIGHT];
    private int gridWidth = 51;
    private int gridHeight = 51;
    private float cellWidth;
    private float cellHeight;
    private float cellWidthInverse;
    private float cellHeightInverse;
    private float gridWithInverse;
    private float gridHeightInverse;
 
    private float diffuseFactor = 0.1f;
 
    private float dt = 0.015f;
 
    private GridNode[][] buffer = new GridNode[MAX_GRID_WIDTH][MAX_GRID_HEIGHT];
 
    public WarpGrid(int imageWidth, int imageHeight, int gridWidth,
            int gridHeight) {
        bufferImage = new PImage(imageWidth, imageHeight);
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
 
        initGrid();
    }
 
    public GridNode getNode(int x, int y) {
        return nodes[x][y];
    }
 
    private void swapBuffer() {
        GridNode[][] grid = nodes;
        nodes = buffer;
        buffer = grid;
    }
 
    private void initGrid() {
 
        for (int x = 0; x < gridWidth; x++) {
            for (int y = 0; y < gridHeight; y++) {
                GridNode node = new GridNode(this);
                node.x = x;
                node.y = y;
                nodes[x][y] = node;
            }
        }
 
        for (int x = 0; x < gridWidth; x++) {
            for (int y = 0; y < gridHeight; y++) {
                GridNode node = nodes[x][y];
                node.left = nodes[(x != 0) ? x - 1 : gridWidth - 1][y];
                node.right = nodes[(x != gridWidth - 1) ? x + 1 : 0][y];
                node.top = nodes[x][(y != 0) ? y - 1 : gridHeight - 1];
                node.right = nodes[x][(y != gridHeight - 1) ? y + 1 : 0];
            }
        }
 
        initBuffer();
 
    }
 
    private void initBuffer() {
        for (int x = 0; x < gridWidth; x++) {
            for (int y = 0; y < gridHeight; y++) {
                GridNode node = new GridNode(this);
                node.x = x;
                node.y = y;
                buffer[x][y] = node;
 
            }
        }
        for (int x = 0; x < gridWidth; x++) {
            for (int y = 0; y < gridHeight; y++) {
                GridNode node = buffer[x][y];
                node.left = buffer[(x != 0) ? x - 1 : gridWidth - 1][y];
                node.right = buffer[(x != gridWidth - 1) ? x + 1 : 0][y];
                node.top = buffer[x][(y != 0) ? y - 1 : gridHeight - 1];
                node.right = buffer[x][(y != gridHeight - 1) ? y + 1 : 0];
            }
        }
 
    }
 
    private void update() {
        gridWithInverse = 1.0f / (float) (gridWidth - 1);
        gridHeightInverse = 1.0f / (float) (gridHeight - 1);
        cellWidth = (float) bufferImage.width * gridWithInverse;
        cellHeight = (float) bufferImage.height * gridHeightInverse;
        cellWidthInverse = 1.0f / cellWidth;
        cellHeightInverse = 1.0f / cellHeight;
 
        VectorType mouse = new VectorType((float) mouseX, (float) mouseY);
 
        for (int x = 0; x < gridWidth; x++) {
            for (int y = 0; y < gridHeight; y++) {
                GridNode node = nodes[x][y];
                VectorType vector = zoom(node.getPosition(), mouse, 0.98f, 1.0f);
                node.warp = vector;
            }
        }
    }
 
    /**
     * fills the buffer image with a warped version of the image.
     *
     * @param sourcePixels
     */
    private void applyWarp(int[] sourcePixels) {
        for (int x = 0; x < bufferImage.width; x++) {
            for (int y = 0; y < bufferImage.height; y++) {
                VectorType warpedPosition = getWarpedPosition(x, y);
                try {
                    bufferImage.set(x, y, getColor(warpedPosition,
                            sourcePixels));
                } catch (Exception e) {
                    System.out.println("setPixel " + x + ", " + y);
                }
            }
        }
 
    }
 
    /**
     * This method returns the warped pixel coordinate for a coordinate in
     * the differential warp field (in pixels). The resulting vector is
     * calculated by a linear interpolation between the nearest grid node
     * values
     *
     * @param x
     *            horizontal pixel position
     * @param y
     *            vertical pixel position
     * @return the warped pixel position
     */
    public VectorType getWarpedPosition(float x, float y) {
        int gridX = floor(x * cellWidthInverse);
        int gridY = floor(y * cellHeightInverse);
 
        int p0x = nodes[gridX][gridY].getAbsolutePixelX();
        int p0y = nodes[gridX][gridY].getAbsolutePixelY();
 
        float topLeftX = nodes[gridX][gridY].getDifferentialPixelX();
        float topLeftY = nodes[gridX][gridY].getDifferentialPixelY();
 
        float topRightX = nodes[gridX + 1][gridY].getDifferentialPixelX();
        float topRightY = nodes[gridX + 1][gridY].getDifferentialPixelY();
 
        float bottomLeftX = nodes[gridX][gridY + 1].getDifferentialPixelX();
        float bottomLeftY = nodes[gridX][gridY + 1].getDifferentialPixelY();
 
        float bottomRightX = nodes[gridX + 1][gridY + 1]
                .getDifferentialPixelX();
        float bottomRightY = nodes[gridX + 1][gridY + 1]
                .getDifferentialPixelY();
 
        float u = (x - p0x) * cellWidthInverse;
        float v = (y - p0y) * cellHeightInverse;
 
        VectorType warpedPosition = new VectorType();
        warpedPosition.x = interpolate(topLeftX, topRightX, bottomLeftX,
                bottomRightX, u, v);
        warpedPosition.y = interpolate(topLeftY, topRightY, bottomLeftY,
                bottomRightY, u, v);
        ;
        return warpedPosition;
    }
 
    /**
     * @param topLeft
     * @param topRight
     * @param bottomLeft
     * @param bottomRight
     * @param x
     *            horizontal interpolation
     * @param y
     *            vertical interpolation
     * @return lerp in 2D
     */
    public float interpolate(float topLeft, float topRight,
            float bottomLeft, float bottomRight, float x, float y) {
        return lerp(lerp(topLeft, topRight, x), lerp(bottomLeft,
                bottomRight, x), y);
    }
 
    /**
     * @param subPixelPosition
     * @return bilinear filtered color
     */
    public int getColor(VectorType subPixelPosition, int[] sourcePixels) {
        int x = floor(subPixelPosition.x);
        int y = floor(subPixelPosition.y);
        float u = subPixelPosition.x - x;
        float v = subPixelPosition.y - y;
 
        x = x % bufferImage.width;
        y = y % bufferImage.height;
 
        y = constrain(y, 0, bufferImage.height - 4);
        x = constrain(x, 0, bufferImage.width - 4);
 
        int indexTopLeft = x + y * bufferImage.width;
        int indexTopRight = x + 1 + y * bufferImage.width;
        int indexBottomLeft = x + (y + 1) * bufferImage.width;
        int indexBottomRight = x + 1 + (y + 1) * bufferImage.width;
 
        try {
            int col = lerpColor(lerpColor(sourcePixels[indexTopLeft],
                    sourcePixels[indexTopRight], u), lerpColor(
                    sourcePixels[indexBottomLeft],
                    sourcePixels[indexBottomRight], u), v);
            float r = red(col);
            float g = green(col);
            float b = blue(col);
 
            r = constrain(r - 1, 0, 255);
            g = constrain(g - 1, 0, 255);
            b = constrain(b - 1, 0, 255);
 
            return color(r, g, b);
        } catch (Exception e) {
            System.out.println("getBufferColo: " + x + " | " + y);
        }
        return color(1);
    }
 
    private VectorType scale(VectorType position, VectorType center,
            float scale) {
        return scale(position, center, scale, scale);
    }
 
    private VectorType scale(VectorType position, VectorType center,
            float horizontalScale, float verticalScale) {
        VectorType scaleVector = new VectorType();
        scaleVector.x = center.x - position.x;
        scaleVector.y = center.y - position.y;
        scaleVector.x *= horizontalScale;
        scaleVector.y *= verticalScale;
 
        return scaleVector;
    }
 
    private VectorType zoom(VectorType position, VectorType center,
            float logFactor, float zoom) {
        float d = position.distance(center);
 
        VectorType zoomVector = scale(position, center, zoom);
        if (d != 0) {
            zoomVector.x *= pow(logFactor, d);
            zoomVector.y *= pow(logFactor, d);
        }
 
        return zoomVector;
    }
 
    private VectorType rotate(VectorType position, VectorType center,
            float angle) {
        VectorType rotationVector = new VectorType();
        rotationVector.x = position.x - center.x;
        rotationVector.y = position.y - center.y;
        float ang = atan2(rotationVector.x, rotationVector.y) + angle;
        float d = sqrt(rotationVector.x * rotationVector.x
                + rotationVector.y * rotationVector.y);
        VectorType rotatedPosition = new VectorType(center);
        rotatedPosition.x += sin(ang) * d;
        rotatedPosition.y += cos(ang) * d;
        return rotatedPosition.sub(position);
    }
 
}
 
public class GridNode {
    GridNode top, bottom, left, right;
    WarpGrid parent;
    int x, y;
 
    float pressure = 0;
 
    VectorType warp = new VectorType();
 
    public GridNode(WarpGrid parent) {
        this.parent = parent;
    }
 
    public int getAbsolutePixelX() {
        return floor(parent.bufferImage.width * getNormalizedX());
    }
 
    public VectorType getPosition() {
        return new VectorType(getAbsolutePixelX(), getAbsolutePixelY());
    }
 
    public int getAbsolutePixelY() {
        return floor(parent.bufferImage.height * getNormalizedY());
    }
 
    public float getDifferentialPixelX() {
        return getAbsolutePixelX() + warp.x;
    }
 
    public float getDifferentialPixelY() {
        return getAbsolutePixelY() + warp.y;
    }
 
    public float getNormalizedX() {
        return x * parent.gridWithInverse;
    }
 
    public float getNormalizedY() {
        return y * parent.gridHeightInverse;
    }
}


