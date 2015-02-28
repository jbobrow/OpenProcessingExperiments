
void setup() {  //setup function called initially, only once
  size(300, 300);
  background(0);  //set background white
}

void draw() {  //draw function loops 
stroke(255,5,5,60);
line(width/2,height/2,random(width),random(height));
stroke(0,0,0,50);
line(150,150,random(300),random(300));
}

                
                                
