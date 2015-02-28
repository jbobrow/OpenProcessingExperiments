
public class tiltGame {
    public int width = 500;
    public int height = 600;
    
    public float xPos = width / 2;
    public float yPos = height / 2;
    
    public int storeTime = 0;
    public int milliCount = 0;
   
    
    
    Ball b = new Ball();
    
    
    public static void main(String[] args) {
        PApplet.main(new String[]{"tiltGame"}); 
    }
    
    public class Ball {
        private float xPos = width / 2;
        private float yPos = height / 2;
        private float ballSize;
        
        public Ball() {
            this.xPos = 40;
            this.yPos = 20;
            this.ballSize = 15;
        }
        
        public float getX() {
            return this.xPos;
        }
        public float getY() {
            return this.yPos;
        }
        
        public void ballGrow() {
            this.ballSize = 30;
        }
        
        public void moveUp() {
            this.yPos -= 10;
        }
        public void moveDown() {
            this.yPos += 10; 
        }
        public void moveLeft() {
            this.xPos -= 10;
        }
        public void moveRight() {
            this.xPos += 10;
        }
        public void drawBall() {
            fill(255, 0, 0);
            ellipse(this.xPos, this.yPos, ballSize, ballSize);
        }
        public void drawTroll() {
            image(troll, this.xPos - 10, this.yPos - 10, ballSize, ballSize);
        }
        
    
    }
    PImage level;
    PImage troll;
    PImage scary;
    
    public void setup() {
        size(width, height);
        background(255);
        level = loadImage(sketchPath("maze2.png"));
        troll = loadImage(sketchPath("troll.png"));
        scary = loadImage(sketchPath("scary.jpg"));
        StdAudio.play("thinking.wav");
        
    
    }
    public void draw() {
        background(255);
        image(level, 0, 0, width, 500);
        if (millis() / 1000 < 25) {
            b.drawBall();
        }
        else {
            b.drawTroll();
        }
        textSize(32);
        fill(0);
        
        if (millis() / 1000 < 15) {
            text("Your Time: " + millis() /1000, 150, 550);
        }
        else if(millis() / 1000 < 25) {
            text("Well, this is awkward... " + millis() /1000, 20, 550);
        }
        else {
            b.ballGrow();
            image(troll, 20, 500, 100, 100);
            text("You Mad tho... " + millis() /1000, 150, 550);
            
        }
        if (b.getX() > width - 30) {
            background(255);
            image(level, 0, 0, width, 500);
            b.drawTroll();
            image(troll, 20, 500, 100, 100);
            
            
            text("Your Time: " + millis() /1000, 150, 550);
            noLoop();
        }
        if (millis() / 1000 > 40) {
            
            background(255);
            image(scary, 0, 0, width, height);
            StdAudio.play("scream.wav");
            noLoop();
        }
        //System.out.println(millis() / 1000);
    }
    
    public void keyPressed() {
        
//        char moveDir = key;
//        
//        if (moveDir == 'a') {
//            b.moveUp();
//        }
//        else if (moveDir == 'd') {
//            b.moveLeft();
//        }
//        else if (moveDir == 'w') {
//            b.moveRight();
//        }
//        else if (moveDir == 's') {
//            b.moveDown();
//        }
//        else {
//        
//        }
        if (keyCode == UP){
            b.moveRight();
        }
        if (keyCode == RIGHT){
            b.moveLeft();
        }
        if (keyCode == LEFT){
            b.moveUp();
        }
        if (keyCode == DOWN){
            b.moveDown();
        }
        
    }
    public void drawLevel() {
        //background(level);
    }
   
    
}   


