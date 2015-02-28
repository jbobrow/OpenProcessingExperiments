
/*
 * This is just a wrapper class for line() function.
 * I don't want to draw the lines as much as I want to remember
 * where they are in the sculpture.
 */
 
class remembered_line {
    float x1, y1, z1, x2, y2, z2;
    
    remembered_line(float x1, float y1, float z1, 
                    float x2, float y2, float z2) {
        this.x1 = x1;
        this.y1 = y1;
        this.z1 = z1;
        this.x2 = x2;
        this.y2 = y2;
        this.z2 = z2;
    }
    
    void draw() {
        line(x1, y1, z1, x2, y2, z2);
    }
}


