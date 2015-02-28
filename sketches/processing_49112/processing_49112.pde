

void setup() {
  size(640, 480);
  smooth();
  colorMode(HSB, 100);
}

void draw() {
  background(100);
  
  /*
    Left margin: 20px
    Right margin: 20px
    Top margin: 100px
    Bottom margin: 100px
    
    Plot width: width - left margin - right margin = 600px
    Plot height: height - top margin - bottom margin = 280px
    
    Bar width: plot width - (total bars - 1) / total bars
    Bar height: plot height * percent value
    Bar x pos: left margin + bar index[0 - total bars] * plot width / total bars --> NOTE: this is why it is useful to start ranges with 0
    Bar y pos: height - bottom margin
  */
  
  // draw plot bg
  fill(90);
  noStroke();
  rectMode(CORNERS);
  rect(20, 100, width - 20, height - 100);
  
  rectMode(CORNER); // rect default
  
  // rect 1
  if ((mouseX > 20) && (mouseX <= 20 + 119) && (mouseY > height - 100 - (height - 200) * 0.7) && (mouseY <= height - 100)) {
    fill(35);
  } else {
    fill(0);
  }
  rect(20, height - 100, 119, - (height - 200) * 0.7);
  
  // rect 2
  if ((mouseX > 20 + 120) && (mouseX <= 20 + 120 + 119) && (mouseY > height - 100 - (height - 200) * 0.45) && (mouseY <= height - 100)) {
    fill(35);
  } else {
    fill(0);
  }
  rect(20 + 120, height - 100, 119, - (height - 200) * 0.45);
  
  // rect 3
  if ((mouseX > 20 + 120 * 2) && (mouseX <= 20 + 120 * 2 + 119) && (mouseY > height - 100 - (height - 200) * 0.9) && (mouseY <= height - 100)) {
    fill(35);
  } else {
    fill(0);
  }
  rect(20 + 120 * 2, height - 100, 119, - (height - 200) * 0.9);
  
  // rect 4
  if ((mouseX > 20 + 120 * 3) && (mouseX <= 20 + 120 * 3 + 119) && (mouseY > height - 100 - (height - 200) * 0.5) && (mouseY <= height - 100)) {
    fill(35);
  } else {
    fill(0);
  }
  rect(20 + 120 * 3, height - 100, 119, - (height - 200) * 0.5);
  
  // rect 5
  if ((mouseX > 20 + 120 * 4) && (mouseX <= 20 + 120 * 4 + 119) && (mouseY > height - 100 - (height - 200) * 0.2) && (mouseY <= height - 100)) {
    fill(35);
  } else {
    fill(0);
  }
  rect(20 + 120 * 4, height - 100, 119, - (height - 200) * 0.2);
}

