

    int canvasSize = 400;
    ArrayList spList = new ArrayList();
    
    Sphere sp;
    void setup(){
        size(canvasSize,canvasSize);
    }
    void draw(){
        background(255);
        smooth();
        frameRate(60);
        if (mousePressed){
            sp = new Sphere(20, mouseX, mouseY);
            spList.add(spList.size(),sp);
        }
        if(!spList.isEmpty()){
            for(Iterator i = spList.iterator(); i.hasNext();){
                Sphere tmpSp = (Sphere)i.next();
                tmpSp.move();
                tmpSp.display();
            }
            
        }
    }
    
    class Sphere{
        
        float size;
        int X, Y;
        
        Sphere(float tmpSize, int tmpX, int tmpY){
            
            size = tmpSize;
            X = tmpX;
            Y = tmpY;
        }
        
        void display(){
            fill(128);
            noStroke();
            ellipse(X,Y,size,size);
        }
        
        void move(){
            if((int)(canvasSize/2)>X){
                X = X+1;
            } 
            else {
                X = X-1;
            }

            if((int)(canvasSize/2)>Y){
                Y = Y+1;
            } 
            else {
                Y = Y-1;
            }
        }
    }

