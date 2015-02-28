
/***********************************************
/* RecursiveCardioid * Ale, 2013 * Pubic Domain
***********************************************/

Circle seed;

float 
    ang1 = PI/720, ang2 = TWO_PI/360, ang3 = TWO_PI/90, R, F;
int 
    N, halfWidth, halfHeight; 

void setup()
{
    size(800, 800);
    background(#0090ff);
    smooth();
    halfWidth = width/2;
    halfHeight = height/2;
    R = 350f;
    N = 10;
    F = .75;
    seed = new Circle(halfWidth, halfHeight, R, 0, 0, ang2);
    stroke(-1,10);
    seed.addChild(R *= F, PI, PI);
    noFill();
}

void draw()
{
    seed.rotate(ang1);
    seed.display();
}

void mousePressed()
{
    setup(); 
}

class Circle 
{
    float cx, cy, displayAngle, currentAngle, displaySpeed;
    float p1x, p1y, p2x, p2y;
    float r, d, a, parentRadius;
    PVector parentCenter, parentMarker;
    float marker_cx, marker_cy;
    Circle child;
    float st;
 
    Circle (float cx, float cy, float r, float ca, float da, float das) 
    {
        this.cx = cx;
        this.cy = cy;
        this.r = r;
        currentAngle = ca;
        displayAngle = ca+da;
        displaySpeed = das;
        d = 2*r;
        a = 0;
        parentRadius = r;
        parentCenter = new PVector(cx, cy);
        parentMarker = new PVector(halfWidth, halfHeight);
        st = map(r, 0, halfWidth, 0, .2);
        p1x = p2x = p1y = p2y = 0;
    } 
  
    void display ()
    {
        if (child!=null) child.setParentMarker(marker_cx, marker_cy);
        PVector pm = getParentMarker();
        PVector c = getParentCenter();
        line(c.x,c.y,marker_cx, marker_cy);
        line(marker_cx, marker_cy, pm.x, pm.y);
        if (child!=null) child.display();
    }

    void rotate (float theta)
    {
        currentAngle += theta; 
        displayAngle += displaySpeed;
        PVector c = getParentCenter();
        cx = c.x + cos(currentAngle) * (parentRadius - r);
        cy = c.y + sin(currentAngle) * (parentRadius - r);
        marker_cx = cx + (r * cos(displayAngle));
        marker_cy = cy + (r * sin(displayAngle));
        if (child != null) child.rotate(theta);
    }

    void setParentRadius (float newRadius)
    {
        parentRadius = newRadius;
    }
  
    PVector getParentCenter ()
    {
        return parentCenter;
    }
  
    void setParentMarker (float pmx, float pmy)
    {
        parentMarker.x = pmx;
        parentMarker.y = pmy;
    }
  
    PVector getParentMarker ()
    {
        return parentMarker; 
    }
  
    void setParentCenter (PVector newParentCenter)
    {
        parentCenter = newParentCenter;
    }

    void addChild (float childRadius, float childAngle, float childDisplayAngle)
    {
        float newAngle = currentAngle + childAngle,
              child_cx = cx + cos(newAngle) * (r - childRadius),
              child_cy = cy + sin(newAngle) * (r - childRadius);
        child = new Circle (child_cx, child_cy, childRadius, newAngle, childDisplayAngle, random(-ang3, ang3));
        child.setParentRadius(r);
        child.setParentCenter(new PVector(cx, cy));
        if (N-- > 0) child.addChild (R *= F, random(-TWO_PI, TWO_PI), random (-ang2, ang2));
    }
}
