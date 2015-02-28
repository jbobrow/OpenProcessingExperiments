
color[] pallette = {#E5E4D7, #2C6700, #92CD00, #336699, #990033, #FFCF79};

int lf = pallette[2];
int rf = pallette[3];



void setup(){
    size(600, 600);
    smooth();
    background(pallette[0]);
    fill(0);
}

void draw(){
    strokeWeight(5);
    stroke(pallette[1]);
    fill(lf, 50);
    ellipse(width/3, height/2, 300, 300);
    fill(rf, 50);
    ellipse(width*2/3, height/2, 300, 300);
    
    //detect if any key is pressed
    if(keyPressed){
        //click "l" key
        if(key == 'l'){
        lf = pallette[4];
        } else {
        lf = pallette[2];
        }
        //click "r" key
        if(key == 'r'){
        rf = pallette[5];
        } else {
        rf = pallette[3];
        }
     }
}
