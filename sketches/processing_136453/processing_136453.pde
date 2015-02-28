
public final static int num = 250;
    Particle [] part = new Particle[num];
    
    public void setup() {
        size(800,800);
        for(int i = 0; i < num; i++) {
            part[i] = new Particle();
        }
    }

    public void draw() {
        background(0);
        for(int i = 0; i < num; i++) {
            part[i].move();
            part[i].show();
        }
    }
    
    class Particle {
        double x, y, speed, angle;
        int clr;
        Particle() {
            x = width/2;
            y = height/2;
            speed = Math.random() * 10;
            angle = Math.random() * 6 * Math.PI;
            clr = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
        }
        void move() {
            x = x + Math.cos(angle) * speed;
            y = y + Math.sin(angle) * speed;
            angle = angle + .05;
            if (speed < 8) {
                speed = speed + .01;
            }
            else {
                speed = speed - .01;
            }
        }
        void show() {
            fill(clr);
            ellipse((float)x,(float)y,7,7);
        }
    }
