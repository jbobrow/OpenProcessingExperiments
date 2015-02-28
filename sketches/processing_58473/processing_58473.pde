

int nombre = 500;
PVector[] pos;
PVector[] vel;
int[] tps;


void setup() {
    size(400,700);
      frameRate(24);
     
      
   

    pos = new PVector[nombre];
    vel = new PVector[nombre];
    tps = new int[nombre];

    for(int i = 0; i < nombre; i++) {
        pos[i] = new PVector(0,0);
        if (i < nombre/2) {
            vel[i] = new PVector(random(-width,width), random(-20,20));
            tps[i] = int(random(50,100));
         
        } else {
            vel[i] = new PVector(0,0);
            tps[i] = int(random(0,50));
            
            
        }
    }
}

void draw() {
    background(255);
  //ellipse(random(0,200),random(0,200),random(0,200),random(0,200));
    stroke(100,100,100);
    strokeWeight(4);
    
    
    smooth();
 

    for(int i = 0; i < nombre; i++) {
        point(pos[i].x + width/2, pos[i].y + height);
        //line(pos[i].x + width/2, pos[i].y + height,pos[i].x + width/2+20, pos[i].y + height+20);
    }

    for(int i = 0; i < nombre; i++) {
        pos[i].add( vel[i] );
        tps[i]--;
        if (tps[i] < 0) {
        
             vel[i] = new PVector(random(-10,10), random(-10,10));
            pos[i] = new PVector(0,-350);
            tps[i] = int(random(40,50));
            
     
    }   
    


    }

    
    


}


