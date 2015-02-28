
// Screen size
float swidth = 1280;
float sheight = 720;

float sc_x = swidth/1920.0;
float sc_y = sheight/1080.0;

// Ball velocity
float v_x = sc_x*18;
// Ball width and height
float b_s = sc_x*20;
// Space between the borders and the goalies
float side_space = sc_x*80;
// Pad width
float pad_s = sc_x*20;
// Pad Height
float pad_h = sc_y*80;
// Initial ball position
float b_x = side_space + pad_s;

// X position for the left players's lines
// Right players are equal plus 900px

float pad1_x = sc_x*220;
float pad2_x = sc_x*400;
float pad3_x = sc_x*600;
float pad4_x = sc_x*800;

// Frequency of the pads
float pad1_w = PI/((swidth - 2*side_space - 2*pad_s - 10)/v_x);

// The 20 players pads
ArrayList<Pad> pads = new ArrayList<Pad>();

// Points font
PFont pfont;

// Track time
float t = 0;
float dt = 1;

boolean stop = true;

class Pad {

  float h, w, x, y, f, amp, y0, t0;

  Pad(float hi, float wi, float xi, float y0i, float fi, float ampi, float t0i) {
    h = hi;
    w = wi;
    x = xi;
    y0 = y0i;
    f = fi;
    amp = ampi;
    t0 = t0i;

    update(0);
  }

  void draw() {
    rect(x, y, w, h);
  }

  void update(float t) {
    y = y0 - amp*sin(f*(t + t0));
  }
}

void setup () {
  size(int(swidth), int(sheight));

  // Load Bitlow font
  pfont = createFont("AldotheApache.ttf", 90);

  // Goalies

  pads.add(new Pad(pad_h, pad_s, side_space,  sheight/2  - pad_h/2, 2*pad1_w, sheight/8, (side_space - 30)/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, swidth - side_space - pad_s,  sheight/2  - pad_h/2, 2*pad1_w, sheight/8, (side_space - 90)/abs(v_x)));

  // Left team

  pads.add(new Pad(pad_h, pad_s, pad1_x,  sheight/2  - 3*pad_h/2 - sc_y*192, pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, pad1_x, sheight/2  + 3*pad_h/2 - sc_y*192, pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, pad1_x, sheight/2  + 9*pad_h/2 - sc_y*192, pad1_w, (sheight/6), pad1_x/abs(v_x)));

  pads.add(new Pad(pad_h, pad_s, pad2_x,  sheight/2  - 2*pad_h/2 - sc_y*192, -pad1_w, (sheight/6), pad2_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, pad2_x, sheight/2  + 6*pad_h/2 - sc_y*192, -pad1_w, (sheight/6), pad2_x/abs(v_x)));

  pads.add(new Pad(pad_h, pad_s, pad3_x,  sheight/2  - 3*pad_h/2 - sc_y*162, pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, pad3_x, sheight/2  + 3*pad_h/2 - sc_y*162, pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, pad3_x, sheight/2  + 9*pad_h/2 - sc_y*162, pad1_w, (sheight/6), pad1_x/abs(v_x)));

  pads.add(new Pad(pad_h, pad_s, pad4_x,  sheight/2  -2*pad_h/2 - sc_y*192, -pad1_w, (sheight/6), pad2_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, pad4_x, sheight/2  + 4*pad_h/2 - sc_y*192, -pad1_w, (sheight/6), pad2_x/abs(v_x)));

  // Right team

  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad1_x,  sheight/2  - 3*pad_h/2 - sc_y*202, -pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad1_x, sheight/2  + 3*pad_h/2 - sc_y*182, -pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad1_x, sheight/2  + 9*pad_h/2 - sc_y*168, -pad1_w, (sheight/6), pad1_x/abs(v_x)));

  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad2_x,  sheight/2  - 2*pad_h/2 - sc_y*195, pad1_w, (sheight/6), pad2_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad2_x, sheight/2  + 6*pad_h/2 - sc_y*165, pad1_w, (sheight/6), pad2_x/abs(v_x)));

  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad3_x,  sheight/2  - 3*pad_h/2 - sc_y*157, -pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad3_x, sheight/2  + 3*pad_h/2 - sc_y*125, -pad1_w, (sheight/6), pad1_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad3_x, sheight/2  + 9*pad_h/2 - sc_y*125, -pad1_w, (sheight/6), pad1_x/abs(v_x)));

  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad4_x,  sheight/2  -2*pad_h/2 - sc_y*192, pad1_w, (sheight/6), pad2_x/abs(v_x)));
  pads.add(new Pad(pad_h, pad_s, sc_x*900 +  pad4_x, sheight/2  + 4*pad_h/2 - sc_y*192, pad1_w, (sheight/6), pad2_x/abs(v_x)));

}

void draw () {
  if (!stop)
    t += dt;

  background(color(2, 152, 52));
  fill(255);
  noStroke();

  // Points
  textFont(pfont);
  textAlign(CENTER);
  text("O   O", swidth/2, 130);

  // Draw ball
  rect(b_x, height/2.0 - b_s/2.0, b_s, b_s);

  if (!stop) {
    b_x += v_x;

    if (b_x + b_s > swidth - pad_s - side_space) {
      b_x = swidth - pad_s - side_space - b_s;
      v_x *= -1;
    } else if (b_x < side_space + pad_s) {
      b_x = side_space + pad_s;
      v_x *= -1;
      //        stop = true;
      t = 0;
    }
  }

  // Draw moving pads
  for (Pad p : pads) {
    p.draw();
    if (!stop) {
      p.update(t);
    }
  }

  // Draw border

  rect(0, 0, pad_s, sheight/2 - 80);
  rect(0, sheight/2 + 80, pad_s, sheight);

  rect(pad_s - 1, 0, swidth - pad_s, pad_s);
  rect(pad_s - 1, sheight - pad_s, swidth - pad_s, sheight);


  rect(swidth - pad_s, 0, swidth, sheight/2 - 80);
  rect(swidth - pad_s, sheight/2 + 80, swidth, sheight);

  // Draw middle line
  for (int i = 0; i < 30; ++i){
    rect(swidth/2 - 5, i*40 + 10, 10, 20);
  }

}

void keyPressed() {
  if (key == ' ') {
    stop = !stop;
  }
}

