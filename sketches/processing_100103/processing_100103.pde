
int total = 70;
Dot dots[] = new Dot[total];

int x;
int y;
int r;

void setup(){
    size(1440, 900); 
    
    for(int e=0; e<total; e++){
    dots[e] = new Dot((int)random(width), (int)random(height), random(6,46));
    }
}


void draw(){
     background(13, 21, 12);
     
     for(int e=0; e<total; e++){
     dots[e].update();
     dots[e].show();
     
     }
     
     for(int f=0; f<total; f++){
       for(int g=0; g<total; g++){
         if(f != g){
            if(dist(dots[f].x, dots[f].y, dots[g].x, dots[g].y)<100){ 
              stroke(255, 255, 255, 80);
              line(dots[f].x, dots[f].y, dots[g].x, dots[g].y);
            }
         }
       }
       
     }
     
      keyPressed();
       if(key == 's'){
        saveFrame("test-##"); 
    }

}
    
     








class Dot{
     float x;
     float y;
     float r;
     
     float tr;
     float or;
     int dir; 
     
     float tx;
     float ty;
     
     int step;
     
     
     Dot(float x, float y, float r){
         this.x = x;
         this.y = y;
         this.r = r = or;
    
         tr = or + random(50);
         
         tx = random(width);
         ty = random(height);
         
         step = (int)random(40, 300);
       
       
     }
  
     
     void update(){
         r = r + (tr-r)/step;
         x = x + (tx-x)/step;
         y = y + (ty-y)/step;
         
         if(abs(tr-r) < 0.1){
             if(dir == 0){
               tr = or;
               dir = 1;
             }else{
               tr = or + random(190);
               dir = 0;
               }
            
         }
         
         if(dist(x, y, tx, ty) < 0.1){
            x = random(width);
            y = random(height);
            step = (int)random(20, 300);
         }
         
     }
     
     void show(){
          //noStroke(); 
          fill(255, 255, 255, 5);
          ellipse(x, y, 0.3*r, 0.3*r); 
          ellipse(x, y, 0.6*r, 0.6*r);
          ellipse(x, y, 0.9*r, 0.9*r); 
          ellipse(x, y, 1.2*r, 1.2*r);
          ellipse(x, y, 1.5*r, 1.5*r);  
     }


  
}


