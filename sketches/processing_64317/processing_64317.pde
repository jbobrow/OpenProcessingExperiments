
    import processing.opengl.*;

    private float a = 0;
    private float f = 1.0f;
    private int x, y;

    public void setup() {
        size(400, 400, OPENGL);
        fill(255,0,0);
    }
    
    public void draw() {
        background(0);
        pushMatrix();
        translate(x, y);
        rotateX(a * f);
        rotateY(a/2 * f);
        rotateZ(a/3 * f);
        box(width/10);
        popMatrix();
        a += 0.1f;
    }

    public void mouseClicked() {
        x = mouseX;
        y = mouseY;
        if(mouseButton == LEFT){
            f += 0.1f;
        }else if(mouseButton == RIGHT){
            f -= 0.1f;
        }
    }


