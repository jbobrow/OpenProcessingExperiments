
int blueValue = 0;
int redValue = 0;
int greenValue = 0;
int allMax = 255;
int bottomTextPostition = allMax + 15;

boolean up = true;

void setup(){
    size(300,300);
    background(255);
    colorMode(RGB);
    frameRate(1);
}

void draw(){
    background(255);
    noStroke();
    for(redValue = 0; redValue < allMax; ++redValue){
        for(greenValue = 0; greenValue < allMax; ++greenValue){
            stroke(redValue, greenValue, blueValue);
            point(redValue, greenValue);
        }
    }
    if(up & blueValue >= allMax){
        up = false;
    }
    if( !up & blueValue <= 0){
        up = true;
    }
    fill(255, 0, 0);
    text(redValue,5,bottomTextPostition);
    fill(0, 255, 0);
    text(greenValue,30,bottomTextPostition);
    fill(0, 0, 255);
    text(blueValue,55,bottomTextPostition);
    blueValue += up ? 10 : -10;
}


