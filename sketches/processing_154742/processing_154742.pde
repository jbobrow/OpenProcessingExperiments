
class Organ {
    PVector center;
    int size;
    
}


class Amebo {
    PVector center;
    int size;
    int amount;
    ArrayList<PVector> verts;
    ArrayList<Organ> organs;

    
    Amebo(int x, int y, int s) {
        center = new PVector(x, y);
        size = s;
        amount = 8;
        verts = new ArrayList<PVector>;
        organs = new ArrayList<Organ>;
    }

    void init() {
        verts.clear();
        index = 0;
            for (i = 0; i < TWO_PI-.1;i = i+PI/amount) {
                lR = random(100) + size;
                PVector tempV = new PVector(cos(i)*lR+center.x, sin(i)*lR+center.y);
                
                verts.add(tempV);
                index++;
            
            }
    }
    
    void undulate() {
    totX = 0;
    totY = 0;
        for (i = 0; i < verts.size();i++) {
           
            rX = random(10) - random(10);
            rY = random(10) - random(10);
            newX = verts.get(i).x + cos(rX);
            newY = verts.get(i).y + sin(rY);
         
            verts.get(i).x = constrain(newX,0,width);  
            verts.get(i).y = constrain(newY,0,height);
            
            totX = totX + cos(rX);
            totY = totY + sin(rY);
                      
        }
        
        center.x = center.x + totX/verts.size();
        center.y = center.y + totY/verts.size();
    
    }
        
    void display() {
        
        
        beginShape();
        curveVertex(verts.get(0).x,  verts.get(0).y);
        for(i = 0; i < verts.size();i++){
            ellipse(verts.get(i).x, verts.get(i).y,10,10);
            curveVertex(verts.get(i).x,  verts.get(i).y);
        }
        curveVertex(verts.get(verts.size()-1).x,  verts.get(verts.size()-1).y);
        endShape();
        
        for(i = 0; i < verts.size();i++){
            line(center.x, center.y,verts.get(i).x,  verts.get(i).y);
            if(i>1){line(verts.get(i-1).x,  verts.get(i-1).y,verts.get(i).x,  verts.get(i).y);}
            if(i == 0){line(verts.get(i).x,  verts.get(i).y,verts.get(verts.size() -1).x,  verts.get(verts.size() -1).y);}
        }

        ellipse(center.x, center.y, 50,50);
    }


}





width = 500;
height = 500;
size(width, height);
Amebo am;

void setup() { 
am = new Amebo(250,250,100);
am.init();     
 
}

void draw() {  
    
    background(100);
    am.undulate();
    am.display();
   
       
        
    
    
    
}
