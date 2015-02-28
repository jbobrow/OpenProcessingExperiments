
//canvas
growthHormone circle = new growthHormone();
foundation swirl = new foundation();

void setup(){
  background(random(256),random(256),random(256));
  size(400, 400);
  //circle.circulate();
}

void mousePressed(){
  background(random(256),random(256),random(256));
  circle.circulate();
  swirl.shelling(int(random(20)));
}
class foundation{
  foundation(){}
  //int sizeX;
  
  void shelling(int sizeX){  
    fill (47,255,209,100);
    ellipse(198,177,sizeX,sizeX);
    
    fill (73,255,215,100);
    noStroke();
    ellipse(212,191,sizeX+35,sizeX+35);
  
    fill (31,145,20,100);
    noStroke();
    ellipse(245,202,sizeX+50,sizeX+50);
    
    fill (89,214,73,100);
    noStroke();
    ellipse(282,209,sizeX+80,sizeX+80);
    
    fill (3,21,40,100);
    noStroke();
    ellipse(355,177,sizeX+150,sizeX+150);
    
    fill (58,255,212,100);
    noStroke();
    ellipse(168,184,sizeX,sizeX);
    
    fill (73,255,215,100);
    noStroke();
    ellipse(157,194,sizeX+30,sizeX+30);
    
    fill (80,60,255,100);
    noStroke();
    ellipse(146,213,sizeX+45,sizeX+45);
    
    fill (80,60,255,100);
    noStroke();
    ellipse(146,213,sizeX+45,sizeX+45);
    
    fill (129,117,255,100);
    noStroke();
    ellipse(142,250,sizeX+80,sizeX+80);
    
    fill (206,3,123,100);
    noStroke();
    ellipse(165,325,sizeX+150,sizeX+150);
    
    fill (191,1,138,100);
    noStroke();
    ellipse(284,419,sizeX+300,sizeX+300);
    
    fill (20,0,94,100);
    noStroke();
    ellipse(419,68,sizeX+300,sizeX+300);
    
    fill (24,255,204,100);
    noStroke();
    ellipse(163,162,sizeX,sizeX);
    
    fill (64,30,20,100);
    noStroke();
    ellipse(150,152,sizeX+35,sizeX+35);
    
    fill (90,28,12,100);
    noStroke();
    ellipse(128,146,sizeX+50,sizeX+50);
    
    fill (128,43,12,100);
    noStroke();
    ellipse(102,139,sizeX+70,sizeX+70);
    
    fill (229,53,2,100);
    noStroke();
    ellipse(58,135,sizeX+100,sizeX+100);
    
    fill (230,51,0,100);
    noStroke();
    ellipse(11,150,sizeX+150,sizeX+150);
    
    fill (20,255,203,100);
    noStroke();
    ellipse(188,153,sizeX,sizeX);
    
    fill (21,255,204,100);
    noStroke();
    ellipse(198,139,sizeX+35,sizeX+35);
    
    fill (49,255,210,100);
    noStroke();
    ellipse(197,120,sizeX+50,sizeX+50);
    
    fill (3,87,163,100);
    noStroke();
    ellipse(191,77,sizeX+80,sizeX+80);
    
    fill (1,89,184,100);
    noStroke();
    ellipse(125,-38,sizeX+250,sizeX+250);
  }
}
public class growthHormone{
  growthHormone(){}
      public void circulate(){
        // mousePressed(){
        //background(random(256),random(256),random(256)); //reset background
        
        fill (112,96,255,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (134,121,255,60);
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (152,2,202,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (183,19,255,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (206,0,122,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (20,131,73,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (42,142,90,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (3,124,176,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (3,120,180,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (80,100,255,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (1,88,184,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (183,19,255,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),300,300);
      }
  }
//}


