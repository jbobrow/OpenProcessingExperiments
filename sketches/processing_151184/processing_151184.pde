
import java.util.*;
List<Sprite> sprites;
float r = 0;
void setup() {
  size(680, 450);

  sprites = new ArrayList<Sprite>();

  background(0);
  PFont font = loadFont("Arial-BoldMT-248.vlw");
  textFont(font, 248);

  text("Trent", 10, 248);
  float step = 10;
  for (float x = 0; x < width; x+= step) {
    for (float y = 0; y < height; y += step) {
      if (brightness(get((int)x, (int)y)) > 100) {
        sprites.add(new Sprite(new PVector(x, y)));
      }
    }
  }
}

void draw() {
  r+= .1;
  background(0);
  stroke(255);
  fill(255);
  for (Sprite sprite : sprites) {
    sprite.draw(r);
    List<Sprite> close = findCloseSprites(sprite);
    for (Sprite closeSprite : close) {
      line(sprite.vector.x, sprite.vector.y, closeSprite.vector.x, closeSprite.vector.y);
    }
  }
}

List<Sprite> findCloseSprites(Sprite targetSprite) {
  List<Sprite> closeSprites = new ArrayList<Sprite>();

  for (Sprite sprite : sprites) {
    if (sprite == targetSprite) {
      break;
    }
    if (sprite.vector.dist(targetSprite.vector) < 20) {
      closeSprites.add(sprite);
    }
  }

  return closeSprites;
}

class Sprite {
  PVector vector, originalVector;

  float difference;

  Sprite(PVector vector) {
    this.originalVector = vector;
    this.difference = random(10);
  }

  void draw(float r) {
    float x = cos(difference + r) * 8 + this.originalVector.x;
    float y = sin(difference + r) * 8 + this.originalVector.y;
    this.vector = new PVector(x, y);

    ellipse(x, y, 2, 2);
  }
}

