
private Spaceship s;
    public final static int n = 10;
    public final static int num = 125;
    private ArrayList <Bullet> shots;
    private ArrayList <Asteroid> space;
    private Star [] some = new Star[num];
    private boolean gameOver = false;
    private boolean title = true;
    private boolean intro = false;
    private int count = 0;
    private int clr1 = color(255);
    private int clr2 = color(255);
    private int clr3 = color(255);
    
    public void setup() {
        size(600,600);
        s = new Spaceship();
        space = new ArrayList <Asteroid>();
        shots = new ArrayList <Bullet>();
        for(int i = 0; i < n; i++) {
            space.add(new Asteroid());
        }
        for(int i = 0; i < num; i++) {
            some[i] = new Star();
        }
    }

    public void draw() {
        background(0);
        for(int i = 0; i < num; i++) {
            some[i].show();
        }
        if(title == true && intro == false) {
            fill(255);
            textSize(80);
            textAlign(CENTER, TOP);
            text("ASTEROIDS", width/2,75);
            textSize(40);
            fill(clr1);
            text("PLAY", width/2, 300);
            fill(clr2);
            text("INSTRUCTIONS", width/2, 400);
            if (mouseX > 255 && mouseX < 345 && mouseY > 305 && mouseY < 340)
                clr1 = color(200,0,0);
            else
                clr1 = color(255);
            if (mouseX > 155 && mouseX < 445 && mouseY > 405 && mouseY < 440)
                clr2 = color(200,0,0);
            else 
                clr2 = color(255);
        }
        else if(title == false && intro == true) {
            fill(255);
            textSize(25);
            text("Press '5' to accelerate forward\n\nPress '4' and '6' to turn\nleft and right, respectively\n\n" +
                    "Press '2' to jump into \nhyperspace and appear\nanywhere on the screen randomly\n\n" +
                    "Press the spacebar to shoot\nGood Luck!", width/2, 20);
            fill(clr3);
            text("Back",40,550);
            if(mouseX > 10 && mouseX < 65 && mouseY > 555 && mouseY < 575)
                clr3 = color(200,0,0);
            else
                clr3 = color(255);
        }
        else if(title == false && intro == false) {
            textSize(16);
            textAlign(LEFT);
            fill(255);
            text("Asteroids destroyed: " + count, 10, 20);
            for(Bullet shot : shots) {
                shot.show();
                shot.move();
            }
            for(Asteroid rock : space) {
                rock.show();
                rock.move();
                if(dist(s.getX(), s.getY(), rock.getX(), rock.getY()) < 20){
                    gameOver = true;
                }
            }
            for(int i = space.size() - 1; i >= 0; i--) {
                for(int j = 0; j < shots.size(); j++) {
                    if(dist(space.get(i).getX(), space.get(i).getY(), shots.get(j).getX(), shots.get(j).getY()) < 12) {
                        space.remove(i);
                        shots.remove(j);
                        count++;
                        break;
                    }
                    if(abs(shots.get(j).getM() - millis()) > 1200) {
                        shots.remove(j);
                    }
                }
            }
            if (gameOver == false) {
                s.show();
                s.move();
                if(space.size() == 0) {
                    for(int i = 0; i < n; i++) {
                        space.add(new Asteroid());
                    }
                }
            }
            else {
                textSize(40);
                fill(255);
                textAlign(CENTER);
                text("Game Over\nPress 'r' to restart", width/2, height/2);
            }
            if(keyPressed) {
                if(key == '6') {
                    s.rotate(5);
                }
                if(key == '4') {
                    s.rotate(-5);
                }
                if(key == '5') {
                    s.accelerate(.1);
                }
            }
        }
    }
    
    public void mouseClicked() {
        if (mouseX > 255 && mouseX < 345 && mouseY > 305 && mouseY < 340)
            title = false;
        if (mouseX > 155 && mouseX < 445 && mouseY > 405 && mouseY < 440) {
            title = false;
            intro = true;
        }
        if(mouseX > 10 && mouseX < 65 && mouseY > 555 && mouseY < 575) {
            title = true;
            intro = false;
        }
    }
    
    public void keyReleased() {
        if(key == '2') {
            s.setX((int)(Math.random()*580+10));
            s.setY((int)(Math.random()*580+10));
            s.setDirectionX(0);
            s.setDirectionY(0);
            s.setPointDirection((int)(Math.random()*361));
        }
        if(gameOver == false) {
            if(key == ' ') {
                shots.add(new Bullet(s));
            }
        }
        if(key == 'r') {
            if(gameOver == true) {
                if(gameOver == true) {
                    for(int i = space.size() - 1; i >= 0; i--) {
                        space.remove(i);
                    }
                    for(int i = shots.size() - 1; i >= 0; i--) {
                        shots.remove(i);
                    }
                }
                for(int i = 0; i < n; i++) {
                    space.add(new Asteroid());
                }
                s.setX(300);
                s.setY(300);
                s.setPointDirection(0);
                s.setDirectionX(0);
                s.setDirectionY(0);
                count = 0;
                gameOver = false;
            }
        }
    }
    
    abstract class Floater
    {
        protected int corners;  //the number of corners, a triangular floater has 3
        protected int[] xCorners;
        protected int[] yCorners;
        protected int myColor;
        protected int myStroke;
        protected double myCenterX, myCenterY; //holds center coordinates
        protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
        protected double myPointDirection; //holds current direction the ship is pointing in degrees

        abstract public void setX(int x);
        abstract public int getX();
        abstract public void setY(int y);
        abstract public int getY();
        abstract public void setDirectionX(double x);
        abstract public double getDirectionX();
        abstract public void setDirectionY(double y);
        abstract public double getDirectionY();
        abstract public void setPointDirection(int degrees);
        abstract public double getPointDirection();

        public void accelerate (double dAmount)
        {  
            //Accelerates the floater in the direction it is pointing
            //(myPointDirection)

            //convert the current direction the floater is pointing to radians
            double dRadians =myPointDirection*(Math.PI/180);

            //change coordinates of direction of travel
            myDirectionX += ((dAmount) * Math.cos(dRadians));
            myDirectionY += ((dAmount) * Math.sin(dRadians)); 
        }
        void rotate (int nDegreesOfRotation)
        {  
            //rotates the floater by a given number of degrees
            myPointDirection+=nDegreesOfRotation;
        }
        public void move ()
        {  
            //Moves the floater towards the coordinates
            //myDirectionX and myDirectionY

            //move the floater in the current direction of travel
            myCenterX += myDirectionX;
            myCenterY += myDirectionY;

            //wrap around screen
            if(myCenterX >width){
                myCenterX = 0;
            }
            else if (myCenterX<0){
                myCenterX = width;
            }
            if(myCenterY >height){
                myCenterY = 0;
            }
            else if (myCenterY < 0){
                myCenterY = height;
            }
        }
        public void show ()
        {  
            //Draws the floater at the current position

            fill(myColor);
            stroke(myStroke);
            //convert degrees to radians for sin and cos     
            double dRadians = myPointDirection*(Math.PI/180);
            
            int xRotatedTranslated, yRotatedTranslated;
            beginShape();

            //rotate and translate the coordinates of the floater using current direction   
            for(int nI = 0; nI < corners; nI++)
            {
                xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
                yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
                vertex(xRotatedTranslated,yRotatedTranslated);
            }
            endShape(CLOSE);
        }
    }
    
    public class Spaceship extends Floater {
        public Spaceship() {
            corners = 3;
            xCorners = new int[corners];
            yCorners = new int[corners];
            xCorners[0] = -8;
            yCorners[0] = 8;
            xCorners[1] = 16;
            yCorners[1] = 0;
            xCorners[2] = -8;
            yCorners[2] = -8;
            myColor = color(255);
            myCenterX = 300;
            myCenterY = 300;
            myDirectionX = 0;
            myDirectionY = 0;
            myPointDirection = 0;
        }
        public void setX(int x) {myCenterX = x;}
        public int getX() {return (int)myCenterX;}
        public void setY(int y){myCenterY = y;}
        public int getY(){return (int)myCenterY;}
        public void setDirectionX(double x){myDirectionX = x;}
        public double getDirectionX(){return myDirectionX;}
        public void setDirectionY(double y){myDirectionY = y;}
        public double getDirectionY(){return myDirectionY;}
        public void setPointDirection(int degrees){myPointDirection = degrees;}
        public double getPointDirection(){return myPointDirection;}
    }
    
    public class Star {
        private double myX, myY;
        private int siz, clr;
        public Star() {
            myX = Math.random()*600;
            myY = Math.random()*600;
            siz = (int)(Math.random()*5)+1;
            clr = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        }
        public void show() {
            stroke(clr);
            fill(clr);
            ellipse((float)myX, (float)myY, siz, siz);
        }
    }
    
    public class Asteroid extends Floater {
        private int rotSpeed;
        public Asteroid() {
            corners = 5;
            xCorners = new int[corners];
            yCorners = new int[corners];
            xCorners[0] = 0;
            yCorners[0] = -15;
            xCorners[1] = 15;
            yCorners[1] = -10;
            xCorners[2] = 12;
            yCorners[2] = 12;
            xCorners[3] = -10;
            yCorners[3] = 12;
            xCorners[4] = -15;
            yCorners[4] = -12;
            myColor = color(0);
            myStroke = color(255);
            int tempX = (int)(Math.random()*550) + 25;
            int tempY = (int)(Math.random()*550) + 25;
            while (tempX < 400 && tempX > 200 && tempY < 400 && tempY > 200) {
                tempX = (int)(Math.random()*550) + 25;
                tempY = (int)(Math.random()*550) + 25;
            }
            myCenterX = tempX;
            myCenterY = tempY;
            myDirectionX = Math.random()*6 - 3;
            myDirectionY = Math.random()*6 - 3;
            myPointDirection = 0;
            rotSpeed = 3;
        }
        public void move() {
            rotate(rotSpeed);
            super.move();
        }
        public void setX(int x) {myCenterX = x;}
        public int getX() {return (int)myCenterX;}
        public void setY(int y){myCenterY = y;}
        public int getY(){return (int)myCenterY;}
        public void setDirectionX(double x){myDirectionX = x;}
        public double getDirectionX(){return myDirectionX;}
        public void setDirectionY(double y){myDirectionY = y;}
        public double getDirectionY(){return myDirectionY;}
        public void setPointDirection(int degrees){myPointDirection = degrees;}
        public double getPointDirection(){return myPointDirection;}
    }
    
    public class Bullet extends Floater {
        private int sec;
        Bullet(Spaceship theShip) {
            myColor = color(255);
            myCenterX = theShip.getX();
            myCenterY = theShip.getY();
            myPointDirection = theShip.getPointDirection();
            double dRadians = myPointDirection*(Math.PI/180);
            myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
            myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
            sec = millis();
        }
        public void show() {
            fill(myColor);
            ellipse((float)myCenterX, (float)myCenterY, 5,5);
        }
        public int getM() {return sec;}
        public void setX(int x) {myCenterX = x;}
        public int getX() {return (int)myCenterX;}
        public void setY(int y){myCenterY = y;}
        public int getY(){return (int)myCenterY;}
        public void setDirectionX(double x){myDirectionX = x;}
        public double getDirectionX(){return myDirectionX;}
        public void setDirectionY(double y){myDirectionY = y;}
        public double getDirectionY(){return myDirectionY;}
        public void setPointDirection(int degrees){myPointDirection = degrees;}
        public double getPointDirection(){return myPointDirection;}
    }
