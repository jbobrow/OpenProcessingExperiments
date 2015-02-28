
class Block {
  float x;
  float y;
  float w;
  int a;
  boolean isSelected;
  int blockColor;
  int blockShape;
  int blockShade;
  
  Block() {
    x = 0;
    y = 0;
    w = blockWidth;
    
    float red_prob = .33;
    float green_prob = .33;
    float blue_prob = .34;
    float colNum = random(1);
    if (colNum < red_prob) {
      blockColor = 0;
    } else if (colNum < green_prob + red_prob) {
      blockColor = 1;
    } else {
      blockColor = 2;
    }
    
    float cir_prob = .33;
    float dia_prob = .33;
    float squ_prob = .34;
    float shapeNum = random(1);
    if (shapeNum < cir_prob) {
      blockShape = 0;
    } else if (shapeNum < cir_prob + dia_prob) {
      blockShape = 1;
    } else {
      blockShape = 2;
    }
    
    float solid_prob = .33;
    float shade_prob = .33;
    float transp_prob = .34;
    float shadNum = random(1);
    if (shadNum < solid_prob) {
      blockShade = 0;
    } else if (shadNum < shade_prob + solid_prob) {
      blockShade = 1;
    } else {
      blockShade = 2;
    }
    
    isSelected = false;
  }
  
  void display() {
    fill(255);
    noStroke();
    rect(x+1,y+1,w-2,w-2);
    strokeWeight(1);
    if(isSelected == true) {
      strokeWeight(5);
    } else {
      strokeWeight(1);
    }

    if(blockShade == 0) {
      a = 180;
    } else if (blockShade == 1) {
      a = 60;
    } else {
      a = 0;
    }
    
    if(blockColor == 0) {
      stroke(255,53,2);
      fill(255,53,2,a);
    } else if (blockColor == 1) {
      stroke(100,180,28);
      fill(100,180,28,a);
    } else {
      stroke(10,52,178);
      fill(10,52,178,a);
    }
    
    if(blockShape == 0) {
      ellipse(x+(w/2),y+(w/2),w*.75,w*.75);
    } else if (blockShape == 1) {
      quad(x+(w/2),y+(w/8),x+((7*w)/8),y+(w/2),x+(w/2),y+((7*w)/8),x+(w/8),y+(w/2));
    } else {
      rect(x+(w/6),y+(w/6),w*.66,w*.66);
    }
  }
  
  void moveTo(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  } 
  
  void selected() {
    isSelected = !isSelected;
    if (isSelected == true) {
      selectedBlocks.addBlock(this);
    } else {
      selectedBlocks.removeBlock(this);
    }
  }
  
  int getBlockColor() {
    return blockColor;
  }
  int getBlockShape() {
    return blockShape;
  }
  int getBlockShade() {
    return blockShade;
  }
}

