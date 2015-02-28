
final boolean MODE_DRAW  = true;
final boolean MODE_ERASE = false;
boolean mode = MODE_ERASE;

final float BRUSH_RADIUS_STEP = 2;
final float MIN_BRUSH_RADIUS  = 4;
final float MAX_BRUSH_RADIUS = 128;
float brushRadius = 8;

QuadNode quadRoot;

void setup()
{
    size(512, 512);
    noSmooth();
    rectMode(CORNERS);
    ellipseMode(RADIUS);
    
    quadRoot = new QuadNode(0, 0, width);
    quadRoot.setVisible();
}

void draw()
{
    background(#A01D65);
    drawQuadNode(quadRoot);
    
    stroke(#FFFFFF);
    noFill();
    ellipse(mouseX, mouseY, brushRadius, brushRadius);
    line(mouseX - 0.5 * brushRadius, mouseY, mouseX + 0.5 * brushRadius, mouseY);
    if (mode == MODE_DRAW)
       line(mouseX, mouseY - 0.5 * brushRadius, mouseX, mouseY + 0.5 * brushRadius);
}

void drawQuadNode(QuadNode quadNode)
{
    switch(quadNode.getVisibility())
    {
    case QuadNode.VISIBILITY_COMPLETE:
        Rect bounds = quadNode.getBounds();
        if (QuadNode.drawBorders)
            stroke(#A01D65);
        else
            noStroke();
        fill(lerpColor(#FA1961, #D9E3FC, log(bounds.getWidth()) / log(width)));
        rect(bounds.l, bounds.t, bounds.r, bounds.b);
        break;
        
    case QuadNode.VISIBILITY_PARTIAL:
        drawQuadNode(quadNode.getChild(0));
        drawQuadNode(quadNode.getChild(1));
        drawQuadNode(quadNode.getChild(2));
        drawQuadNode(quadNode.getChild(3));
        break;
    }
}

void mouseDragged()
{
    mouseClicked();
}

void mouseClicked()
{
    PVector mousePos = new PVector(mouseX, mouseY);
    if(mode == MODE_ERASE)
        quadRoot.subtractCircle(mousePos, brushRadius);
    else
        quadRoot.addCircle(mousePos, brushRadius);
}

void keyPressed()
{
    switch(key)
    {
    case ' ':
        mode = !mode;
        break;
         
    case '+':
    case '=':
        brushRadius = min(MAX_BRUSH_RADIUS, max(MIN_BRUSH_RADIUS, brushRadius + BRUSH_RADIUS_STEP));
        break;
         
    case '-':
        brushRadius = min(MAX_BRUSH_RADIUS, max(MIN_BRUSH_RADIUS, brushRadius - BRUSH_RADIUS_STEP));
        break;
         
    case 'r':
        quadRoot.setVisible();
        break;
         
    case 'b':
        QuadNode.drawBorders = !QuadNode.drawBorders;
    }
}
public static class QuadNode
{
    public static final int VISIBILITY_COMPLETE = 0;
    public static final int VISIBILITY_PARTIAL = 1;
    public static final int VISIBILITY_NONE = 2;
    
    public static boolean drawBorders = true;
    
    private QuadNode[] children;
    private Rect bounds;
    private int visibility = VISIBILITY_NONE;
    
    public QuadNode(float l, float t, int s)
    {
       this.bounds = new Rect(l, t, l + s, t + s);
       
       if(s > 2)
       {
          s /= 2;
          children = new QuadNode[4];
          
          children[0] = new QuadNode(l    , t    , s);
          children[1] = new QuadNode(l + s, t    , s);
          children[2] = new QuadNode(l + s, t + s, s);
          children[3] = new QuadNode(l    , t + s, s);
       }
       else children = null;
    }
    
    public Rect getBounds()
    {
       return new Rect(bounds.l, bounds.t, bounds.r, bounds.b);
    }
    
    public int getVisibility()
    {
       return visibility;
    }
    
    public void setVisible()
    {
       visibility = VISIBILITY_COMPLETE;
    }
    
    public QuadNode getChild(int i)
    {
       return children[i];
    }
    
    void subtractCircle(PVector center, float radius)
    {
        if (visibility == VISIBILITY_NONE) return;
       
        switch(bounds.intersectCircle(center, radius))
        {
        case Rect.INTERSECTION_INSIDE:
            visibility = VISIBILITY_NONE;
            break;
         
        case Rect.INTERSECTION_PARTIAL:
        case Rect.INTERSECTION_CONTAINS:
            if (children == null) visibility = VISIBILITY_NONE;
            else
            {
                if (visibility == VISIBILITY_COMPLETE)
                {
                    children[0].visibility = VISIBILITY_COMPLETE;
                    children[1].visibility = VISIBILITY_COMPLETE;
                    children[2].visibility = VISIBILITY_COMPLETE;
                    children[3].visibility = VISIBILITY_COMPLETE;
                }
                
                children[0].subtractCircle(center, radius);
                children[1].subtractCircle(center, radius);
                children[2].subtractCircle(center, radius);
                children[3].subtractCircle(center, radius);
                
                visibility = VISIBILITY_PARTIAL;
            }
            break;
        }
    }
    
    void addCircle(PVector center, float radius)
    {
        if (visibility == VISIBILITY_COMPLETE) return;
       
        switch(bounds.intersectCircle(center, radius))
        {
        case Rect.INTERSECTION_INSIDE:
            visibility = VISIBILITY_COMPLETE;
            break;
          
        case Rect.INTERSECTION_PARTIAL:
        case Rect.INTERSECTION_CONTAINS:
            if(children == null) visibility = VISIBILITY_COMPLETE;
            else
            {
                if (visibility == VISIBILITY_NONE)
                {
                    children[0].visibility = VISIBILITY_NONE;
                    children[1].visibility = VISIBILITY_NONE;
                    children[2].visibility = VISIBILITY_NONE;
                    children[3].visibility = VISIBILITY_NONE;
                }
               
                children[0].addCircle(center, radius);
                children[1].addCircle(center, radius);
                children[2].addCircle(center, radius);
                children[3].addCircle(center, radius);
                
                if (
                        children[0].visibility == VISIBILITY_COMPLETE
                    &&  children[1].visibility == VISIBILITY_COMPLETE
                    &&  children[2].visibility == VISIBILITY_COMPLETE
                    &&  children[3].visibility == VISIBILITY_COMPLETE
                )
                    visibility = VISIBILITY_COMPLETE;
                else
                    visibility = VISIBILITY_PARTIAL;
            }
            break;
        }
    }
}
public static class Rect
{
    public static final int INTERSECTION_INSIDE = 0;
    public static final int INTERSECTION_OUTSIDE = 1;
    public static final int INTERSECTION_CONTAINS = 2;
    public static final int INTERSECTION_PARTIAL = 3;
    
    public float l;
    public float t;
    public float r;
    public float b;
    
    public int intersectCircle(PVector center, float radius)
    {
        final float radiusSq = sq(radius);
        
        if (
                sq(l - center.x) + sq(t - center.y) < radiusSq
            &&  sq(l - center.x) + sq(b - center.y) < radiusSq
            &&  sq(r - center.x) + sq(t - center.y) < radiusSq
            &&  sq(r - center.x) + sq(b - center.y) < radiusSq
        )
            return INTERSECTION_INSIDE;
      
        if (
                distToHorSegmentSq(center, l, r, t) < radiusSq
            ||  distToHorSegmentSq(center, l, r, b) < radiusSq
            ||  distToVerSegmentSq(center, t, b, l) < radiusSq
            ||  distToVerSegmentSq(center, t, b, r) < radiusSq
        )
            return INTERSECTION_PARTIAL;
        
        if(center.x < l || center.x > r || center.y < t || center.y > b)
            return INTERSECTION_OUTSIDE;
      
        return INTERSECTION_CONTAINS;
    }
    
    Rect()
    {
        // Do nothing.
    }
     
    Rect(float l, float t, float r, float b)
    {
        this.l = l;
        this.t = t;
        this.r = r;
        this.b = b;
    }
   
    float getWidth()
    {
        return r - l;
    }
   
    float getHeight()
    {
        return b - t;
    }
   
    private float distToHorSegmentSq(PVector p, float xBeg, float xEnd, float y)
    {
        if(p.x < xBeg) return sq(p.x - xBeg) + sq(p.y - y);
        if(p.x > xEnd) return sq(p.x - xEnd) + sq(p.y - y);
        return sq(p.y - y);
    }
    
    private float distToVerSegmentSq(PVector p, float yBeg, float yEnd, float x)
    {
        if(p.y < yBeg) return sq(p.x - x) + sq(p.y - yBeg);
        if(p.y > yEnd) return sq(p.x - x) + sq(p.y - yEnd);
        return sq(p.x - x);
    }
};


