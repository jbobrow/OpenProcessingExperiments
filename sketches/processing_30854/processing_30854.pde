
class CommandNode extends Node
{
  Node next;
  String imgPath;
  PImage img;
  
  public CommandNode(String aTitle, String aImagePath, String anAudPath, Node aNext)
  {
    super(aTitle, anAudPath);
    imgPath = aImagePath;
    next = aNext;
    
    if(testing)
      loadImg(imgPath);
  }
  public CommandNode(String aTitle, String aImagePath, String anAudPath)
  {
    this(aTitle, aImagePath, anAudPath, null);
  }
  
  public void start()
  {
    super.start();
    img = loadImg(imgPath);
  }
  
  public void linkTo(Node aNext)
  {
    next = aNext;
  }
  
  public void show()
  {
    image(img, 0, headerHeight, width, height - headerHeight);
    
    super.show();
    
    noStroke();
    fill(mousePressed);
    showButton("Next", 0, height - buttonHeight, width);
  }
  
  void mousePressed()
  {
    gotoNode(next);
  }
  
  public CommandNode clone(Node aNext)
  {
    return new CommandNode(title, imgPath, audPath, aNext);
  }
  public CommandNode clone()
  {
    return clone(next);
  }
}

