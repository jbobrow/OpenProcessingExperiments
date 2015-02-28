
import processing.opengl.*;
import toxi.geom.*;
import toxi.color.*;
import toxi.math.*;

ArrayList <String> names = new ArrayList <String> ();
ArrayList <ColorWorm> worms = new ArrayList <ColorWorm> ();

ZoomLensInterpolation zoomLens = new ZoomLensInterpolation();

boolean showColorPalette = true;
int selectedColorID;

Vec2D center;

ReadonlyTColor bg;

void setup() {
  size(600, 600, OPENGL);
  center = new Vec2D(width/2, height/2);
  names = NamedColor.getNames();
  Collections.sort(names);
  textFont(createFont("Playdate Bold", 28));
  zoomLens.setLensStrength(0.45, 1);
  bg = NamedColor.getForName("moccasin");
}

void draw() {
  background(bg.toARGB());
  for (Iterator<ColorWorm> i=worms.iterator(); i.hasNext();) {
    ColorWorm w = i.next();
    if (w.points.get(0).distanceToSquared(center) > 640000) {
      i.remove();
    } 
    else {
      w.update();
      w.display();
    }
  }

  float normX=(float)mouseX / width;
  zoomLens.setLensPos(normX, 0.15);
  float focalX=zoomLens.interpolate(0, width, normX);
  for (int i=0, num=names.size()-1; i<=num; i++) {
    float x=zoomLens.interpolate(0, width, (float)i/num);
    float x2=zoomLens.interpolate(0, width, (float)(i+1)/num);
    if (focalX >= x && focalX < x2) {
      selectedColorID=i;
      break;
    }
  }

  if (showColorPalette) {
    drawColorPalette();
  }

  if (mousePressed) {
    if (mouseButton == LEFT) {
      Vec2D mouse = new Vec2D(mouseX, mouseY);
      ReadonlyTColor c = NamedColor.getForName(names.get(selectedColorID));
      worms.add(new ColorWorm(mouse, c));
    } 
    else {
      bg = NamedColor.getForName(names.get(selectedColorID));
    }
  }
}

void keyPressed() {
  showColorPalette = !showColorPalette;
}

class ColorWorm {
  List <Vec2D> points = new ArrayList <Vec2D> ();
  Vec2D direction;
  TColor c;

  ColorWorm(Vec2D origin, ReadonlyTColor c) {
    points.add(origin);
    this.c = c.copy();
    direction = Vec2D.randomVector();
  }

  void update() {
    if (frameCount % 2 == 0) {
      Vec2D p = points.get(points.size()-1).copy();
      direction.rotate(radians(random(-30, 30)));
      Vec2D move = direction.getNormalizedTo(random(15, 30));
      p.addSelf(move);
      points.add(p);
    }

    while (points.size () > 25) {
      points.remove(0);
    }
  }

  void display() {
    if (points.size()>2) {
      Spline2D s = new Spline2D(points);
      List <Vec2D> vertices = s.computeVertices(2);
      noFill();
      strokeWeight(2);
      beginShape();
      for (int i=0,num=vertices.size()-1; i<=num; i++) {
        Vec2D v = vertices.get(i);
        c.setAlpha(map(i, 0, num, 0, 1));
        stroke(c.toARGB());
        vertex(v.x, v.y);
      }
      endShape();
    }
  }
}

void drawColorPalette() {
  noStroke();

  for (int i=0,num=names.size()-1; i<=num; i++) {

    float x = zoomLens.interpolate(1, width, (float)i / num);
    float x2 = zoomLens.interpolate(1, width, (float)(i+1) / num);
    fill(NamedColor.getForName(names.get(i)).toARGB());
    rect(x, mouseY-20, x2-x, 40);
  }

  String name = names.get(selectedColorID);
  float ascent = textAscent();
  float textwidth = textWidth(name);
  float x = min(mouseX, width-textwidth-8);
  float y = min(mouseY + 52, height-4);
  fill(255);
  rect(x, y-ascent-4, textwidth+8, ascent+8);
  fill(0);
  text(name, x+4, y);
}

