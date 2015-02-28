
/* @pjs preload="LIVE.png, PROX.png, LUX.png, SCRN.png, IMGS.png, DEMO.png, prox_icon.jpg, lux_icon.jpg, live_icon.png, scrn_icon.jpg, imgs_icon.png, demo_icon.png, processing_title.png"; */


PImage title_live;
PImage title_prox;
PImage title_lux;
PImage title_scrn;
PImage title_demo;
PImage title_imgs;
PImage icon_prox;
PImage icon_lux;
PImage icon_scrn;
PImage icon_live;
PImage icon_imgs;
PImage icon_demo;

PImage title;

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
  icon_live = loadImage("live_icon.png");
  icon_imgs = loadImage("imgs_icon.png");
  icon_demo = loadImage("demo_icon.png");
  
  title = loadImage("processing_title.png");
  
}

void draw() {
  background(255);
  noTint();
  strokeWeight(2);
  fill(255,0);
  stroke(0,158,255);

  
  
  if (mouseX>65 && mouseX<565 && mouseY>10 && mouseY<75) { //title
    tint(255, 100);
    image(title, 65, 10, 500, 65);
    noTint();
  } else {
    image(title, 65, 10, 500, 65);
  }
  

  if (mouseX>120/7 && mouseX<120/7+85 && mouseY>100 && mouseY<230) { //icons
    tint(255, 100);
    image(icon_prox,120/7,100, 85, 85);
    image(title_prox,120/7,185, 85, 43);
    noTint();
  } else {
    image(icon_prox,120/7,100, 85, 85);
    image(title_prox,120/7,185, 85, 43);
    
  }
  if (mouseX>240/7+85 && mouseX<240/7+85+85 && mouseY>100 && mouseY<230) {
    tint(255, 100);
    image(icon_lux,240/7+85,100, 85, 85);
    image(title_lux,240/7+85,185, 85, 43);
    noTint();
  } else {
    image(icon_lux,240/7+85,100, 85, 85);
    image(title_lux,240/7+85,185, 85, 43);
  }
  if (mouseX>360/7+170 && mouseX<360/7+170+85 && mouseY>100 && mouseY<230) {
    tint(255, 100);
    image(icon_demo,360/7+170,100, 85, 85);
    image(title_demo,360/7+170,185, 85, 43);
    noTint();
  } else {
    image(icon_demo,360/7+170,100, 85, 85);
    image(title_demo,360/7+170,185, 85, 43);
  }
  if (mouseX>480/7+255 && mouseX<480/7+255+85 && mouseY>100 && mouseY<230) {
    tint(255, 100);
    image(icon_scrn,480/7+255,100, 85, 85);
    image(title_scrn,480/7+255,185, 85, 43);
    noTint();
  } else {
    image(icon_scrn,480/7+255,100, 85, 85);
    image(title_scrn,480/7+255,185, 85, 43);
  }
  if (mouseX>600/7+340 && mouseX<600/7+340+85 && mouseY>100 && mouseY<230) {
    tint(255, 100);
    image(icon_live,600/7+340,100, 85, 85);
    image(title_live,600/7+340,185, 85, 43);
    noTint();
  } else {
    image(icon_live,600/7+340,100, 85, 85);
    image(title_live,600/7+340,185, 85, 43);
  }
  if (mouseX>720/7+425 && mouseX<720/7+425+85 && mouseY>100 && mouseY<230) {
    tint(255, 100);
    image(icon_imgs,720/7+425,100, 85, 85);
    image(title_imgs,720/7+425,185, 85, 43);
    noTint();
  } else {
    image(icon_imgs,720/7+425,100, 85, 85);
    image(title_imgs,720/7+425,185, 85, 43);
  }
  
}

void mouseClicked() {
  if (mouseX>65 && mouseX<565 && mouseY>10 && mouseY<75) { //title
  link("http://jonhouckdesign.com/thesis/", "_new");
  }
  

  if (mouseX>120/7 && mouseX<120/7+85 && mouseY>100 && mouseY<230) { //icons
  link("http://jonhouckdesign.com/?p=852", "_new");
  }
  if (mouseX>240/7+85 && mouseX<240/7+85+85 && mouseY>100 && mouseY<230) {
    link("http://jonhouckdesign.com/?p=854", "_new");
  }
  if (mouseX>360/7+170 && mouseX<360/7+170+85 && mouseY>100 && mouseY<230) {
    link("http://jonhouckdesign.com/?p=853", "_new");
  }
  if (mouseX>480/7+255 && mouseX<480/7+255+85 && mouseY>100 && mouseY<230) {
    link("http://jonhouckdesign.com/?p=1098", "_new");
  }
  if (mouseX>600/7+340 && mouseX<600/7+340+85 && mouseY>100 && mouseY<230) {
    link("http://jonhouckdesign.com/?p=1099", "_new");
  }
  if (mouseX>720/7+425 && mouseX<720/7+425+85 && mouseY>100 && mouseY<230) {
    link("http://jonhouckdesign.com/?p=1100", "_new");
  }
}

