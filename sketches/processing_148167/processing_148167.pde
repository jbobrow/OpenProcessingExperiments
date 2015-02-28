
int collisions = 1;
ArrayList<Walrus> first = new ArrayList<Walrus>();
ArrayList<Walrus> second = new ArrayList<Walrus>();

private class Walrus {
    private int m; //size of walrus
    private int e; //size of eyes
    private int x;
    private int y;
    
    public Walrus(int s) { //for first walrus only
        m = s;
        x = mouseX;
        y = mouseY;
        e = 4;
    }
    
    public Walrus(int s, int d, int b) { //second gen walruses
        m = s/d;
        e = 4 - d;
        if(b == 1) { //mid walrus
           x = mouseX + m*2;  
           y = mouseY;
       } else if (b == 2) { //bot walrus
           x = mouseX;
           y = mouseY + m*2;
       } else if (b == 3) { //top walrus
           x = mouseX;
           y = mouseY - m*2;
       }
    }
     
    public Walrus(int s, int d, int b, int h) { //third gen walruses
       m = s/d;
       e = 4 - d;
         if(b == 1) { //top walrus
             if(h == 1) {
                 x = mouseX + m*3;  
                 y = mouseY - m*4;
             } else if(h == 2) {
                 x = mouseX;
                 y = mouseY - m*3;
             } else if(h == 3) {
                 x = mouseX + m*2;
                 y = mouseY - m*4;
             }
         } else if (b == 2) { //mid walrus CHECK GOOD
             if(h == 1) {
                 x = mouseX + m*5;
                 y = mouseY;
             } else if(h == 2) {
                 x = mouseX + m*4;
                 y = mouseY - m*2;
             } else if(h == 3) {
                 x = mouseX + m*4;
                 y = mouseY + m*3;
             }
         } else if (b == 3) { //bot walrus
             if(h == 1) {
                 x = mouseX + m*3;
                 y = mouseY + m*4;
             } else if(h == 2) { //t
                 x = mouseX;
                 y = mouseY + m*5;
             } else if(h == 3) { //b
                 x = mouseX;
                 y = mouseY + m*2;
             }
         } 
     }
     
     public int getX() {
       return x;
     }
     
     public int getY() {
       return y;
     }
     
     public void render() {
       ellipse(x-m+m/12,y,m*3,m*2);
       triangle(x+m/3,y+m/2.1,x+m*2/3,y+m/2.1,x+m/2,y+m*5/6);
       triangle(x-m/3,y+m/2.1,x-m*2/3,y+m/2.1,x-m/2,y+m*5/6);
       ellipse(x+m/2,y,m,m);
       ellipse(x-m/2,y,m,m);
            
       ellipse(x,y-m*3/5,e,e);
       fill(225);
       ellipse(x-m/2,y-m*3/5,e,e);
       //whiskers
       line(x+m*2/3,y-m/4,x+m+m/4,y-m/2);
       line(x+m*2/3,y,x+m+m/4,y);
       line(x+m*2/3,y+m/4,x+m+m/4,y+m/2);
       line(x-m*2/3,y-m/4,x-m-m/4,y-m/2);
       line(x-m*2/3,y,x-m-m/4,y);
       line(x-m*2/3,y+m/4,x-m-m/4,y+m/2);
     }
  }
  
  void setup() {  //setup function called initially, only once
  size(1000, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
 
}

void draw() {
    background(255);
    if(collisions == 1) {
        Walrus w = new Walrus(80);
        w.render();
    } else if(collisions == 2) {
        Walrus w = new Walrus(80, collisions, 1);
        Walrus a = new Walrus(80, collisions, 2);
        Walrus t = new Walrus(80, collisions, 3);
        w.render();
        a.render();
        t.render();
    } else if(collisions == 3) {
        Walrus w = new Walrus(80, collisions, 1, 1);
        Walrus a = new Walrus(80, collisions, 2, 1);
        Walrus t = new Walrus(80, collisions, 3, 1);
        Walrus h = new Walrus(80, collisions, 1, 2);
        Walrus s = new Walrus(80, collisions, 2, 2);
        Walrus e = new Walrus(80, collisions, 3, 2);
        Walrus u = new Walrus(80, collisions, 1, 3);
        Walrus o = new Walrus(80, collisions, 2, 3);
        Walrus p = new Walrus(80, collisions, 3, 3);
        w.render();
        a.render();
        t.render();
        h.render();
        e.render();
        s.render();
        u.render();
        o.render();
        p.render();
    }
}

void mouseClicked() {
    collisions++;
}
    
