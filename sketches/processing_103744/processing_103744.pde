
int levelsMin = 1;
    int levelsMax = 4;
    float initialLength = 80;

    int pointColor = color(27, 25, 9);
    
    String recursiveSierpinski(int levels, String sentence) {   //prepare rules for the turtle graphics
//      http://en.wikipedia.org/wiki/L-system
//      variables : A B
//      constants : + -
//      start  : A
//      rules  : (A -> B-A-B), (B -> A+B+A)

        String next = "";
        if (levels > 0) { // check if there are any levels left to render
            char[] characters = sentence.toCharArray();
            for (char c : characters) {
                switch (c) {    //interprets the rules derived from the nature
                case 'A':
                    next+=recursiveSierpinski(levels-1, "B-A-B");
                    break;
                case 'B': 
                    next+=recursiveSierpinski(levels-1, "A+B+A");
                    break;
                default:
                    next+=String.fromCharCode(c);
                    break;
                }
            }
            
        }else{
            next=sentence;
        }
        return next;
        
    }
    
    void drawSierpinski(float length, String sentence){ //draw turtle graphics
//      http://en.wikipedia.org/wiki/L-system
//      variables : A B
//      constants : + -
//      start  : A
//      angle  : 60°
//      Here, A and B both mean "draw forward", + means "turn left by angle", 
//      and - means "turn right by angle" (see turtle graphics). 
//      The angle changes sign at each iteration so that the base of 
//      the triangular shapes are always in the bottom 
//      (otherwise the bases would alternate between top and bottom).
            float angle = PI/3;
            char[] characters = sentence.toCharArray();
            for (char c : characters) {
                switch (c) {    //interprets the rules derived from the nature
                case '-':
                    rotate(angle);
                    break;
                case '+':
                    rotate(-angle);
                    break;
                case 'A':
                    line(0, 0, length, 0); // draw line "forwards"
                    translate(length,0); // move the origin to the branch end
                    break;
                case 'B': 
                    line(0, 0, length, 0); // draw line "forwards"
                    translate(length,0); // move the origin to the branch end
                    break;
                }
            }
    }
    

    public void setup() {
        size(855, 740, P2D);
        stroke(pointColor);
        strokeWeight(3);
    }

    public void draw() {
        background(color(245, 247, 232));

        int currentLevels = (int) map(mouseY, height-10, 10, levelsMin, levelsMax); // mouse control of the generations count

        pushMatrix(); // save the world transformation matrix
        translate(0,height); // move the origin to the middle / bottom
        String rules = recursiveSierpinski(currentLevels*2, "A");
        drawSierpinski (initialLength/((currentLevels*currentLevels)*1.5f),rules);
        popMatrix(); // return to the world coordinate system
    }
