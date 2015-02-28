
ArrayList lines;
int mx, my, mx2, my2;

void setup() { 
  size(400, 400);
  background(255);  //set background white
  lines = new ArrayList();
}

void draw() {  //draw function loops 
    background(255);
     for(int i = 0; i < 35; i ++ ){
         line((i*10)+20, height-40, (i*10)+20, 20);
     }
     for(int i = 0; i < 35; i ++ ){
         line(20, (i*10)+20, width-40, (i*10)+20);
     }
     noFill();
     ellipse(mouseX, mouseY, 15, 15);
     //text((mouseX-20)/10, 20, height-15);
     
     for (int i = lines.size()-1; i > 0; i--){
         _line l = (_line) lines.get(i);
         l.draw();
     }
}

class _line{
    int mx, my, mx2, my2;
  
    line(int mxt, int myt, int mx2t, int my2t){
        mx = mxt;
        my = myt;
        my2 = my2t;
        mx2 = mx2t;
    }
 
    void draw(){
        line(mx, my, mx2, my2);
    }
}
    
void mousePressed(){
    mx2 = mx;
    my2 = my;
    mx = mouseX;
    my = mouseY;
    lines.add(new _line(mx, my, mx2, my2));
}

void keyPressed(){
    if (key=='c'){
        mx = 0;
        my = 0;
        mx2 = 0;
        my2 = 0;
    }
}
