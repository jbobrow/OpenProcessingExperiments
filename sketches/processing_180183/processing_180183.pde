
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/30186*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* vim: set cindent filetype=java ts=4 sw=4 expandtab: */
//Kaleidoscope  06/20/2011 Jeremy English jhe@jeremyenglish.org

int angle; 
float zoom = 2;


class Pos{
     Pos(int x, int y){
         this.x = x;
         this.y = y;
     }

     private int x;
     private int y;

     public int getX(){
         return x;
     }

     public int getY(){
         return y;
     }

     public void print(){
         println("x: " + x + "y: " + y);
     }
 }

class Triangle{
    protected int my_width;
    protected int my_height;
    protected Pos origin;

    Triangle(Pos origin, int my_width, int my_height){
        this.my_width = my_width;
        this.my_height = my_height;
        this.origin = origin;
    }

    void setLocation(Pos origin){
        int x = origin.getX();
        int y = origin.getY();
        if (y - my_height < 0)
            y = my_height;

        if (y > height)
            y = height;

        if (x < 0)
            x = 0;

        if (x + my_width > width)
            x = width-my_width;

        this.origin = new Pos(x, y);
    }

    void draw(){
        int x1 = origin.getX();
        int y1 = origin.getY();
        int x2 = x1;
        int y2 = y1 - this.my_height;
        int x3 = x1 + this.my_width;
        int y3 = y1;
        line(x1, y1, x2, y2);
        line(x2, y2, x3, y3);
        line(x3, y3, x1, y1);
    }

}

class ImageTriangle extends Triangle{
    private float slope;
    private PImage clipImage;

    ImageTriangle(Pos origin, int my_width, int my_height){
        super(origin, my_width, my_height);
        this.slope = float(my_width)/float(my_height);

        clipImage = createImage(this.my_width, this.my_height, ARGB);
    }

    void clip(){
        loadPixels();
        int y = origin.getY();
        int x = origin.getX();
        int idx = x + (y * 600);
        float w = float(this.my_width);
        int cx = 0;
        int cy = this.my_height-1;
        int cidx = cx + (cy * this.my_width);
        clipImage.loadPixels(); 
        for(int i = 0; i < this.my_height; i++){
            for(int j = 0; j < this.my_width; j++){
                if (j < w)
                    clipImage.pixels[cidx + j] = pixels[idx + j];
                else
                    clipImage.pixels[cidx + j] = color(0,0,0,0);
                pixels[idx] = color(0x0, 0xff, 0x0);
            }
            w = w - slope;
            y--;
            idx = x + (y * 600);
            cy--;
            cidx = cx + (cy * this.my_width);
        }
        clipImage.updatePixels();
        updatePixels();
    }

    void draw(Pos location){
        image(clipImage, location.getX(), location.getY());
    }

    PImage getImage(){
        return clipImage;
    }

    void drawFrame(){
        super.draw();
    }

}

PImage flipImage(PImage img){
    PImage newImage = createImage(img.width, img.height, ARGB);
    img.loadPixels();
    newImage.loadPixels();
    int ln = img.pixels.length;
    int n = ln - 1;
    for (int i = 0; i < img.height; i++){
        for (int j = 0; j < img.width; j++){
            int new_x = (img.width - 1) - j;
            int new_idx = new_x + (i * img.width);
            int idx = j + (i * img.width);
            newImage.pixels[new_idx] = img.pixels[idx];
        }
    }
    newImage.updatePixels();
    return newImage;
}

final int B1_TOP  = 710;
final int B1_LEFT = 10;

final int B2_TOP  = 710;
final int B2_LEFT = 490;
int idx = 0;

PImage  b1, b2;
ImageTriangle tri;
PImage []images;

String []files = {"chicago.jpg", "disney.jpg", "newyork.jpg", "holland.jpg", 
    "sanfran.jpg", "seattle.jpg", "venice.jpg", "moscow.jpg", "southbeach.jpg"};

void mousePressed(){
    int mx = mouseX;
    int my = mouseY;
    if (B1_LEFT < mx && mx < B1_LEFT + b1.width && 
            B1_TOP < my && my < B1_TOP + b1.height){
        idx = max(idx - 1, 0);
    }
    else if ( B2_LEFT < mx && mx <  B2_LEFT + b1.width && 
            B2_TOP < my && my < B2_TOP + b1.height){
        idx = min(idx + 1, images.length - 1);
    }
}


void setup(){
    background(0);
    size(600,800);
    images = new PImage[files.length];
    for(int i = 0; i < images.length; i++)
        images[i] = null;
    tri = new ImageTriangle(new Pos(600,400), 100, 173);
     b1  = loadImage("arrow_left.png");
    b2  = loadImage("arrow_right.png");
}


void draw(){
    background(0);
    pushMatrix();
    translate(width/2, height/2);

    if (images[idx] == null)
        images[idx] = loadImage(files[idx]);

    image(images[idx], -1 * (images[idx].width/2),0);
    popMatrix();
   
    tri.setLocation(new Pos(mouseX, mouseY));
    tri.clip();
    
    float theta = PI/3;
    float step = theta; 
    
    for (int i = 0; i < 6; i++){
        pushMatrix();
        translate(300, 200);
        scale(zoom);
        rotate(radians(angle));
        rotate(theta);
        PImage img = flipImage(tri.getImage());
        tri.draw(new Pos(0, 0));
        image(img, -100, 0);
        popMatrix();
        theta += step;
    }

    tri.drawFrame();
    image(b1, B1_LEFT, B1_TOP);
    image(b2, B2_LEFT, B2_TOP);
}



