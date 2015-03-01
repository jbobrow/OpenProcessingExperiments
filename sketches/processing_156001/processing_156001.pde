
import java.awt.Color;

/**
 * This is a circle. It is actually an ellipse in disguise, but its purpose is
 * to show how to detect when two round objects collide.
 * 
 * @author Art Margatroid
 * 
 */
public class Circle
{
  /**
   * First and foremost, I've noticed that most people on the OpenProcessing
   * website don't use proper encapsulation when writing their code, and that is
   * totally okay if they are starting out.<br/>
   * <br/>
   * However, it becomes important later on to encapsulate your code with the
   * private, protected, and public modifiers. They have no effect in Processing,
   * but they are part of good programming practices.
   */

  private final PApplet Parent;

  private PVector position;
  private Color col;

  private int _radius;
  private int strokeSize;

  /**
   * Creates a hollow circle basing its center and color on the constructor's
   * arguments.
   * 
   * @param p
   *            Pass PApplet. Although you don't need to do this in the
   *            Processing IDE, when you use Eclipse's Proclipsing, this is
   *            required. This ensure maximum compatibility between the two
   *            IDEs.
   * @param position
   *            The position in (x, y) for the center of the circle.
   * @param col
   *            The color of the outer ring of the circle.
   */
  public Circle(PApplet p, PVector position, Color col)
  {
    this(p, position, col, 25, 5);
  }

  /**
   * Creates a hollow circle basing its center, color, radius, and size of the
   * outer ring on the constructor's arguments.
   * 
   * @param p
   *            Pass PApplet. Although you don't need to do this in the
   *            Processing IDE, when you use Eclipse's Proclipsing, this is
   *            required. This ensure maximum compatibility between the two
   *            IDEs.
   * @param position
   *            The position in (x, y) for the center of the circle.
   * @param col
   *            The color of the outer ring of the circle.
   * @param _radius
   *            The radius (not diameter) of the circle.
   * @param strokeSize
   *            The width of the circle.
   */
  public Circle(PApplet p, PVector position, Color col, int _radius, int strokeSize)
  {
    this.Parent = p;
    this.position = position;
    this.col = col;
    this._radius = _radius;
    this.strokeSize = strokeSize;
  }

  /**
   * The method displays a circle based on its color and radius. 
   */
  public void Show()
  {
    Parent.smooth();
    Parent.noFill();
    Parent.strokeWeight(strokeSize);
    Parent.stroke(col.getRed(), col.getGreen(), col.getBlue());

    Parent.ellipse(position.x, position.y, _radius * 2, _radius * 2);
  }

  /**
   * The method will make checks to see whether the two circles collide base
   * on their positions, radius, and outer ring sizes.
   * 
   * @param circle
   *            The other circle used to test for an intersection.
   * @return Whether or not the two circles collide.
   */
  public boolean DetectCollide(Circle circle)
  {
    if (circle.equals(this))
    {
      // Unused code. Do not throw exceptions unless you know how to deal with certain
      // situations.
      //
      // throw new IllegalArguementException("The circle cannot inspect itself.");
      //
      return false;
    }
    else
    {
      double sideX = Math.pow(circle.GetPosition().x - position.x, 2);
      double sideY = Math.pow(circle.GetPosition().y - position.y, 2);

      // The hypotenuse calculated using the two sides.
      //
      double hypo = Math.sqrt(sideX + sideY);

      if (hypo < (_radius + strokeSize) + circle.GetRadius())
      {
        return true;
      }
    }
    return false;
  }

  /**
   * As a part of using encapsulation, make sure you add Getters and Setters to
   * have outside access to the code. This ensures that any data type change to
   * the variable can be handled by the getter and setter.<br/>
   * <br/>
   * For example, imagine writing really long code with a public int, then
   * changing the int into a float. This means you have to cast each individual
   * call to the int with a float.
   */

  public Color GetColor()
  {
    return this.col;
  }

  public void SetColor(Color col)
  {
    // I don't want 'col' to be null, so...
    //
    if (col == null)
    {
      throw new IllegalArgumentException("The color cannot be null.");
    }
    this.col = col;
  }

  public PVector GetPosition()
  {
    return this.position;
  }

  public int GetRadius()
  {
    return this._radius;
  }
}; // This semicolon is here for the purpose of C++ fanatics. It does nothing here.


