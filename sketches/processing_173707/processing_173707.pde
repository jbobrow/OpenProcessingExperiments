
//dimensioni//

float u=0;
float offset=0;

void setup(){
   size(940, 640);
   
   smooth();
   noStroke();
   fill(200, 53, 24);
   background (0);
   frameRate (20);
   
}

void draw(){
   
  for (float a=0; a <= 90; a += 4){
    
    float f =radians(a-offset);
    float g= radians(a+offset);
    float h= radians(a+offset*2);
    float i= radians(u/offset);
    float l= radians(u+offset*3);
    float m=radians (u+offset);
    
    //sin/cos 

    fill(250-(random(l)*50),234-(sin(u)*50),209-(sin(u)*70)); 
    float x3 = (width/2 + sin (f) * (100 + cos (l)*100)/1.5);
    float y3 = (height/2 + cos (f) * (100 + cos (m)*100)/1.5);
    ellipse (x3, y3, abs(cos (f)*4), abs(cos (m)*4));
    
  
    fill(250-(sin(l)*500),234-(sin(u)*50),209-(random(u)*70)); 
    float x2 = (width/2+ sin (g) * (100 + cos (h)*200)/1.5);
    float y2 = (height/2 + cos (h) * (100 + cos (m)*200)/1.5);
    ellipse (x2, y2, abs(cos (f)*2), abs(cos (m)*2));
    
  
    fill(250-(sin(l)*500),234-(random(u)+50),209-(sin(u)*70)); 
    float x = (width/2 + sin (m) * (100 + cos (f)*300)/1.5);
    float y = (height/2 + cos (f) * (100 + cos (h)*300)/1.5);
    ellipse (x, y, abs(cos (f)*2), abs(cos (m)*2));
    
  }

 u += 0.2;
 offset += 1;
   

}
void mouseReleased() {
num = random(360);
bi = random(-1, 1);
background(0);
}

