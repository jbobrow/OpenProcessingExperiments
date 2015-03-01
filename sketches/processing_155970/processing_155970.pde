
public class OrbittingCircle
{
  private PApplet Simon;

  private PVector position;
  private int magnitude;
  private int theta;

  public OrbittingCircle(PApplet p)
  {
    this(p, 90, 0);
  }

  public OrbittingCircle(PApplet p, int magnitude, int theta)
  {
    this.Simon = p;

    this.magnitude = magnitude;

    this.theta = theta;

    this.position = new PVector( (float)((double)(magnitude) * Math.cos(Math.toRadians(theta)) ), 
    ( (float)((double)(magnitude) * Math.sin(Math.toRadians(theta)) ) ) );
  }

  public void Show()
  {
    Simon.translate(Simon.width / 2, Simon.height / 2);

    ellipse(position.x, position.y, 20, 20);

    Simon.translate(-Simon.width / 2, -Simon.height / 2);

    position.x = magnitude * (float)(Math.cos( Math.toRadians(theta) ));
    position.y = magnitude * (float)(Math.sin( Math.toRadians(theta) ));

    if (theta < 360)
      theta+=5;
    else
      theta = 0;
  }
};


