

class ImageSelector {


  float gridSection; 
  PImage[] imageArray;
  Thumbnail[] thumbArray;
  int  selectedIndex = 0;
  int newIndex = -1;
  Rectangle panel;
  float panelAlpha=0;
  float thumbAlpha=0;
  private String state;



  public ImageSelector(PImage[] imageArray) {
    this.imageArray = imageArray;
    thumbArray = new Thumbnail[imageArray.length];
    for (int i = 0; i < thumbArray.length; i++) {
      thumbArray[i] = new Thumbnail(imageArray[i]);
    }
    gridSection = width/48;
    panel = new Rectangle();
    panel.width = ((width / 4)) + PANEL_MARGIN;
    panel.height = (width / 4) + PANEL_MARGIN;
    panel.corner.x = width / 2 - panel.width / 2;
    panel.corner.y = height / 2 - panel.height / 2;
  }

  public PImage getImage() {
    return imageArray[selectedIndex];
  }
  public PImage getImage(int index) {
    return imageArray[index];
  }

  public void update() {
    if (state == "OPENING") {
      if (panelAlpha < MAX_PANEL_ALPHA) {
        panelAlpha += MAX_PANEL_ALPHA/ALPHA_STEPS;
        thumbAlpha += MAX_IMAGE_ALPHA/ALPHA_STEPS;
      }      
      else {
        state = "OPEN";
      }
    }
    if (state == "CLOSING") {
      if (panelAlpha > 0) {
        panelAlpha -= MAX_PANEL_ALPHA/ALPHA_STEPS;
        thumbAlpha -= MAX_IMAGE_ALPHA/ALPHA_STEPS;
      }
      else {
        state = "CLOSED";
      }
    }

    int rows = 3;
    int columns = 3;
    for (int j = 0; j < rows; j++) {
      for (int k = 0; k < columns; k++) {
        float baseX = panel.corner.x + thumbnailPoint(k);
        float baseY = panel.corner.y  + thumbnailPoint(j);
        float enlargement = enlargeThumbnail(baseX, baseY);
        Rectangle sizeRect = new Rectangle(0,0,2*gridSection +enlargement, 2*gridSection + enlargement); 
        Rectangle imgRect = new Rectangle(0,0,getImage(3*j + k).width, getImage(3*j + k).height);
        Rectangle fitRect = sizeRect.sizeToFill(imgRect);
        thumbArray[3*j + k].setCorner(baseX - fitRect.width/2, baseY - fitRect.height/2);
        thumbArray[3*j + k].setCorner2(baseX + fitRect.width/2, baseY + fitRect.height/2);
      }
    }
  }
  public void draw() {

    noStroke();
    if (newIndex != -1) {
      Rectangle sizeRect = new Rectangle(0,0,width, height);
      Rectangle imgRect = new Rectangle(getImage(newIndex));
      Rectangle fitRect = sizeRect.sizeToFill(imgRect);
      pushMatrix();
      pushStyle();
      imageMode(CENTER);
      tint(255, imageAlpha);
      image(getImage(newIndex), width/2, height/2, fitRect.width, fitRect.height);
      popMatrix();
      popStyle();
    }

    pushMatrix();
    pushStyle();
    fill(50, 50, 50, panelAlpha);
    rect(panel.corner.x, panel.corner.y, panel.width, panel.height);
    popStyle();
    popMatrix();

    for (int i = 0; i < thumbArray.length; i++) {
      thumbArray[i].draw(thumbAlpha);
    }
  }

  public void mouseReleased() {
    for (int i = 0; i < thumbArray.length; i++) {
      if (mouseX  > thumbArray[i].corner.x && mouseX < thumbArray[i].corner2.x && mouseY > thumbArray[i].corner.y  && mouseY < thumbArray[i].corner2.y && newIndex == -1) {
        newIndex = i;
      }
    }
  }


  public float enlargeThumbnail(float x, float y) {
    float enlarge = 1 + dist(x, y, mouseX, mouseY)/200;
    return ((1/enlarge) * gridSection)/2;
  }

  public float thumbnailPoint(int i) {
    return 2*gridSection + (4 * i * gridSection);
  }
  public void open() {
    state = "OPENING";
  }

  public void close() {
    state = "CLOSING";
  }

  public String getState() {
    return state;
  }
}


