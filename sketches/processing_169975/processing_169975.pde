
/*
by Adriano Parracciani
aka CyberParra
bouncing exercise
*/

void setup() {
size(400,200); 
strokeWeight(20);
frameRate(5);
}

int x1=90; //starting point red ball
int x2=310;//starting point blue ball
int step=10;
int y1=75; //y starting point rect sx
int y2=75; //y starting point rect dx


void draw() { 
background(255);
strokeWeight(1);
stroke(150);

//rects
fill(155);
rect(70,y1,10,50);//rect sx
rect(320,y2,10,50);//rect dx
y1=y1+step;
y2=y2-step;

//balls
strokeWeight(20);
//red
stroke(255,0,0);   
point(x1,height/2);
x1=x1+step; 

//blu
stroke(0,0,255);  
point(x2,height/2);
x2=x2-step;

//position control
if (x1==190) { 
         step=-10;//decrementing steps for red ball
        
    }
    
    if (x1==90) { 
         step=10;
    }
    
    if (x2==310) { 
         step=10;
        
    }
    
    if (x2==110) { //decrementing steps for blue ball
         step=-10;
    }
    
}
    
