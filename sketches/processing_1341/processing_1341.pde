
int BACKGROUND_COLOUR = 245;

//int HEIGHT = 720;
//int WIDTH = 480;
int HEIGHT = 900;
int WIDTH = 500;

int MAX_WEIGHT = 25;
float WEIGHT_RATE = 0.2;

int MAX_SPROUT = 4;
int MIN_SPROUT = 2;

float BRANCH_RATE = 0.005;
int MAX_BRANCHES = 50;

float START_OPACITY = 255;
float MAX_OPACITY = 255;
float OPACITY_RATE = -1.5;

int STROKE_COLOUR = 0;

float WITHER_RATE = 0.001;


class LineSegment {
    PVector start;
    PVector end;

    float weight;
    float opacity;

    LineSegment (PVector origin, PVector destination) {
        start = new PVector(origin.x, origin.y);
        end = new PVector(destination.x, destination.y);
        weight = 1;
        opacity = START_OPACITY;
    }

    LineSegment (PVector origin, float len, float ang) {
        start = new PVector(origin.x, origin.y);
        end = new PVector(cos(ang) * len, sin(ang) * len);
        end.add(start);
        weight = 1;
        opacity = START_OPACITY;
    }

    LineSegment (LineSegment origin, float len, float ang) {
        start = new PVector(origin.end.x, origin.end.y);
        float baseAng = origin.angle();
        end = new PVector(cos(ang + baseAng) * len, sin(ang + baseAng) * len);
        end.add(start);
        weight = 1;
        opacity = START_OPACITY;
    }

    void render () {
        if (opacity > MAX_OPACITY) {
            stroke(STROKE_COLOUR, MAX_OPACITY);
        }
        else {
            stroke(STROKE_COLOUR, opacity);
        }
        strokeWeight(weight);
        line(start.x, start.y, end.x, end.y);
    }

    float angle () {
        PVector p = new PVector(end.x, end.y);
        p.sub(start);
        return atan2(p.y, p.x);
    }

    void updateWeight () {
        weight += WEIGHT_RATE;
        if (weight > MAX_WEIGHT) {
            weight = MAX_WEIGHT;
        }
        if (weight < 1) {
            weight = 1;
        }
    }

    void updateOpacity () {
        opacity += OPACITY_RATE;
        if (opacity < 0) {
            opacity = 0;
        }
    }
}


class CurvyLine {
    ArrayList lineSegments;
    boolean dead;
    
    CurvyLine () {
        dead = false;
        lineSegments = new ArrayList();
        PVector origin = new PVector(HEIGHT/2, WIDTH/2);
        lineSegments.add(new LineSegment (origin, random(MIN_SPROUT, MAX_SPROUT), random(-PI, PI)));
    }
  
    CurvyLine (LineSegment origin, float len, float ang) {
        dead = false;
        lineSegments = new ArrayList();
        lineSegments.add(new LineSegment(origin, len, ang));
    }
  
    LineSegment getSeg (int i) {
        if (i < 0) {
            i += lineSegments.size();
        }
        return (LineSegment) lineSegments.get(i);
    }
  
    void sprout (float len, float ang) {
        if (!dead) {
            lineSegments.add(new LineSegment(getSeg(-1), len, ang));
        }
    }

    CurvyLine branch (float len, float ang) {
        return new CurvyLine(getSeg(-1), len, ang);
    }
  
    void render () {
        for (int i = 0; i < lineSegments.size(); i++) {
            LineSegment seg = getSeg(i);
            seg.render();
            if (!dead) {
                seg.updateWeight();
            }
            seg.updateOpacity();
            if (seg.opacity <= 0) {
                lineSegments.remove(seg);
            }
        }
    }

    void wither () {
        dead = true;
    }

    int size () {
        return lineSegments.size();
    }
}


ArrayList curvyLines;
boolean branching;
boolean wither;

void setup () {
    size(HEIGHT, WIDTH);
    background(BACKGROUND_COLOUR);
    smooth();
    stroke(0);
    strokeJoin(ROUND);
    strokeCap(ROUND);
    curvyLines = new ArrayList();
    curvyLines.add(new CurvyLine());
    branching = true;
    wither = false;

    // Create MovieMaker object with size, filename,
    // compression codec and quality, framerate
    /*
    mm = new MovieMaker(this, HEIGHT, WIDTH, "drawing.mov",
                        30, MovieMaker.H263, MovieMaker.BEST);
    */
}

void draw () {
    if (keyPressed) {
        wither = true;
    }
    background(BACKGROUND_COLOUR);
    if (curvyLines.size() == 0) {
        noLoop();
        return;
    }
    for (int i = 0; i < curvyLines.size(); i++) {
        CurvyLine curvyLine = (CurvyLine) curvyLines.get(i);
        if (curvyLine.size() == 0) {
            curvyLines.remove(curvyLine);
            continue;
        }
        branching = branching && (curvyLines.size() < MAX_BRANCHES);
            if (branching 
                && (random(0, 1) <= BRANCH_RATE)
                && (!curvyLine.dead)) {
                curvyLines.add(curvyLine.branch(random(MIN_SPROUT, MAX_SPROUT), random(-HALF_PI, HALF_PI)));
            }
        if (wither || (random(0, 1) <= WITHER_RATE)) {
            curvyLine.wither();
        }
        else {
            curvyLine.sprout(random(MIN_SPROUT, MAX_SPROUT), random(-PI/4, PI/4));
        }
        curvyLine.render();
    }
}

