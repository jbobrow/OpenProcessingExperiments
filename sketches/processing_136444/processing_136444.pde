
int startX = 150;
    int startY = 0;
    int endX = 150;
    int endY = 150;
    int startXX = 250;
    int startYY = 250;
    int endXX = 150;
    int endYY = 150;
    boolean right2 = false;
    boolean left = true;
    boolean right = true;
    boolean down = true;

    public void setup() {
        size(300,300);
        frameRate(10);
        smooth();
        background(0);
    }

    public void draw() {
        stroke(255,0,255);
        if (startY == 0){
            background(0);
        }
        line(startX,startY,endX,endY);
        line(startXX,startYY,endXX,endYY);
        if (startY >= 300){
            down = false;
        }
        else if (startY <= 0){
            down = true;
        }
        if (endX >= 300){
            right = false;
        }
        else if(endX <= 0){
            right = true;
        }
        if (down == true){
            startY = startY + 5;
        }
        else{
            startY = startY - 5;
        }
        if (right == true){
            endX = endX + 5;
        }
        else{
            endX = endX - 5;
        }
        if ((startXX >= 250) && (startYY >= 250)) {
            right2 = false;
            left = true;
        }
        else if ((startXX <= 50) && (startYY <= 50)){
            right2 = true;
            left = false;
        }
        if ((endXX <= 50) && (endYY >= 250)){
            right2 = true;
            left = true;
        }
        else if((endXX >= 250) && (endYY <= 50)){
            right2 = false;
            left = false;
        }
        if (left == true){
            startYY = startYY - 4;
            startXX = startXX - 4;
        }
        else{
            startYY = startYY + 4;
            startXX = startXX + 4;
        }
        if (right2 == false){
            endXX = endXX - 4;
            endYY = endYY + 4;
        }
        else{
            endXX = endXX + 4;
            endYY = endYY - 4;
        }
    }
