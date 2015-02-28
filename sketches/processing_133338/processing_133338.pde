
class Agent {

    PVector position;
    
    float size = 10;
    
    Agent(float x, float y, float z) {
        this.position = new PVector(x,y,z);
    }
    
    void draw () {
        
        pushMatrix();
        
        translate(this.position.x, this.position.y, this.position.z);
        
        box(this.size, this.size, this.size);
        
        popMatrix();
        
    }

}

Agent myAgent;

void setup() {

    size(800, 600);

    myAgent = new Agent(0,0,0);
    
    myAgent.position.x = 0;
    myAgent.position.y = 0;
     myAgent.position.y = 0;

    
}


void draw () {
    
    myAgent.draw();


}
