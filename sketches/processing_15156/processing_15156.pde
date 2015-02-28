
// Example 02-02 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010
int i;
int r;

void setup() {
  size(1000,1000);
  background(255,230,0);
  i=1;
  r=0;
}




        //opnieuw tekenen

void draw() {
          // Program 'Little_Man by Roman Strijbos 
          // 15-10-10
        
          background(255,230,0);
          rectMode(CENTER);
        
    
          fill(0,13,253);
          noStroke();
        
          //neck
          rect(400+mouseX-400,600+mouseY-400,40,200);
        
          //head
          ellipse(400+mouseX-400,400+mouseY-400,600+i,200+i);
          
            //head size                  
           if(i == 50) {
           i=0;
           } else { i=i+1; 
            }

            
        
          //ears
          fill(0,255,90);
          ellipse(680+mouseX-400,300+mouseY-400,80,200-2*i);
          ellipse(180+mouseX-400,300+mouseY-400,80,200-2*i);
          fill(0);
          ellipse(680+mouseX-400,250+mouseY-400+i,30,50);
          ellipse(180+mouseX-400,250+mouseY-400+i,30,50);
        
          //mouth
          fill(255,0,0);
          rect(400+mouseX-400,450+mouseY-400,300,50);
          fill(0);
          ellipse(400+mouseX-400,460+mouseY-400,190,10+r);
        
          //nose
          fill(255,0,266);
          triangle(400+mouseX-400,400+mouseY-400,350+mouseX-400,360+mouseY-400,450+mouseX-400,360+mouseY-400);
        
        
          
          //arms
      stroke(0);
          line(400+mouseX-400,700+mouseY-400,200+mouseX-400,530+mouseY-400+i);
          line(400+mouseX-400,700+mouseY-400,600+mouseX-400,530+mouseY-400+i);
        
        
          //body
      noStroke();
          fill(113,38,0);
          triangle(400+mouseX-400,600+mouseY-400,210+mouseX-400,800+mouseY-400,650+mouseX-400,800+mouseY-400);


  
}


