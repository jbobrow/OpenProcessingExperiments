
int startXX = 250;
    int startYY = 250;
    int endXX = 150;
    int endYY = 150;
    boolean right2 = false;
    boolean left = true;

    public void setup() {
        size(300,300);
        frameRate(10);
        smooth();
        background(0);
    }

    public void draw() {
        stroke(255,0,255);
        if (startXX == 250){
            background(0);
        }
        line(startXX,startYY,endXX,endYY);
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
            startYY = startYY - 5;
            startXX = startXX - 5;
        }
        else{
            startYY = startYY + 5;
            startXX = startXX + 5;
        }
        if (right2 == false){
            endXX = endXX - 5;
            endYY = endYY + 5;
        }
        else{
            endXX = endXX + 5;
            endYY = endYY - 5;
        }
    }
