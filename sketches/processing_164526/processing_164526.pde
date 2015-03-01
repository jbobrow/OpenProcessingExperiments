
boolean onOne = false;
boolean onTwo = false;
boolean onThree = false;
boolean onFour = false;
int butXOne = 0;
int butY = 0;
int butW = 125;
int butH = 125;
int butXTwo = 125;
int butXThree = 250;
int butXFour = 375;
int winX = 500;
int winY = 500;
PImage webImgCamera;
PImage webImgMusic;
PImage webImgFood;
PImage webImgDesign;

void setup(){
    size (winX, winY+butH);
    String urlCamera = "http://www.dpreview.com/previews/canon-eos-70d/images/frontpage.jpg";
    webImgCamera = loadImage (urlCamera, "jpeg");
    String urlMusic = "https://pbs.twimg.com/media/BwHplicCYAA_PHG.jpg:large";
    webImgMusic = loadImage (urlMusic, "jpeg");
    String urlFood = "http://1.bp.blogspot.com/-BmFe2J3ma1o/UG37ImkVSKI/AAAAAAAANOU/c3ox9eJG19M/s1600/IMG_0947+copy.jpg";
    webImgFood = loadImage (urlFood, "jpeg");
    String urlDesign = "http://www.smashingmagazine.com/wp-content/uploads/2014/10/scad-low-fidelity-prototype-large-preview.jpg";
    webImgDesign = loadImage (urlDesign, "jpeg");
    background (255,255,255);
}

void draw() {
  fill (255,204,0);
  rect (butXOne, butY, butH, butW);
  fill (153,27,30);
  rect (butXTwo, butY, butH, butW);
  fill (255, 83, 13);
  rect (butXThree, butY, butH, butW);
  fill (0,0,0);
  rect (butXFour, butY, butH, butW);
  if (onOne){
    image (webImgCamera, 0, butH, winX, winY);
  }
  if (onTwo){
    image (webImgMusic, 0, butH, winX, winY);
  }
  if (onThree){
    image (webImgFood, 0, butH, winX, winY);
  }
  if (onFour){
    image (webImgDesign, 0, butH, winX, winY);
  }
}
    
void mousePressed() {
  if (mouseX > butXOne && mouseX < butXOne + butW
  && mouseY > butY && mouseY < butY + butH) {
    onOne = !onOne;
    onTwo = false;
    onThree = false;
    onFour = false;
  }
  if (mouseX > butXTwo && mouseX < butXTwo + butW
  && mouseY > butY && mouseY < butY + butH) {
    onTwo = !onTwo;
    onOne = false;
    onThree = false;
    onFour = false;
  }
  if (mouseX > butXThree && mouseX < butXThree + butW
  && mouseY > butY && mouseY < butY + butH) {
    onThree = !onThree;
    onTwo = false;
    onOne = false;
    onFour = false;
  }
  if (mouseX > butXFour && mouseX < butXFour + butW
  && mouseY > butY && mouseY < butY + butH) {
    onFour = !onFour;
    onTwo = false;
    onThree = false;
    onOne = false;
  }
  if (mouseX > butXOne && mouseX < winX
  && mouseY > butH && mouseY < winY) {
    onOne = false;
    onTwo = false;
    onThree = false;
    onFour = false;
    fill (255,255,255);
  }
}
