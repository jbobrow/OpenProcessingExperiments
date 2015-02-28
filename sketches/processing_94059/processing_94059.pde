
class LineBrush {
    ArrayList allLines;
    int timeToLive = 100;
    
    LineBrush() {
        allLines = new ArrayList();
    }
    
    void addLines(int _x, int _y) {
        allLines.add(new LineParticle(_x, _y));
    }
    
    void draw() {
        for(int i = (allLines.size() - 1); i > 0; i--) {
            LineParticle curr = (LineParticle) allLines.get(i);
            LineParticle pre = (LineParticle) allLines.get(i-1);
            if(curr.live >= timeToLive) {
                allLines.remove(curr);
            }
            else {
                pushMatrix();
                smooth();
                stroke(curr.colour, map((timeToLive-curr.live), 0, 100, 0, 255));
                strokeWeight(curr.thickness);
                line(curr.location.x, curr.location.y, pre.location.x, pre.location.y);
                popMatrix();
                
                curr.live++;
            }
        }
    }
}

class LineParticle {
    PVector location;
    float thickness;
    color colour;
    int live = 0;
    
    LineParticle(int _x, int _y) {
        location = new PVector(_x, _y);
        colour = color(random(255), random(255), random(255));
        thickness = 10;
    }
}



