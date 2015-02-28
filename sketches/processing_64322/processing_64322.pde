
    private int dim = 10;

    public void setup() {
        size(400,400);
        smooth();
        colorMode(HSB,360,100,100);
        
        for(int i=0; i<height; i+=dim){
            for(int j=0; j<width; j+=dim){
                rect(i, j, dim, dim);
            }
        }
    }
    
    public void draw() {
        int rndX = (int)random(width/dim);
        int rndY = (int)random(height/dim);
        fill(random(12)*30,100,100);
        rect(dim*rndX, dim*rndY, dim, dim);
    }

