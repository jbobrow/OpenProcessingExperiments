
boolean overLeftPath = false;
boolean overRightPath = false;

void setup() {
  size(600, 600);
}

void draw() {
  background(#0F6B6B);
  stroke(#0D9396);
  ellipseMode(CORNER);

  // Left buttom
  if (overLeftPath == true) {
    fill(#9D1C30);
    rect(340,280,50,50);
    text("CSS", 45, 90); 
    triangle(30, 75, 58, 20, 86, 75);
    text("HTML", 350, 350); 
  } else {
    noFill();
  }
  ellipse(320, 360, 150, 150);
  stroke(#0D9396);
  text("Code", 380, 430);
  
  // Right button
  if (overRightPath == true) {
    fill(#C8952C);
    rect(40,380,30,30);
    text("Leadership", 30, 430); 
    ellipse(400,100,50,50);
    text("Colaboration", 380, 160); 
  } else {
    noFill();
  }
  ellipse(105, 60, 200, 200);
  stroke(#0D9396);
  text("TeamWork", 170, 150);
  
}

void mousePressed() {
  if (overLeftPath) { 
    link("https://www.google.com/search?q=teamwork&oq=teamwork&aqs=chrome.0.69i57j0j5l2j69i62l2.1456j0&sourceid=chrome&ie=UTF-8");
  } else if (overRightPath) {
    link("https://www.google.com/search?q=teamwork&oq=teamwork&aqs=chrome.0.69i57j0j5l2j69i62l2.1456j0&sourceid=chrome&ie=UTF-8#sclient=psy-ab&q=code&oq=code&gs_l=serp.3..0l4.84668.85392.1.85530.4.0.4.0.0.0.0.0..0.0....0...1c.1.22.psy-ab..0.10.457.ZpFC0Vjtn9I&pbx=1&bav=on.2,or.r_cp.r_qf.&bvm=bv.49641647,d.dmg,pv.xjs.s.en_US.NyLNrjc7wJY.O&fp=ae2f600e2ede89f3&biw=1421&bih=716");
  }
}

void mouseMoved() { 
  checkButtons(); 
}
  
void mouseDragged() {
  checkButtons(); 
}

void checkButtons() {
  if (mouseX > 320 && mouseX < 470 && mouseY > 360 && mouseY < 510) {
    overLeftPath = true;  
  } else if (mouseX > 105 && mouseX < 305 && mouseY > 60 && mouseY <260) {
    overRightPath = true; 
  } else {
    overLeftPath = overRightPath = false;
  }
}
