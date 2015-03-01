
color pink = color(255, 102, 204);
int x=0;

void setup() {
loadPixels();
colorMode(HSB,360,100,100);

for (int i = 0; i < (width*height/2)-width/2; i++) {

  pixels[i] = pink;

}

updatePixels();
frameRate(50);
}

void draw() {
    if(x == width*height) {
     x=0;
    } else {
    
        loadPixels();
        float y = hue(pixels[x]);
        y += 25;
        if (y>360){ y=0;}
        float g = saturation(pixels[x]);
        g-= 7;
        g=(g<0)?60:g;
        float b = brightness(pixels[x]);
        b-=4;
        b=(b<0)?100:b;
        pixels[x] = color(y,g,b);
        updatePixels();
        println(y+" "+g+" "+b);
        x++;
    }
}
