
PGraphics colorchooser;
color current= new color();


void colorchoosermouse() {
    if (5<=mouseX && mouseX<=105 && 5<=mouseY && mouseY<=105)
    {
        current = colorchooser.get(mouseX,100-mouseY);
    } 
}
void colorchoosersetup() {
    colorchooser = createGraphics(110,110,P3D);
    
    colorchooser.beginDraw();
    colorchooser.noStroke();
    colorchooser.background(100);
    
    colorchooser.colorMode(HSB, 100);

    for(int i=0; i<=100; i++) {

      for(int j=0; j<=100; j++) {
        colorchooser.saturation(j);
        colorchooser.stroke(i, j*2, (100-j)*2);

        colorchooser.point(i+5, j+5);
        
      }

    }

    colorchooser.endDraw();
}
    int count;

    int num = 60;
    float[] mx = new float[0];
    float[] my = new float[0];
    int value;
//// Setup ////
    void setup() {
        colorchoosersetup();
        size(500,500);
        count = 0;
        frameRate(30);
        smooth();
        value = 0;
        strokeJoin(ROUND);
        stroke(255,1);
        strokeWeight(1);
        background(255);
    }

//// mouseReleased ////
    void mouseReleased() {
        if (value == 255) {
            value = 0;
        }
    }
//// mousePressed ////
    void mousePressed() {
        colorchoosermouse();
        if (value == 0) {
                mx = new float[0];
            my = new float[0];
            value = 255;
        }
    }
//// mouseDragged ////
void mouseDragged() {
    float dy, dx,db;
    db =  dist(pmouseX,pmouseY,mouseX,mouseY);
    for (int j = 0;j<=db;j++){
        mx = append(mx,lerp(pmouseX,mouseX,j/db));
        my = append(my,lerp(pmouseY,mouseY,j/db));
    }
            mx = append(mx,mouseX);
            my = append(my,mouseY);
        
            //println(mx+"|"+my+"  |  "+mx.length+"|"+count);
            //println(my);
            for (int k = 0;k<=db;k++)
            {

            for (int i = mx.length-1; i >= 0; i--) {
               
                float dg = dist(mx[mx.length-k], my[mx.length-k], mx[i], my[i]); 
                //println(mx[mx.length-1]);
                if (dg > 50 || dg < 20) {
                    continue;
                } else {
                    stroke(current, dg/20);
                    line(mx[mx.length-k], my[mx.length-k], mx[i], my[i]);
                   //image(colorchooser,0,0)  
                }
            }
                            //println(lerp(pmouseX,mouseX,k/db));
                
            }
}
void draw() {
image(colorchooser,0,0)  
}
