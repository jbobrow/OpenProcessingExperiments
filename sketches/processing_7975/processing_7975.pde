
    ArrayList drops; 

    int MAX_DROPS = 500; // max number of drops
    int MAX_AGE = 5; // max age in seconds
 
    void setup() {
        size(600, 200);
        background(192);
        drops = new ArrayList();
        drops.add(
                new Drop((int) random(width), (int) random(height),
                (int) random(0, 30))); 
        smooth();
    }

    void draw() {	
  
        for (int i = drops.size() - 1; i >= 0; i--) {
 
            Drop drop = (Drop) drops.get(i);

            drop.display();
 
            // remove drop dry
            if (drop.dry()) {
                drops.remove(i);
            }
 
        }
  
        if (drops.size() < MAX_DROPS) {
            for (int i = 0; i < (int) random(10); i++) {
  
                drops.add(
                        new Drop((int) random(width), (int) random(height),
                        (int) random(0, 30))); 
            }
        }
  
        filter(BLUR, 1);
  
    }

    class Drop {
        int x, y, r, a, t;
        Drop(int x_, int y_, int r_) {

            x = x_;
            y = y_;
            r = r_;
            a = t = millis();

        }

        void display() {

            // ellipseMode(CENTER);
            noStroke();
            fill(255);
            ellipse(x, y, r, r);
            // reduce radius every 2 seconds
            if ((millis() - t) > 250) {
                t = millis();
                y += 2;
                r -= 0.05f * r;
            }

        }

        boolean dry() {

            if ((millis() - a) > MAX_AGE * 1000) {
                return true;
            }
            return false;
        }
    }

