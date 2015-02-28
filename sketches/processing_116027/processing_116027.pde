
class Missile extends MassedBeing {

    private final PApplet parent;
    private final PImage sprite;
    private final int    speed;

    private PVector target;
    private float   angle;

    Missile(PApplet parent, PVector location, PVector size, PhysicsInfo physicsInfo, String imgPath)  {
        super(new hermes.hshape.Rectangle(location.x, location.y, size.x, size.y),
              physicsInfo.getInitVel(),
              physicsInfo.getMass(),
              physicsInfo.getElasticity());

        speed       = physicsInfo.getSpeed();
        this.parent = parent;
        target      = null;
        sprite      = parent.loadImage(imgPath);
    }

    public void launch(PVector target) {
        this.target = target;

        // Update the velocity with the correction
        setVelocity(getUpdatedVector());
    }

    PVector getUpdatedVector() {
        PVector targetVector = new PVector(target.x - getX(), target.y - getY());

        // Get the angle(in degrees) of  the current vector and the target vector
        angle = (float) atan2(targetVector.y, targetVector.x);

        // Amount to change the velocity by to be on course to the target
        return new PVector((float) cos(angle) * speed, (float) sin(angle) * speed);
    }

    @Override
    public void draw() {
        parent.pushMatrix();

        // The original missile angle(90 degrees) plus the angle of correction
        parent.rotate(PApplet.radians(90));
        parent.rotate(angle);

        parent.image(sprite, 0, 0, sprite.width, sprite.height);

        parent.popMatrix();
    }
}

class BasicMissile extends Missile {

    private static final float  WIDTH       = 19;
    private static final float  HEIGHT      = 49;
    private static final int    SPEED       = 800;
    private static final String MISSILE_PNG = "missile.png";
    private static final int    MASS        = 1;
    private static final int    ELASTICITY  = 1;

    BasicMissile(PApplet parent, int x, int y) {
        super(parent,
              new PVector(x, y),
              new PVector(WIDTH, HEIGHT),
              new PhysicsInfo(new PVector(0, 0), MASS, ELASTICITY, SPEED),
              MISSILE_PNG);
    }
}

class GuidedMissile extends Missile {

    private static final int    WIDTH      = 19;
    private static final int    HEIGHT     = 49;
    private static final int    MASS       = 1;
    private static final int    ELASTICITY = 1;
    private static final int    SPEED      = 800;
    private static final int    INIT_X_VEL = 0;
    private static final int    INIT_Y_VEL = 0;
    private static final String IMG_PATH   = "missile.png";

    GuidedMissile(PApplet parent, int x, int y) {

        super(parent,
              new PVector(x, y),
              new PVector(WIDTH, HEIGHT),
              new PhysicsInfo(new PVector(INIT_X_VEL, INIT_Y_VEL), MASS, ELASTICITY, SPEED),
              IMG_PATH);
    }

    @Override
    protected void update() {
        super.update();

        setVelocity(getUpdatedVector());
    }
}

public class Ufo extends MassedBeing {
    private static final int WIDTH  = 102;
    private static final int HEIGHT = 38;

    private final PApplet parent;
    private final PImage  sprite;

    public Ufo(PApplet parent, int x, int y) {
        this(parent, x, y, 0, 0);
    }

    public Ufo(PApplet parent, int x, int y, int xVel, int yVel) {
        super(new hermes.hshape.Rectangle(x, y, WIDTH, HEIGHT),
              new PVector(xVel, yVel), 10, 10);

        this.parent = parent;
        this.sprite = parent.loadImage("ufo_pr.png");
    }
    @Override
    public void draw() {
        parent.image(sprite, 0, 0, WIDTH, HEIGHT);
    }
}

public class Explosion extends Being {
    private static final int WIDTH    = 68;
    private static final int HEIGHT   = 95;
    private static final int LIFETIME = 1000;

    private boolean expired;

    private final long           created;
    private final AnimatedSprite sprite;
    private final PApplet        parent;

    boolean isExpired() {
        return expired;
    }

    public Explosion(PApplet parent, PVector location, Animation animation) {
        super(new hermes.hshape.Rectangle(location.x, location.y, WIDTH, HEIGHT));

        created = System.currentTimeMillis();

        this.parent    = parent;

        sprite = new AnimatedSprite();
        sprite.addAnimation(animation);
        sprite.setActiveAnimation(0);
    }

    @Override
    public void draw() {
        super.draw();

        if(!expired) {
            parent.image(sprite.animate(), -(WIDTH / 2), -(HEIGHT / 2), WIDTH, HEIGHT);
        }
    }

    @Override
    protected void update() {
        super.update();

        expired = System.currentTimeMillis() - created > LIFETIME;
    }
}

