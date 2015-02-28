


PImage title_live;
PImage title_prox;
PImage title_lux;
PImage title_scrn;
PImage title_demo;
PImage title_imgs;
PImage icon_prox;
PImage icon_lux;
PImage icon_scrn;
PImage icon_imgs;
PImage icon_demo;

PImage title;

int trans = 100;
color stroke = color(0,158,255);
color strokeTrans = color(0,158,255, 100);

void setup() {
  size(630,235);
  
  
  title_live = loadImage("LIVE.png");
  title_prox = loadImage("PROX.png");
  title_lux = loadImage("LUX.png");
  title_scrn = loadImage("SCRN.png");
  title_imgs = loadImage("IMGS.png");
  title_demo = loadImage("DEMO.png");
  icon_prox = loadImage("prox_icon.jpg");
  icon_lux = loadImage("lux_icon.jpg");
  icon_scrn = loadImage("scrn_icon.jpg");
  icon_imgs = loadImage("imgs_icon.png");
  icon_demo = loadImage("demo_icon.png");
  
  title = loadImage("processing title.jpg");
}

void draw() {
  background(255);
  noTint();
  strokeWeight(2);
  fill(255,0);
  stroke(stroke);
  
  
  if (mouseX>65 && mouseX<565 && mouseY>10 && mouseY<75) { //title
    tint(255, trans);
    image(title, 65, 10, 500, 65);
    noTint();
  } else {
    image(title, 65, 10, 500, 65);
  }
  

  if (mouseX>120/7 && mouseX<120/7+85 && mouseY>100 && mouseY<235) { //icons
    tint(255, trans);
    image(icon_prox,120/7,100, 85, 85);
    image(title_prox,120/7,185, 85, 42.5);
    stroke(strokeTrans);
    rect(120/7,100, 85, 85);
    stroke(stroke);
    noTint();
  } else {
    image(icon_prox,120/7,100, 85, 85);
    image(title_prox,120/7,185, 85, 42.5);
    rect(120/7,100, 85, 85);
  }
  if (mouseX>240/7+85 && mouseX<240/7+85+85 && mouseY>100 && mouseY<235) {
    tint(255, trans);
    image(icon_lux,240/7+85,100, 85, 85);
    image(title_lux,240/7+85,185, 85, 42.5);
    stroke(strokeTrans);
    rect(240/7+85,100, 85, 85);
    stroke(stroke);
    noTint();
  } else {
    image(icon_lux,240/7+85,100, 85, 85);
    image(title_lux,240/7+85,185, 85, 42.5);
    rect(240/7+85,100, 85, 85);
  }
  if (mouseX>360/7+170 && mouseX<360/7+170+85 && mouseY>100 && mouseY<235) {
    tint(255, trans);
    image(icon_demo,360/7+170,100, 85, 85);
    image(title_demo,360/7+170,185, 85, 42.5);
    stroke(strokeTrans);
    rect(360/7+170,100, 85, 85);
    stroke(stroke);
    noTint();
  } else {
    image(icon_demo,360/7+170,100, 85, 85);
    image(title_demo,360/7+170,185, 85, 42.5);
    rect(360/7+170,100, 85, 85);
  }
  if (mouseX>480/7+255 && mouseX<480/7+255+85 && mouseY>100 && mouseY<235) {
    tint(255, trans);
    image(icon_scrn,480/7+255,100, 85, 85);
    image(title_scrn,480/7+255,185, 85, 42.5);
    stroke(strokeTrans);
    rect(480/7+255,100, 85, 85);
    stroke(stroke);
    noTint();
  } else {
    image(icon_scrn,480/7+255,100, 85, 85);
    image(title_scrn,480/7+255,185, 85, 42.5);
    rect(480/7+255,100, 85, 85);
  }
  if (mouseX>600/7+340 && mouseX<600/7+340+85 && mouseY>100 && mouseY<235) {
    tint(255, trans);
    rect(600/7+340,100, 85, 85);
    image(title_live,600/7+340,185, 85, 42.5);
    stroke(strokeTrans);
    rect(600/7+340,100, 85, 85);
    stroke(stroke);
    noTint();
  } else {
    rect(600/7+340,100, 85, 85);
    image(title_live,600/7+340,185, 85, 42.5);
    rect(600/7+340,100, 85, 85);
  }
  if (mouseX>720/7+425 && mouseX<720/7+425+85 && mouseY>100 && mouseY<235) {
    tint(255, trans);
    image(icon_imgs,720/7+425,100, 85, 85);
    image(title_imgs,720/7+425,185, 85, 42.5);
    stroke(strokeTrans);
    rect(720/7+425,100, 85, 85);
    stroke(stroke);
    noTint();
  } else {
    image(icon_imgs,720/7+425,100, 85, 85);
    image(title_imgs,720/7+425,185, 85, 42.5);
    rect(720/7+425,100, 85, 85);
  }
  
}

void mouseClicked() {
  if (mouseX>65 && mouseX<565 && mouseY>10 && mouseY<75) { //title
  link("http://jonhouckdesign.com/thesis/");
  }
  

  if (mouseX>120/7 && mouseX<120/7+85 && mouseY>100 && mouseY<235) { //icons
  link("http://jonhouckdesign.com/prox/");
  }
  if (mouseX>240/7+85 && mouseX<240/7+85+85 && mouseY>100 && mouseY<235) {
    link("http://jonhouckdesign.com/lux/");
  }
  if (mouseX>360/7+170 && mouseX<360/7+170+85 && mouseY>100 && mouseY<235) {
    link("http://jonhouckdesign.com/demo-2/");
  }
  if (mouseX>480/7+255 && mouseX<480/7+255+85 && mouseY>100 && mouseY<235) {
    link("http://jonhouckdesign.com/scrn/");
  }
  if (mouseX>600/7+340 && mouseX<600/7+340+85 && mouseY>100 && mouseY<235) {
    link("http://jonhouckdesign.com/live");
  }
  if (mouseX>720/7+425 && mouseX<720/7+425+85 && mouseY>100 && mouseY<235) {
    link("http://jonhouckdesign.com/imgs");
  }
}


