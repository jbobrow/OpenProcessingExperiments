
import java.util.ArrayList;

final int DOT_COUNT = 1000;
final int MOVING_IN_FLIP_COUNT = 120;
final int MOVING_OUT_FLIP_COUNT = 60;
final float MOVE_IN_VELOCITY = 5.0f;
final float MOVE_OUT_VELOCITY = 8.0f;
boolean movingIn = true;
int frame = 0;

public class Dot {
    private float x;
    private float y;
    private Dot target;
    private boolean isScattering;
    private float scatterX;
    private float scatterY;
    private float velocity;

    public Dot(float xPos, float yPos) {
        x = xPos;
        y = yPos;
        target = null;
        isScattering = false;
        scatterX = 0.0f;
        scatterY = 0.0f;
        velocity = MOVE_IN_VELOCITY;
    }

    public float getX() {
        return x;
    }

    public void setX(float xPos) {
        x = xPos;
    }

    public float getY() {
        return y;
    }

    public void setY(float yPos) {
        y = yPos;
    }

    public void setVelocity(float vel) {
        velocity = vel;
    }

    public void setTarget(Dot t) {
        target = t;
    }

    public void scatter() {
        isScattering = true;
        scatterX = random(-1, 1);
        scatterY = random(-1, 1);
    }

    public void regroup() {
        isScattering = false;
    }

    public void draw() {
        point(x, y);
        //if (target1 != null) {
            //line(x, y, target1.getX(), target1.getY());
        //}
    }

    public void update() {
        if(isScattering == true) {
            updateScatter();
        } else {
            updateGrouping();
        }

    }

    public void updateScatter() {
        x = x + scatterX * velocity;
        y = y + scatterY * velocity;

        if(x < 0) {
            x = -x;
            scatterX = -scatterX;
        } else if(x > width) {
            x = width - (x - width);
            scatterX = -scatterX;
        }

        if(y < 0) {
            y = -y;
            scatterY = -scatterY;
        } else if(y > height) {
            y = height- (y - height);
            scatterY = -scatterY;
        }
    }

    public void updateGrouping() {
        float destX = target.getX();
        float destY = target.getY();

        // If we are close enough to the destination then just move there
        float distance = sqrt(sq(destX - x) + sq(destY - y));
        if(distance <= velocity) {
            x = destX;
            y = destY;
            return;
        }

        float dirX = (destX - x) / distance;
        float dirY = (destY - y) / distance;

        x = x + dirX * velocity;
        y = y + dirY * velocity;
    }
}

ArrayList<Dot> dots;

void setup() {
    size(480, 320);
    colorMode(HSB, 100);

    dots = new ArrayList<Dot>();

    for(int i = 0; i < DOT_COUNT; i++) {
        dots.add(new Dot(random(0, width), random(0, height)));
    }

    for(int i = 0; i < DOT_COUNT; i++) {
        int targetId = i;
        while(targetId == i) {
            targetId = (int)floor(random(0, DOT_COUNT));
        }

        dots.get(i).setTarget(dots.get(targetId));
    }

    frame = 0;
}

void update() {
    for(int i = 0; i < DOT_COUNT; i++) {
        dots.get(i).update();
    }

    frame = frame + 1;

    if(movingIn == true) {
        if(frame > MOVING_IN_FLIP_COUNT) {
            for(int i = 0; i < DOT_COUNT; i++) {
                dots.get(i).scatter();
                dots.get(i).setVelocity(MOVE_OUT_VELOCITY);
            }
            movingIn = !movingIn;
            frame = 0;
        }
    } else {
        if(frame > MOVING_OUT_FLIP_COUNT) {
            for(int i = 0; i < DOT_COUNT; i++) {
                dots.get(i).regroup();
                dots.get(i).setVelocity(MOVE_IN_VELOCITY);
            }
            movingIn = !movingIn;
            frame = 0;
        }
    }
}

void draw() {
    update();

    background(0, 0, 100);

    for(int i = 0; i < DOT_COUNT; i++) {
        dots.get(i).draw();
    }
}
