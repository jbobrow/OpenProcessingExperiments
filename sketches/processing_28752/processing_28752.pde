
//import java.util.TreeSet;

public class ds12_2011 extends PApplet {
  static int OFFSET = 0;
  static int MIN_AREA = 421;
  static int DIVIDED = 16;
  int WIDTH = 640;
  int HEIGHT = 480;

  Hako mainHako;
  TreeSet set = new TreeSet();
  boolean isEnd = false;
  boolean isMousePressed = false;

  void initHako() {
    WIDTH = width-4;
    HEIGHT = height-4;
    Hako h = new Hako(WIDTH, HEIGHT);
    h.x = 1;
    h.y = 1;
    set.clear();
    set.add(h);
    mainHako = h;
  }

  public void setup() {
    size(640,480);
    initHako();
  }

  void finish() {
    noLoop();
    isEnd = true;

    reset();

  }

  boolean mode = true;
  boolean cMode = true;

  public void draw() {

    Hako h;
    if (set.size() == 0) {
      finish();
      return;
    }

    if (mode) {
      // min first
      h = (Hako) set.first();
    } else {
      // max first
      h = (Hako) set.last();
    }
    if (h == null) {
      finish();
      return;
    }
    h.draw();
    set.remove(h);
    if (h.a > MIN_AREA) {

      int offset = (int) random(0, Math.abs(OFFSET));
      offset = OFFSET < 0 ? -offset : offset;
      offset = OFFSET;
      if (h.d == Hako.HOR) {
        int nw = (int) random(h.w / DIVIDED, (DIVIDED - 1) * h.w
            / DIVIDED);
        // System.out.println(nw);
        Hako l = new Hako(nw, h.h);
        Hako r = new Hako(h.w - nw, h.h);
        l.y = r.y = h.y;
        l.x = h.x;
        r.x = h.x + l.w + offset;
        set.add(l);
        set.add(r);
        h.l = l;
        h.r = r;
      } else {
        int nh = (int) random(h.h / DIVIDED, (DIVIDED - 1) * h.h
            / DIVIDED);
        Hako f = new Hako(h.w, nh);
        Hako r = new Hako(h.w, h.h - nh);
        f.x = r.x = h.x;
        f.y = h.y;
        r.y = h.y + f.h + offset;
        set.add(f);
        set.add(r);
        h.l = f;
        h.r = r;
      }
    } else {
      // h.draw();
    }

  }

  void reset() {
    noLoop();
    initHako();
    isEnd = false;
    loop();

  }

  public void keyPressed() {
    switch (key) {
      case 'r':
        noLoop();
        initHako();
        isEnd = false;
        loop();
        break;
      case '0':
        mode = !mode;
        noLoop();
        initHako();
        isEnd = false;
        loop();
        break;
//      case 'm':
//        cMode = false;
//        break;
      case '9':
        cMode = !cMode;
        break;
      default:
        break;     
    }
  }

  static int count;

  class Hako implements Comparable {
    public int compareTo(Object o) {
      Hako c = (Hako) o;
      return a > c.a ? 1 : a == c.a ? 0 : -1;
    }
    int idx;
    int x;
    int y;
    int w;
    int h;
    int a;
    Hako l;
    Hako r;
    boolean d;

    public static final boolean HOR = false;
    public static final boolean VER = true;

    public Hako() {
      idx = count++;
    }

    public Hako(int wi, int he) {
      this();
      w = wi;
      h = he;
      a = wi * he;
      d = wi > he ? HOR : VER;
    }

    public void draw() {
      int c = color(255, 128);
      if (random(100) >= 90) {
        if (cMode)
          c = color(100 + random(156), 100 + random(156),
            100 + random(156));
        else     
          c = color(10+random(25)*10);
      }

      fill(c);
      rect(x, y, w, h);
    }
  }

}

