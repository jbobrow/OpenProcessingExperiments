
float r;
float g;
float b;

float sm_size = random(3,5);
float me_size = random(10,15);
float big_size = random(60,90);

void setup() {
    size(300, 300);
    noStroke();
    smooth();
}
 
 
void draw() { 
  ellipseMode(CENTER);
  rectMode(CENTER);
    background(0);    
    translate(width/2, height/2);   
    //ellip(random(150,255),random(150,255),random(150,255));
    pushMatrix();
    rotate((millis() * 0.001 * TWO_PI) * -1); 
    rotate(PI/3.0);
    rect(0,0,2,80); 
    rotate(PI/3.0);
    rect(0,0,2,80); 
    rotate(PI/3.0);
    rect(0,0,2,80); 
    
    rotate(PI/2.0);
    rect(0,0,2,80); 
    rotate(PI/3.0);
    rect(0,0,2,80); 
    rotate(PI/3.0);
    rect(0,0,2,80); 
    popMatrix();
    
    pushMatrix();            //NR 1
      rotate((millis() * 0.001 * TWO_PI / 10.0) * -1); 
      translate(250, 0); 
      ellip_med(random(100,255),random(100,255),random(100,255)); 
        rotate((millis() * 0.001 * TWO_PI) * -1); 
        fill(0);
        rect(0,0,2,30); 
    popMatrix();
    
    pushMatrix();            //NR 2
      rotate(millis()*0.001*PI/1.5);
      translate(80, 0); 
      ellip_med(random(100,255),random(100,255),random(100,255));
      
      pushMatrix();          
        rotate(millis()*0.001*PI/3); 
        translate(20, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix();   
      
    popMatrix();
    
    pushMatrix();          //NR 3
      rotate(millis()*0.001*PI/3);
      translate(150, 0); 
      ellip_med(random(100,255),random(100,255),random(100,255));  
        rotate((millis() * 0.001 * TWO_PI) * -1); 
        fill(random(100,255));
        rect(0,0,2,30); 
      pushMatrix();
        rotate((millis() * 0.001 * TWO_PI) * -1);  
        translate(20, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
      pushMatrix();
        rotate(millis() * 0.001 * TWO_PI / 10.0);  
        translate(40, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
    popMatrix(); 
    
    pushMatrix();            //NR 4
      rotate((millis() * 0.0002 * TWO_PI) ); 
      translate(302, 0); 
      ellip_med(random(0,255),random(100,255),random(100,255)); 
      
      pushMatrix();
        rotate((millis() * 0.001 * TWO_PI) * -1);  
        translate(20, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
      pushMatrix();
        rotate(millis() * 0.001 * TWO_PI / 10.0);  
        translate(40, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
    popMatrix();
    
    pushMatrix();            //NR 5
      rotate((millis() * 0.001 * TWO_PI / 10.0)); 
      translate(190, 0); 
      ellip_med(random(100,255),random(100,255),random(100,255)); 
      
      pushMatrix();
        rotate((millis() * 0.001 * TWO_PI) * -1);  
        translate(20, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
      pushMatrix();
        rotate(millis() * 0.001 * TWO_PI / 10.0);  
        translate(40, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
      pushMatrix();
        rotate((millis() * 0.0005 * TWO_PI) * -1);  
        translate(30, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
      pushMatrix();
        rotate(millis() * 0.001 * TWO_PI / 5.0);  
        translate(60, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
    popMatrix();
    
    pushMatrix();            //NR 6
      rotate((millis() * 0.001 * TWO_PI / 5.0)); 
      translate(220, 0); 
      ellip_med(random(100,255),random(100,255),random(100,255)); 
        rotate((millis() * 0.001 * TWO_PI) * -1); 
        fill(0);
        rect(0,0,2,30); 
    popMatrix();
    
    pushMatrix();            //NR 7
      rotate((millis() * 0.001 * TWO_PI / 10.0) * -1); 
      translate(120, 0); 
      ellip_med(random(100,255),random(100,255),random(100,255)); 
        rotate((millis() * 0.001 * TWO_PI) * -1); 
        fill(0);
        rect(0,0,2,30); 
        
      pushMatrix();
        rotate((millis() * 0.0005 * TWO_PI) * -1);  
        translate(30, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
      popMatrix(); 
      
      pushMatrix();
        rotate(millis() * 0.001 * TWO_PI / 5.0);  
        translate(40, 0); 
        ellip_mini(random(100,255),random(100,255),random(100,255)); 
        
        pushMatrix();
        rotate((millis() * 0.0005 * TWO_PI) * -1); 
        translate(20, 0); 
        fill(random(100,255),random(100,255),random(100,255)); 
        ellipse(0, 0, 2, 2); 
      popMatrix();
        
      popMatrix();
      
    popMatrix(); 
}

void ellip_mini(float r, float g, float b){
   fill(r,g,b);
   ellipse(0, 0, sm_size, sm_size);   
}

void ellip_med(float r, float g, float b){
   fill(r,g,b);
   ellipse(0, 0, me_size, me_size);   
}

void ellip(float r, float g, float b){
   fill(r,g,b);
   ellipse(0, 0, big_size, big_size);   
}
