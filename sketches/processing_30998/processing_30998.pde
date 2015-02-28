
// vim:expandtab: sw=4 ts=4 ft=java:
// Playing around with edge detection Jeremy English <jhe@jeremyenglish.org>


PImage img, img1; 
float theta = 0;
final int DEF_RAGE = 5;
int rage = DEF_RAGE;

int colorInt(color c) {
    int r = (int)red(c);
    int g = (int)green(c);
    int b = (int)blue(c);
    r = r << 16;
    g = g << 8;
    return r + g + b;
}

PImage sobel(PImage image, boolean flip){
    //Sobel edge detection algorithm taken from
    //http://www.pages.drexel.edu/~weg22/edge.html

    int [][] gx = {{-1, 0, 1},
        {-2, 0, 2},
        {-1, 0, 1}};

    int [][] gy = {{1, 2, 1},
        {0, 0, 0},
        {-1,-2,-1}};

    int width = image.width;
    int height = image.height;

    PImage edgeImage = createImage(width, height, ARGB);
    image.loadPixels();
    edgeImage.loadPixels();
    int sumAll;
    for(int y = 0; y < height; y++){
        for(int x  = 0; x < width; x++){
            int sumx = 0;
            int sumy = 0;
            if (y == 0 || y == (height - 1))
                sumAll = 0;
            else if (x == 0 || x == (width -1))
                sumAll = 0;
            else{
                for (int i = -1; i < 2; i++){ 
                    for(int j = -1; j < 2; j++){
                        int nx = x + i;
                        int ny = y + j;
                        int ni = i + 1;
                        int nj = j + 1;
                        sumx = sumx + round(brightness(image.pixels[(ny * width) + nx])) * gx[ni][nj];
                        sumy = sumy + round(brightness(image.pixels[(ny * width) + nx])) * gy[ni][nj];
                    }
                }
                sumAll = abs(sumx) + abs(sumy);
            }

            if (sumAll > 255)
                sumAll = 255;
            if (sumAll < 0)
                sumAll = 0;

            int n;
            if (flip)
                n = sumAll;
            else
                n = 255 - sumAll;

            color c = image.pixels[(y * width) + x];
            edgeImage.pixels[(y * width) + x] = color(red(c), green(c), blue(c), n);
        }
    }
    edgeImage.updatePixels();
    return edgeImage;
}


void setup(){
    PImage timg = loadImage("f.jpg");
    size(timg.width,timg.height);
    img = sobel(timg, false);
    img1 = sobel(timg, true);
}

void keyPressed(){
    println(key);
    switch(key){
        case '+': rage++;
                  break;
        case '-': rage--;
                  break;
        case 'r': rage = DEF_RAGE; /* reset to default */
                  break;
    }
}

void draw(){
    colorMode(HSB, 360, 100, 100); 
    float alpha = cos(theta);
    float beta  = sin(theta);
    background(color(degrees(alpha),100,50));
    colorMode(ARGB, 0xff);
    image(img,0,0);
    image(img1,(int)random(-rage  , rage  ) * alpha,(int)random(-rage , rage ) * alpha);
    theta += 0.01;
    println(rage);
}

