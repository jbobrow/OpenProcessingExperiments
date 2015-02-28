
void setup(){
size (800,600);
   
 smooth();
 frameRate(11);
 }
  
  
void draw(){ 

      background (255);
        
        
        
        noFill();
       
        float radius = random (200);
         stroke(255);
        strokeWeight(random(150));
        arc ( width/2, height/2, radius,radius, radians(random(360)), radians ( random(360)) );
        stroke(0);
        strokeWeight(random(100));
        arc ( width/2, height/2, radius,radius, radians( random(210)), radians ( random(360)) );
        stroke (255);
        strokeWeight(random(5));
        arc ( width/2, height/2, radius,radius, radians(random(360)), radians ( random(360)) );
        stroke (0);;
        strokeWeight(random(24));
        arc ( width/2, height/2, radius,radius, radians( random(180)), radians ( random(360)) );
        stroke (255);
        strokeWeight(random(600));
        arc ( width/2, height/2, radius,radius,radians(random(90)), radians ( random(360)) );
        stroke (0);
        strokeWeight(random(200));
        arc ( width/2, height/2, radius,radius,0, radians ( random(360)) );
      strokeWeight(random(250));
      fill(random(255),random(255),random(255),random(255));
     
        ellipse ( width/2, height/2, 250,250);
      strokeCap(MITER);

          
    } 
 

