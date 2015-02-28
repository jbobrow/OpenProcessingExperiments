
//Aaron Balderas
//Assignment 1b
//9.13.12
//*************************************************************************
color darkSeaGreen = color(143, 188, 143);
color indianRed = color(205, 92, 92);
color steelBlue = color(70, 130, 180); 
int canvasWidth = 1200;
int canvasHeight = 600;
int clrSchemeVal = 0;
int oldMouseX = mouseX;
int oldMouseY = mouseY;
int oldClickX = canvasWidth/2;
int oldClickY = canvasHeight/2;
int bgColor = 25;
boolean drawCommand = false;
//*************************************************************************
void setup(){
    size(canvasWidth, canvasHeight);
    background(bgColor);
    frameRate(15);
}
//*************************************************************************
void draw() {
    strokeCap(PROJECT);
    fill(bgColor);
    if (clrSchemeVal == 0){
        stroke(indianRed);
        strokeWeight(0);
        line(0, 3*canvasHeight/4, canvasWidth, 3*canvasHeight/4);
        line(0,(3*canvasHeight/4) + 10, canvasWidth, (3*canvasHeight/4) + 10);
        line(0, (3*canvasHeight/4) + 20, canvasWidth, (3*canvasHeight/4) + 20);
        stroke(steelBlue);
        strokeWeight(2);
        line(canvasWidth/8, 0, canvasWidth/8, canvasHeight);
        line((canvasWidth/8) + 10, 0, (canvasWidth/8) + 10, canvasHeight);
        line((canvasWidth/8) + 20, 0, (canvasWidth/8) + 20, canvasHeight);
        stroke(darkSeaGreen);
        strokeWeight(3);
        line(7*canvasWidth/8, 0, canvasWidth, canvasHeight/4);
        line((7*canvasWidth/8) - 15, 0, canvasWidth, (canvasHeight/4) + 15);
        line((7*canvasWidth/8) - 30, 0, canvasWidth, (canvasHeight/4) + 30);
    }
    else if (clrSchemeVal == 1){
        stroke(darkSeaGreen);
        strokeWeight(0);
        line(0, 3*canvasHeight/4, canvasWidth, 3*canvasHeight/4);
        line(0,(3*canvasHeight/4) + 10, canvasWidth, (3*canvasHeight/4) + 10);
        line(0, (3*canvasHeight/4) + 20, canvasWidth, (3*canvasHeight/4) + 20);
        stroke(indianRed);
        strokeWeight(2);
        line(canvasWidth/8, 0, canvasWidth/8, canvasHeight);
        line((canvasWidth/8) + 10, 0, (canvasWidth/8) + 10, canvasHeight);
        line((canvasWidth/8) + 20, 0, (canvasWidth/8) + 20, canvasHeight);
        stroke(steelBlue);
        strokeWeight(3);
        line(7*canvasWidth/8, 0, canvasWidth, canvasHeight/4);
        line((7*canvasWidth/8) - 15, 0, canvasWidth, (canvasHeight/4) + 15);
        line((7*canvasWidth/8) - 30, 0, canvasWidth, (canvasHeight/4) + 30);
    }
    else{
        stroke(steelBlue);
        strokeWeight(0);
        line(0, 3*canvasHeight/4, canvasWidth, 3*canvasHeight/4);
        line(0,(3*canvasHeight/4) + 10, canvasWidth, (3*canvasHeight/4) + 10);
        line(0, (3*canvasHeight/4) + 20, canvasWidth, (3*canvasHeight/4) + 20);
        stroke(darkSeaGreen);
        strokeWeight(2);
        line(canvasWidth/8, 0, canvasWidth/8, canvasHeight);
        line((canvasWidth/8) + 10, 0, (canvasWidth/8) + 10, canvasHeight);
        line((canvasWidth/8) + 20, 0, (canvasWidth/8) + 20, canvasHeight);
        stroke(indianRed);
        strokeWeight(3);
        line(7*canvasWidth/8, 0, canvasWidth, canvasHeight/4);
        line((7*canvasWidth/8) - 15, 0, canvasWidth, (canvasHeight/4) + 15);
        line((7*canvasWidth/8) - 30, 0, canvasWidth, (canvasHeight/4) + 30);
    }
}
//*************************************************************************
void mouseClicked() {
    if (drawCommand == false){
        drawCommand = true;
    }
    else{
        drawCommand = false;
    }  
}
//*************************************************************************
void mouseMoved(){
    int newMouseX = mouseX;
    int newMouseY = mouseY;
    int mouseDiffX = abs(newMouseX - oldMouseX);
    int mouseDiffY = abs(newMouseY - oldMouseY);
    if (drawCommand == true){
        smooth();
        ellipse(newMouseX, oldMouseY, 1,1);
        ellipse(oldMouseX, newMouseY, 1,1);
    }
    if ((mouseDiffX >= 20) || (mouseDiffY >= 20)){
        if (clrSchemeVal > 2){
            clrSchemeVal = 0;
            oldMouseX = newMouseX;
            oldMouseY = newMouseY;
            newMouseX = 0;
            newMouseY = 0;
        }
        else{
            clrSchemeVal += 1;
            oldMouseX = newMouseX;
            oldMouseY = newMouseY;
            newMouseX = 0;
            newMouseY = 0;
        }
    }
}
