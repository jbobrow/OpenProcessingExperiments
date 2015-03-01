
ArrayList<ArrayList<Particle>> particles; //2D ArrayList containing the particles
int space; //Space between the particles
int canvasSize; //Size of the canvas, assuming square canvas

void setup() {
    size(800, 800);
    background(20);
    
    particles = new ArrayList();
    space = 40;
    canvasSize = max(width, height);
    
    //Create particles
    for (int i = -2 * space ; i <= canvasSize + space; i += space) {
        ArrayList<Particle> pList = new ArrayList();
        for (int j = -2 * space ; j <= canvasSize + space; j += space) {
            pList.add(new Particle(i, j));
        }
        particles.add(pList);
    }
    
    //Direction vectors of the neighbours
    //Using only the left, top and top right neighbour to avoid double or crossing lines
    var xArray = [-1, 0, 1];
    var yArray = [0, -1, -1];

    for (int i = 0; i < particles.size(); i++){
        ArrayList<Particle> pList = particles.get(i);
        for (int j = 0; j < pList.size(); j++) {
            Particle p = particles.get(i).get(j);
            
            //Iterate through neighbours
            for (int k = 0; k < min(xArray.length, yArray.length); k++) {
                int x = i - xArray[k];
                int y = j - yArray[k];
                
                //Set neighbour if it exists
                if (x > 0 && y > 0 && x < particles.size() && y < pList.size()) {
                    p.neighbours.add(particles.get(x).get(y));
                }
            }
        }
    }
} 

void draw() {
    background(20);
    
    //Iterate through particles and update them
    for (ArrayList pList : particles) {
        for (Particle p : pList) {
            p.update();
            
            //Draw connections between neighbours
            for (int i = 0; i < p.neighbours.size(); i++) {
                Particle n = p.neighbours.get(i);
            
                //Set some value between 0 and 255 depending the x and y position of the line
                int c1 = ((p.x + n.x / 2) / canvasSize) * 255;
                int c2 = ((p.y + n.y / 2) / canvasSize) * 255;
 
                //Draw the connection
                stroke(color(255, c1, c2));
                strokeWeight(1.0f);
                line(p.x, p.y, n.x, n.y);
            }
        }
    }
}
public class Particle {
    float cx, cy; //Center position
    float x, y; //Current position
    float rx, ry; //Radii
    float rT; //Time in ms to complete one revolution
    float size; //Size of the particle, doesn't matter unless you draw it
    
    ArrayList<Particle> neighbours; //Contains left, top and top right neighbour if existent
    
    public Particle(float x, float y) {
        this.cx = x;
        this.cy = y;
        
        this.size = 2;
        
        this.rx = 15;
        this.ry = this.rx;
        
        this.rT = 500;
        
        this.neighbours = new ArrayList();
    }
    
    public void update() {
        float t = millis()/rT;
        
        //Shift the period depending on the postion
        t+= (cx/100)*PI + (cy/100)*PI;
        
        x = (int)(cx + rx * cos(t));
        y = (int)(cy + ry * sin(t));
    }
    
    public void draw() {
        //Draw the track of the particle
        noFill();
        stroke(255, 20);
        ellipse(cx, cy, rx*2, ry*2);

        //Draw the actual particle
        noStroke();
        fill(200);
        ellipse(x, y, size, size);
    }
}
