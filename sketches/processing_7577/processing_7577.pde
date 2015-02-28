
/**
 * spxlSimpleSelector
 * 2010-02-12 by subpixel
 * http://subpixels.com
 *
 * Grid of objects (potentially image thumbnails) which
 * can be clicked on with the mouse.
 *
 * Demonstrate converting mouse location into item index
 * without having to specifically remember individual
 * item locations.
 *
 * Also got a little frisky with the display!
 *
 * Click once to select.
 * Click a second time to launch http:// link.
 */

final int ROWS = 4;
final int COLS = 6;
final int ITEMS = ROWS * COLS;

int itemW, itemH; // item width, height

int selectedItem = -1;

final String _1 = "spxl.tv";
final String _2 = "subpixels.com";
final String _3 = "processing.org";

final String[] something = new String[] // URLs, perhaps?
{
  _1,_2,_3,_1,_2,_3,_2,_3,_1,_2,_3,_1,_3,_1,_2,_3,_1,_2,_1,_2,_3,_1,_2,_3
};

void setup()
{
  size(600, 400, JAVA2D);
  itemW = width / COLS;
  itemH = height / ROWS;
  
  textFont(createFont("",itemH/4,true)); // default font
}

void draw()
{
  background(0);
  for (int i = 0; i < ITEMS; i++)
  {
    int x = (i%COLS)*itemW; // left
    int y = (i/COLS)*itemH; // top

    // Distance of mouse from centre of item
    float d = dist(x+itemW/2, y+itemH/2, mouseX, mouseY);

    if (i == selectedItem)
      fill(127+50*sin(millis()*0.01),0,0); // flashing!
    else
      fill(200/(d/50+1)); // closer to mouse -> lighter shade

    rect(x,y,itemW,itemH);

    fill(255); // white text
    text(i+":\n"+something[i], x+10, y+10, itemW-20, itemH-20);
  }
}

void mouseClicked()
{
  int prevClicked = selectedItem;
  int col = mouseX / itemW;
  int row = mouseY / itemH;
  selectedItem = col + row * COLS;
  if (selectedItem == prevClicked)
    link("http://" + something[selectedItem], "_new");
}


