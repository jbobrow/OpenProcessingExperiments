
class Node{
    private float radius;
    private float angle;
    Node(float angle, float radius){
    this.radius = radius;
    this.angle = angle;
    }

    public float getx(){
        return cos(angle) * radius;
    }

    public float gety(){
        return sin(angle) * radius;
    }

    public void inc_radius(){
        radius++;
    }
    
    public void dec_radius(){
        radius--;
    }

    public void locate(){
        colorMode(RGB, 0xff);
        stroke(color(0xff, 0, 0));
        noFill();
        float x = getx();
        float y = gety();
        float locator_width = 4;
        point(x, y);
        ellipse(x, y, locator_width, locator_width);
    }
}
    

Vector polygon;
int [] workers;

final int UP    = 0;
final int DOWN  = 1;
final int LEFT  = 2;
final int RIGHT = 3;

int rand_dir(){
    return (int)random(0, 4);
}

Vector create_poly(float radius, int points){
    Vector polygon = new Vector();
    float step_size = (2 * PI) / points;
    float theta = 0;
    float x, y;
    for(int i = 0; i < points; i++){
        theta += step_size;
        polygon.add(new Node(theta, radius));
    }
    return polygon;

}

void setup(){
    polygon = create_poly(200, 200);
    size(500, 500);
    workers = new int[10];
    for(int i = 0; i < workers.length; i++){
        workers[i] = (int)random(0, polygon.size());
    }
}

void draw_poly(Vector polygon){
    beginShape();
    for(int i = 0; i < polygon.size(); i++){
        Node n = (Node)polygon.elementAt(i);
        vertex(n.getx(), n.gety());        
    }
    endShape();

    for (int i = 0; i < workers.length; i++){
        int current = workers[i]; 
        Node n = (Node)polygon.elementAt(current);
        n.locate();
    }
}

void walk_poly(Vector polygon){
    for (int i = 0; i < workers.length; i++){
        int current = workers[i];
        int dir = rand_dir();
        switch(dir){
            case UP   : ((Node)polygon.elementAt(current)).inc_radius(); break;
            case DOWN : ((Node)polygon.elementAt(current)).dec_radius(); break;
            case LEFT : current--; break;
            case RIGHT: current++; break;
        }
        current = (current < 0) ? polygon.size() - 1 : current % polygon.size();
        workers[i] = current;
    }
    
}

float theta = 0;
void draw(){
//    background(color(0xae,0xae,0xae));
    translate((cos(theta/2) * 30) + 250, (sin(theta/3) * 30) + 250);
    rotate(sin(theta/3));
    colorMode(HSB, 100);
    color c = color(cos(theta/50) * 100, 50, 100);
    color bc = color(sin((theta + PI)/50) * 100, 50, 75);
    background(bc);
    fill(c);
    stroke(c);
    draw_poly(polygon);
    walk_poly(polygon);
    theta+=0.01;
}

// vim: ft=java:sw=4:ts=4:expandtab

