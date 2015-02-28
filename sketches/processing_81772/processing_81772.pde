

class Input 
{

  // INSTANCE VARIABLES
  private String city;
  private String rad;

  // CONSTRUCTOR
  public Input()
  {
    city = "";
    rad = "";
  }

  // METHODS
  public void cityInput()
  {
    if (key > '0' && key < '9')
    {
      switch(key) {
        case BACKSPACE:
          rad = rad.substring(0, max(0, rad.length() - 1));
          break;
        case ENTER:
        case RETURN:
          break;
        default:
          rad += key;
      }
    }
    if (key!= CODED)  {
      switch(key) {
      case BACKSPACE:
        city = city.substring(0, max(0, city.length()-1));
        break;
      case ENTER:
      case RETURN:
        break;
      default:
        city += key;
      }
    }
  }


  public void radInput()
  {
    if (key != CODED)
    {
      switch(key) {

      case BACKSPACE: 
        rad = rad.substring(0, max(0, rad.length()-1));
        break;
      case ENTER:
      case RETURN:
        break;
      default:
        rad += key;
      }
    }
  }

  private String getCity()
  {
    return city;
  }

  void displayInput()
  {
    text("Please enter a keyword: ", width/2 - 20, 20);
    fill(70, 50, 90);
    text(getCity(), width/2, 50);
  }
}


