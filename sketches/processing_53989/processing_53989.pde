
int a1 = 20;
int b1 = 300;

int a2 = 100;
int b2 = 220;

int a3 = 100;
int b3 = 220;

//CURRENT PHASING
//int a4 = 20;
//int b4 = 300;

//int a5 = 100;
//int b5 = 220;

//IDEAL PHASING?
int a4 = 60;
int b4 = 260;

int a5 = 140;
int b5 = 180;



 
int x1 = 1;
int x2 = 1;
int x3 = -1;
int x4 = 1;
int x5 = 1;




int f1a = 0;
int f1b = 255;
int f2a = 0;
int f2b = 255;
int f3a = 255;
int f3b = 0;
int f4a = 0;
int f4b = 255;
int f5a = 0;
int f5b = 255;




 
void setup(){
     
    size(333,320);
     
    }
               
void draw(){
    smooth();
    background(255);
    frameRate(40);
     
    //circles
        ellipseMode(CENTER);
        
        
        //a1 b1
        fill(f1a);
        ellipse(33,a1,40,40);
        fill(f1b);
        ellipse(33,b1,40,40);
   

        //a2 b2
        fill(f2a);
        ellipse(100,a2,40,40);
        fill(f2b);
        ellipse(100,b2,40,40);
        

        //a3 b3
        fill(f3a);
        ellipse(167,a3,40,40);
        fill(f3b);
        ellipse(167,b3,40,40);
        
        //a4 b4
        fill(f4a);
        ellipse(233,a4,40,40);
        fill(f4b);
        ellipse(233,b4,40,40);
   

        //a5 b5
        fill(f5a);
        ellipse(300,a5,40,40);
        fill(f5b);
        ellipse(300,b5,40,40);
        

     
     line(0,160,333,160);
    //animate
     
        a1+=x1;
        b1-=x1;
        
        a2+=x2;
        b2-=x2;
        
        a3+=x3;
        b3-=x3;
     
        a4+=x4;
        b4-=x4;
        
        a5+=x5;
        b5-=x5;
     
     
    //conditions
     
        if(a1 > 140){
            x1 = x1 * -1;
            f1a = 255;
            f1b = 0;
            }
        if(a1 < 20){
            x1 = x1 * -1;
            f1a = 0;
            f1b = 255;
            }
            
        if(a2 > 140){
            x2 = x2 * -1;
            f2a = 255;
            f2b = 0;
            }
        if(a2 < 20){
            x2 = x2 * -1;
            f2a = 0;
            f2b = 255;
            }
            
        if(a3 > 140){
            x3 = x3 * -1;
            f3a = 255;
            f3b = 0;
            }
        if(a3 < 20){
            x3 = x3 * -1;
            f3a = 0;
            f3b = 255;
            }
            
        if(a4 > 140){
            x4 = x4 * -1;
            f4a = 255;
            f4b = 0;
            }
        if(a4 < 20){
            x4 = x4 * -1;
            f4a = 0;
            f4b = 255;
            }
            
        if(a5 > 140){
            x5 = x5 * -1;
            f5a = 255;
            f5b = 0;
            }
        if(a5 < 20){
            x5 = x5 * -1;
            f5a = 0;
            f5b = 255;
            }
        

     
        

            
   }                                
