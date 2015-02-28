
/* @pjs preload="mysticMountain.png,happyCloud.png,happyCloudToo.png,happyTree.png,happyTreeToo.png";  */

PImage mysticMountain;
PImage happyTree;
PImage happyTreeToo;
PImage happyCloud;
PImage happyCloudToo;

void setup() {
  size(600, 400);
  mysticMountain = loadImage("mysticMountain.png");
  image(mysticMountain, 0, 0, 600, 400);
  frameRate(20);
  }
    
void draw() {
  happyCloud = loadImage("happyCloud.png");
  happyCloudToo = loadImage("happyCloudToo.png");
  float cloudType = random(10);
  float cloudSizeY = random(15,50);
  float cloudSizeX = random(40,75);
  happyTree = loadImage("happyTree.png");
  happyTreeToo = loadImage("happyTreeToo.png");
  float treeType = random(10);
  float treeSize = (mouseY*1.5/900);
  
  if(keyPressed) {
    if(key == ' ') {
      if(cloudType >= 5) {
        image(happyCloud, mouseX-cloudSizeX/2, mouseY-cloudSizeY/2, cloudSizeX, cloudSizeY);
        }
        
      else {
        image(happyCloudToo, mouseX-cloudSizeX/2, mouseY-cloudSizeY/2, cloudSizeX, cloudSizeY);
        }
      }
    }
  
  if(mousePressed) {
    if(treeType >= 5) {
      image(happyTree, mouseX-treeSize*85, mouseY-treeSize*340, treeSize*171, treeSize*348);
      }
    
    else {
      image(happyTreeToo, mouseX-treeSize*55, mouseY-treeSize*300, treeSize*114, treeSize*289);
      }
    }
  }


