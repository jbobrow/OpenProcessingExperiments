
    public int width = 500;
    public int height = 600;
    
    public float xPos = width / 2;
    public float yPos = height / 2;
    
    public int storeTime = 0;
    public int milliCount = 0;
   
    PImage level;
    PImage troll;
    PImage scary;
    
    
public void setup() {  //setup function called initially, only once
  size(width, height);
  background(255, 0, 0);  //set background white  
  level = loadImage("http://gwydir.demon.co.uk/jo/maze/design/drmaze4.gif");
  troll = loadImage("http://toychop.files.wordpress.com/2011/01/troll-face-meme.png"));
  scary = loadImage("http://1.bp.blogspot.com/-1eVMM7_MPlA/TbYFWdkaHgI/AAAAAAAAIPI/gNE-2zAhX-I/s1600/barlow.jpg");
}

public void draw() {  //draw function loops 
  image(level, 0, 0, width, 500);
}
