
//UCLA SUMMER 2012
//by Elaine Zhao

//--------------------------variable------------------------------
PImage squirrel1;//the squirrel sitting on the tree
PImage squirrel2;//the squirrel normal
PImage squirrel3;//the squirrel falling
PImage arm;
PImage branch;
PImage cone;
PImage leaves;
PImage grass;
PImage cactus;
PFont font;
int i;

void setup() {
  size(600, 300);
  smooth();
  imageMode(CORNER);
  frameRate(2);

  //load all images
  squirrel1 = loadImage("squirrel-1.png");
  squirrel2 = loadImage("squirrel-2.png");
  squirrel3 = loadImage("squirrel-3.png");
  arm = loadImage("squirrel-arm.png");
  branch = loadImage("branch.png");
  cone = loadImage("cone.png");
  leaves = loadImage("leaves.png");
  grass = loadImage("grass.png");
  cactus = loadImage("cactus.png");
  //load font
  font = loadFont("MVBoli-36.vlw");
  //set font
  textFont(font);
}

void draw() {
  //--------------------------loop------------------------------
  background(0);
  //i = 22;
  i++;
  if(i == 24){
   i = 0;
  }
  //----------------------Scene1: see the cone-------------------------
  if (i == 1 || i == 2) {
    image(squirrel1, 0, 0);
    image(branch, 370, 20, 370, 70);
    image(cone, 460, 85, 60, 70);
    text("Wow!",400,230);
  }
  //----------------------Scene2: get the cone-------------------------
  if (i == 3) {
    image(arm, -30, 165);
    image(branch, 195, 30);
    image(cone, 283, 127);
    text("Ya!",450,230);
  }
  if (i == 4) {
    rotate(radians(20));
    image(arm, 20, 165);
    rotate(radians(-20));
    image(branch, 195, 30);
    image(cone, 283, 127);
    text("Hei!",460,240);
  }
  if (i == 5) {
    image(arm, -30, 165);
    image(branch, 195, 30);
    image(cone, 283, 127);
    text("Wo!",440,240);
  }
  if (i == 6) {
    rotate(radians(20));
    image(arm, 20, 165);
    rotate(radians(-20));
    image(branch, 195, 30);
    image(cone, 283, 127);
    text("Hu!",450,230);
  }
  if (i == 7) {
    image(arm, -30, 165);
    image(branch, 195, 30);
    image(cone, 283, 127);
    text("Mu!",460,240);
  }
  //----------------------Scene3:start to fall-------------------------
  if (i == 8 || i == 9) {
    rotate(radians(55));
    image(squirrel2, -95, 10, 450, 180);
    rotate(radians(-55));
    image(branch, 235, 30, 390, 92);
    image(cone, 323, 147, 95, 104);
    text("Oh!!!",450,230);
  }
  //----------------------Scene4: falling down-------------------------
  if (i == 10) {
    image(leaves, 0, 0);
    rotate(radians(-10));
    image(branch, 400, 70, 370, 87);
    rotate(radians(10));
    rotate(radians(30));
    image(branch, 400, -30, 370, 87);
    rotate(radians(-30));
    rotate(radians(160));
    image(branch, -190, -200);
    rotate(radians(-160));
    image(squirrel3, 180, 2);
    text("Ah----",430,170);
  }
  if (i == 11) {
    image(leaves, 0, 0);
    rotate(radians(-10));
    image(branch, 400, 70, 370, 87);
    rotate(radians(10));
    rotate(radians(30));
    image(branch, 400, -30, 370, 87);
    rotate(radians(-30));
    rotate(radians(160));
    image(branch, -190, -200);
    rotate(radians(-160));
    image(squirrel3, 180, 2, 200, 230);
    text("Ah----",430,170);
  }
  if (i == 12) {
    image(leaves, 0, 0);
    rotate(radians(-10));
    image(branch, 400, 70, 370, 87);
    rotate(radians(10));
    rotate(radians(30));
    image(branch, 400, -30, 370, 87);
    rotate(radians(-30));
    rotate(radians(160));
    image(branch, -190, -200);
    rotate(radians(-160));
    image(squirrel3, 180, 2, 160, 184);
    text("Ah----",430,170);
  }
  if (i == 13) {
    image(leaves, 0, 0);//background leaves
    rotate(radians(-10));
    image(branch, 400, 70, 370, 87);//branch right top
    rotate(radians(10));
    rotate(radians(30));
    image(branch, 400, -30, 370, 87);//branch right bottom
    rotate(radians(-30));
    rotate(radians(160));
    image(branch, -190, -200);//branch left
    rotate(radians(-160));
    image(squirrel3, 180, 2, 120, 138);
    text("Ah----",430,170);
  }
  //----------------------Scene5: land on the grass-------------------------
  if(i == 14 || i == 15){
    rotate(radians(160));
    image(branch, -140, -180, 300, 71);
    rotate(radians(-160));
    image(grass,90,145);
    image(squirrel2, -20, 190, 306, 135);
    text("Well...",430,60);
  }
  //----------------------Scene6: cone also there-------------------------
  if(i == 16 || i == 17 || i == 18 || i == 19){
    rotate(radians(160));
    image(branch, -140, -180, 300, 71);
    rotate(radians(-160));
    image(grass,90,145);
    image(squirrel2, -20, 190, 306, 135);
    image(cone,407,52,51,61);
    text("Hm...",460,180);
  }
  //----------------------Scene7: something happen-------------------------
  if(i == 20 || i == 21){
    rotate(radians(160));
    image(branch, -140, -180, 300, 71);
    rotate(radians(-160));
    image(grass,90,165);  
    image(squirrel2, -20, 190, 306, 135);
    image(cactus,181,239);
    image(cone,407,222,51,61);
    text("Wait...",430,40);
  }
  //----------------------Scene8: hurt by cactus-------------------------
  if(i == 22 || i == 23){
    rotate(radians(160));
    image(branch, -140, -180, 300, 71);
    rotate(radians(-160));
    image(grass,90,165);
    image(cactus,181,229);
    rotate(radians(-70));
    image(squirrel3, -160, 70, 200, 230);
    rotate(radians(70));
    image(cone,407,222,51,61);
    text("Oh!!!!!",400,70);
  }
}

  //----------------------the end-------------------------


