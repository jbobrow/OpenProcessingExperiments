
int levelsMin = 3;
    int levelsMax = 10;
    float initialLength = 100;
    
    float angleMin = PI/24;
    float angleMax = PI/6;

    int pointColor = color(27, 25, 9);

   
    void recursiveAlgae(int levels, float length, float angle, String sentence) {
        if (levels > 0) { // check if there are any levels left to render
            char[] characters = sentence.toCharArray();
            for (char c : characters) {
                switch (c) {
                case 'a':
                    pushMatrix(); // save current transformation matrix
                    rotate(angle/2); // rotate new matrix to make it point to the right - adjusted to make the tree upright
                    line(0, 0, 0, -length); // draw line "upwards"
                    pushMatrix(); // save current (e.g. new) matrix
                    translate(0, -length); // move the origin to the branch end
                    scale(0.85f); // scale down. fun fact - it scales down also the stroke weight!
                    recursiveAlgae(levels - 1, length, angle, "ab"); // call the recursive function again
                    popMatrix(); // return to the matrix of the current line
                    popMatrix(); // return to the original matrix
                    break;
                case 'b':
                    pushMatrix(); // save current transformation matrix
                    rotate(-angle*2); // rotate new matrix to make it point to the right - adjusted to make the tree upright
                    line(0, 0, 0, -length); // draw line "upwards"
                    pushMatrix(); // save current (e.g. new) matrix
                    translate(0, -length); // move the origin to the branch end
                    scale(0.85f); // scale down. fun fact - it scales down also the stroke weight!
                    recursiveAlgae(levels - 1, length, angle, "a"); // call the recursive function again
                    popMatrix(); // return to the matrix of the current line
                    popMatrix(); // return to the original matrix
                    break;
                }
            }
        }
    }


    public void setup() {
        size(800, 600, P2D);
        
        stroke(pointColor);
        strokeWeight(3);
    }

    public void draw() {
        background(color(245,247,232));
        
        float currentAngle = map (mouseX, 0, width, angleMin, angleMax); //mouse control of the branch angle
        int currentLevels = (int)map (mouseY, height,0, levelsMin, levelsMax); //mouse control of the generations count
        
        pushMatrix(); //save the world transformation matrix
        translate (width/2, height); //move the origin to the middle / bottom
        recursiveAlgae(currentLevels, initialLength, currentAngle, "a"); // draw first two branches - stems
        popMatrix(); //return to the world coordinate system
    }
