

void setup() {
size(400,400); 
strokeWeight(20);
frameRate(5);
}


int x1=100;
int y1=185;
int x2=300;
int y2=195;
int step=10;

void draw() { 
background(255);

//rosso
stroke(255,0,0);   
point(x1,height/2);
x1=x1+step; 
point(width/2,y1);
y1=y1-step;

//blu
stroke(0,0,255);  
point(x2,height/2);
x2=x2-step;
point(width/2,y2);
y2=y2+step;

    if (x1==190) { 
         step=-10;
        
    }
    
    if (x1<100) { 
         step=10;
    }
    
    if (x2>300) { 
         step=10;
        
    }
    
    if (x2==190) { 
         step=-10;
    }
    
if (y1==10) { 
         step=10;
        
    }
    
    if (y1==185) { 
         step=-10;
    }
    
    if (y2==195) { 
         step=10;
        
    }
    
    if (y2>390) { 
         step=-10;
    }
   }
