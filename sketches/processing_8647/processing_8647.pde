
import java.math.*;

int len = 16;
int base = 4;
int order = 16;
int side = 5;
int maxCount = 8;
int padding = 2;
int spacing = 6;
int shuffleSpacing = 10;
int plusSide = 1;

color white = color(255);
color gray = color(128);
color black = color(0);

BigInteger counter;

void setup() {
  size(
    maxCount * (len * side + padding) - padding + 1,
    (side + spacing) * (order * 2 + 1) + 
    (side + shuffleSpacing) * (order) - spacing + 1, P2D);
  //noLoop();
  counter = BigInteger.ZERO;
  //counter = new BigInteger(len, new Random());
}

void draw() {
  if(!mousePressed) {
    background(white);
    
    for(int i = 0; i < maxCount; i++) {
      pushMatrix();
      drawBigInteger(counter, len, side);
      translate(0, side);
      
      BigInteger result = counter;
      for(int j = 0; j < order; j++) {
        BigInteger last = result;
        
        pushMatrix();
        translate(side / 2, 0);
        for(int k = 0; k < len; k++)
          if(last.testBit(k))
            line(k * side, 0, (k - 1) * side, spacing);
        popMatrix();
        translate(0, spacing);
        
        BigInteger shifted = last.shiftRight(1);
        drawBigInteger(shifted, len, side);
        translate(0, side);
        
        for(int k = 0; k < len; k++) {
          pushMatrix();
          translate(k * side + side / 2, spacing / 2);
          line(-plusSide, 0, plusSide, 0);
          line(0, -plusSide, 0, plusSide);
          popMatrix();
        }
        translate(0, spacing);
        
        BigInteger xored = shifted.xor(last);
        drawBigInteger(xored, len, side);
        translate(0, side);
        
        pushMatrix();
        translate(side / 2, 0);
        for(int k = 0; k < len; k++) {
          if(xored.testBit(k)) {
            int target = shufflePosition(k);
            line(k * side, 0, target * side, shuffleSpacing);
          }
        }
        popMatrix();
        translate(0, shuffleSpacing);
        
        result = shuffle(xored, len);
        drawBigInteger(result, len, side);
        translate(0, side);
      }
      
      popMatrix();
      translate(side * len + padding, 0);
      counter = counter.add(BigInteger.ONE);
    }
  }
  
  //saveFrame("enumeration-diagram.png");
}

void drawBigInteger(BigInteger x, int len, int side) {
  pushMatrix();
  stroke(gray);
  for(int i = 0; i < len; i++) {
    fill(x.testBit(i) ? white : black);      
    rect(0, 0, side, side);
    translate(side, 0);
  }
  popMatrix();
}

BigInteger chordCount(BigInteger x, int len) {
  int low = getLowestMovable(x, len);
  if(low + 1 < len) {
    x = x.clearBit(low);
    x = x.setBit(low + 1);
    int lower = 0;
    for(int j = 0; j < low; j++) {
      if(x.testBit(j)) {
        x = x.clearBit(j);
        x = x.setBit(lower++);
      }
    }
  } else {
    int count = x.bitCount() + 1;
    x = BigInteger.ZERO;
    for(int j = 0; j < count; j++)
      x = x.setBit(j);
  }
  return x;
}

BigInteger flip(BigInteger x, int len) {
  for(int i = 0; i < len / 2; i++) {
    int left = len - i - 1;
    boolean right = x.testBit(i);
    if(x.testBit(left))
      x = x.setBit(i);
    else
      x = x.clearBit(i);
    if(right)
      x = x.setBit(left);
    else
      x = x.clearBit(left);
  }
  return x;
}

int getLowestMovable(BigInteger x, int len) {
  for(int i = 0; i < len; i++)
    if(x.testBit(i) && !x.testBit(i + 1))
      return i;
  return len;
}

BigInteger shuffle(BigInteger x, int len) {
  BigInteger y = BigInteger.ZERO;
  for(int i = 0; i < len; i++)
    if(x.testBit(i))
      y = y.setBit(shufflePosition(i));
  return y;
}

int shufflePosition(int x) {
  BigInteger pos = new BigInteger(binary(x), 2);
  pos = flip(pos, base);
  return pos.intValue();
}


