
int x = 20;
int y = 20;

int dx = 0;
int dy = 1;

void setup() {  //setup function called initially, only once

    size(300,300);

}

void draw() {  //draw function loops 

   background(random(255),random(255),random(255),random(80));

   ellipse(x,y,40,40);
   fill(random(255),random(255),random(255),50);
   
   x = x + 2 + dx;
   y = y + dy;
   
   if(y > 300){
   dy = -dy;
   }
   
   if(x > 300){
   dx = -dx;
   }

   if (mousePressed){
   
      x = mouseX
      y = mouseY
      
   }

  }
