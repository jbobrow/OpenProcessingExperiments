
public final static int num = 250;
    Point[] some = new Point[num];
    
    public void setup() {
        size(800,800);
        for (int i = 0; i < num; i++) {
            if (i <= 10) {
                some[i] = new Odd();
            }
            else if (i <= 20) {
                some[i] = new Jumbo();
            }
            else {
                some[i] = new Particle();
            }
        }
        background(0);
    }

    public void draw() {
        fill(0,0,0,120);
        rect(0,0,width,height);
        for (int i = 0; i < num; i++) {
            some[i].show();
            some[i].move();
        }
    }
    
    interface Point {
        public void move();
        public void show();
    }
    
    class Particle implements Point {
        protected double x, y, angle, speed;
        protected int clr, sizeX, sizeY;
        public Particle() {
            x = width/2;
            y = height/2;
            angle = Math.random() * 6 * Math.PI;
            speed = Math.random() * 5;
            sizeX = 10;
            sizeY = 10;
            clr = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
        }
        public void move() {
            x = x + Math.cos(angle) * speed;
            y = y + Math.sin(angle) * speed;
            angle = angle + .03;
            if(speed < 7) {
                speed += .02;
            }
            else {
                speed -= .01;
            }
        }
        public void show() {
            fill(clr);
            ellipse((float)x, (float)y, sizeX, sizeY);
        }
    }
    
    class Jumbo extends Particle {
         public Jumbo() {
            sizeX = 25;
            sizeY = 25;
        }
    }
    
    class Odd implements Point {
        private double x, y, angle, speed;
        private int clr;
        public Odd() {
            x = width/2;
            y = height/2;
            angle = Math.random() * 6 * Math.PI;
            speed = Math.random() * 5;
            clr = color(255);
        }
        public void move() {
            x = x + Math.cos(angle) * speed;
            y = y + Math.sin(angle) * speed;
            if (x >= 790) {
                angle = (Math.random() * 2 * Math.PI + 1) / 2;
            }
            else if (x <= 0) {
                angle = (Math.random() * 2 * Math.PI + 3 * Math.PI) / 2;
            }
            if (y >= 790) {
                angle = (Math.random() * Math.PI + Math.PI);
            }
            else if (y <= 0) {
                angle = Math.random() * Math.PI;
            }
        }
        public void show() {
            fill(clr);
            rect((float)x, (float)y, 10, 10);
        }
    }
