
float[] myStartValues= {
  6.5, 6.9, 6.3, 7.2, 6.3, 6.9, 6.9, 7.5
};
float[] myEndValues= {
  7.3, 8.0, 7.4, 8.0, 7.2, 7.9, 7.9, 8.4
};
String[] myCriteria= {
  "Preparation & Planning (Self)", 
  "Preparation & Planning (Manager)", 
  "Presence (Self)", 
  "Presence (Manager)", 
  "Negotiation, Persuasion & Influence (Self)", 
  "Negotiation, Persuasion & Influence (Manager)", 
  "Follow-up (Self)", 
  "Follow-up (Manager)"
};

float vMargin=50;

void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  
  // Title
  fill(0);
  textAlign(CENTER,TOP);
  text("Assessment Scores Pre- and Post-Program", width/2,5);
  
  // Chart
  for (int i = 0; i < myCriteria.length; i++) {
    
    float y = i*40+vMargin;
    float startX = map(myStartValues[i], 6, 9, 0, width-200);  
    float endX = map(myEndValues[i], 6, 9, 0, width-200);
    
    drawMyLines(myCriteria[i], startX, endX, y);
    drawMyStartValues(myStartValues[i], startX, y);
    drawMyEndValues(myEndValues[i], endX, y);
    
  }
}

void drawMyStartValues(float data, float x, float y) {
    noStroke();
    fill(144,147,181);
    ellipse(x, y, 30, 30);
    fill(0);
    textAlign(CENTER, CENTER);
    text(nf(data, 0, 1), x, y);
}

void drawMyEndValues(float data, float x, float y) {
    fill(70, 22, 107);
    ellipse(x, y, 30, 30);
    fill(255);
    textAlign(CENTER, CENTER);
    text(nf(data, 0, 1), x, y);
}

void drawMyLines(String data, float x1, float x2, float y) {
    stroke(220);
    strokeWeight(30);
    line(x1, y, x2, y);
    fill(0);
    textAlign(LEFT, CENTER);
    text(data, x2+40, y);
}



