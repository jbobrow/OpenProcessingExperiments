

                
    size (900,720);
background (178); 
smooth(); 


for ( int i = 0; i < 100; i = i +1)
{
 
    fill(260);
    stroke (random(255));
    strokeWeight(random(10)); 
    float radius = random ( 400); 
    arc (  random(width/2-30, width/2+30), random(height), radius,radius, radians(random(180)), radians ( random(360)) );
}
  
    float radius = random (2200); 
    arc ( random(width), random(height/2-30, height/2+30), radius,radius, radians(random(180)), radians ( random(360)) );
    stroke (255,0,0);
    ellipse(random(width), random(height), 41, 41);
    fill(256);
    stroke (random(250));
    strokeWeight(random(20)); 
    arc (  random(width/2-50, width/4+60), random(height), radius,radius, radians(random(160)), radians ( random(360)) );
    ellipse(random(width),random(height),34,34);
    arc (  random(width/3-50, width/2+80), random(height), radius,radius, radians(random(180)), radians ( random(360)) );
    ellipse(random(width),random(height),44,44);
    arc (  random(width/1-60, width/3+60), random(height), radius,radius, radians(random(140)), radians ( random(350)) );
    ellipse(random(width),random(height),60,60);
    
    stroke(255,125,125);
    point (random(width/2-100, width/2 + 100), random(height/2-100,height/2+100));
    stroke(255,205,205);
    point (random(width/2-200, width/2 + 200), random(height/2-100,height/2+100));
    stroke (255,5,5);
    strokeWeight(random(9)); 
    arc (  random(width), random(height), 10,10, radians(10), radians ( random(360)) );
    noStroke();
    fill(255,255,0);
    noStroke(); 
    fill(0,100,200,125);
    rect(0,0, width, height/2); 


{
    rectMode(CENTER); 
    noStroke ();
    fill(255,255,0); 
    stroke (255,255,0,20) ; 

     
  
            
} 

    rectMode(CORNER);
    noStroke(); 
    fill(255,255,255,50);
    rect(0,0, width, height/2); 

    noStroke(); 
    fill(0,100,200,125);
    rect(0,height/2, width, height);
    
     stroke (255,0,0);
    ellipse(random(width), random(height), 50, 50);
    
    stroke (255,2,2);
    ellipse(random(width), random(height), 120, 160);
    
    stroke (255);
    ellipse(random(width), random(height), 150, 150);
    
    stroke (255);
    ellipse(random(width), random(height), 200, 200);
    
    noStroke();
    for ( int i = 2; i < 200000; i = i +1);
    strokeWeight(random(110));
    stroke(20);
    point ( random(width), random(height) );
    
   noStroke(); 
   fill(255,255,255,50);
   rect(0,0, width, height/2); 

   noStroke(); 
   fill(0,100,200,125);
   rect(0,height/2, width, height); 
   
   saveFrame(" exame1.png");            
