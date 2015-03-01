

//declare image
PImage fractal_d;
PImage fractal_e;
PImage fractal_a;
PImage fractal_t;
PImage fractal_h;
//load image
void setup(){
    size (1280,720);
    fractal_d =loadImage("assinment_final_d.png");
    fractal_e =loadImage("assinment_final_e.png");
    fractal_a =loadImage("assinment_final_a.png");
    fractal_t =loadImage("assinment_final_t.png");
    fractal_h =loadImage("assinment_final_h.png");
}

//draw
void draw(){
  background (255);
    if (key == 'd' || key == 'D'){
        background (255);
        image(fractal_d,0,0);}
    if (key == 'e'|| key == 'E'){
        background (255);
        image(fractal_e,0,0);}
    if (key == 'a'|| key == 'A'){
        background (255); 
        image(fractal_a,0,0);}   
    if (key == 't'|| key == 'T'){
        background (255);
        image(fractal_t,0,0);}
    if (key == 'h'|| key == 'H') {
        background (255);
        image(fractal_h,0,0);}
   
}



