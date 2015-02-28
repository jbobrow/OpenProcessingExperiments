
import java.util.Random;
import java.util.ArrayList;

final int screenWidth = 350;
final int screenHeight = 650;
final int[] colors = new int[] {color(255), color(0), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 140, 0), color(139, 69, 19)};
final int diam = 50;
final int[] solution = new int[5];

int row;
int cursor;
ArrayList<int[]> field = new ArrayList<int[]>();
ArrayList<int[]> hints = new ArrayList<int[]>();

boolean pickUpColor = false;
boolean submit = false;
boolean running = true;

void setup() {
  size(350, 650);
  noStroke();

  field.add(new int[5]);
  hints.add(new int[5]);

  Random r = new Random();

  for (int i = 0; i < solution.length; i++) {
    solution[i] = colors[r.nextInt(colors.length)];

    for (int j = 0; j < i; j++) {
      if (solution[i] == solution[j])
        i--;
    }
  }
}

void draw() {
  background(100);

  fill(200);
  rect(0, 0, screenWidth, diam);

  if (running) {
    fill(150);
    rect(0, diam + diam * row, screenWidth, diam);
  }

  for (int i = 0; i < solution.length; i++) {
    if (running) {
      fill(150);
      textSize(42);
      textAlign(CENTER);
      text("?", diam * i, 0, diam, diam);
    } 
    else {
      fill(solution[i]);
      ellipse(diam / 2 + diam * i, diam / 2, diam, diam);
    }
  }

  int width = (int)(diam * (solution.length + .25));
  int height = (int)(diam * .25);

  for (int i = 0; i < colors.length; i++) {
    fill(colors[i]);

    if (i == colors.length / 2) {
      width = (int)(diam * (solution.length + .25));
      height += diam / 2;
    }

    ellipse(width, height, diam / 2, diam / 2);

    width += diam / 2;
  }

  for (int i = 0; i < solution.length; i++) {
    for (int j = 0; j < field.size(); j++) {
      if (field.get(j)[i] != 0) {
        fill(field.get(j)[i]);
        ellipse(diam / 2 + diam * i, (3 * diam) / 2  + diam * j, diam, diam);
      }
    }
  }

  for (int i = 0; i < solution.length; i++) {
    for (int j = 0; j < hints.size(); j++) {
      if (hints.get(j)[i] != 0) {
        fill(hints.get(j)[i]);
        rect(diam * solution.length + 5 + (20 * i), diam + (diam * j) + 20, 10, 10);
      }
    }
  }

  if (submit) {
    fill(0);
    textSize(25);
    textAlign(CENTER);
    text("SUBMIT", diam * solution.length, 10 + diam + row * diam, 2 * diam, diam);
  }

  if (!running && row < 12) {
    fill(color(0, 255, 255));
    textSize(100);
    textAlign(CENTER);
    text("YOU WIN!", 0, 150, screenWidth, screenHeight);
  } 
  else if (!running) {
    fill(color(255, 0, 255));
    textSize(100);
    textAlign(CENTER);
    text("YOU LOSE!", 0, 150, screenWidth, screenHeight);
  }

  if (cursor != 0) {
    fill(color(cursor));
    ellipse(mouseX, mouseY, diam / 2, diam / 2);
  }
}

void drawPin(int position, int row, int colour) {
  fill(colour);
  ellipse(diam / 2 + diam * position, (3 * diam) / 2 + diam * row, diam, diam);
}

void mousePressed() {
  if (running) {
    getCursorColor();
    setFieldColor();
    submit();
  }
}

void getCursorColor() {
  for (int i = 0; i < colors.length / 2; i++) {
    if (mouseX > diam * solution.length + i * (diam / 2) && mouseX < diam * solution.length + (i + 1) * diam && mouseY > 0 && mouseY < diam) {
      cursor = mouseY < diam / 2 ? colors[i] : colors[i + colors.length / 2];
    }
  }

  pickUpColor = false;

  for (int i = 0; i < solution.length; i++) {
    if (mouseX > diam * i && mouseX < diam + diam * i && mouseY > diam + diam * row && mouseY < 2 * diam + diam * row && cursor == 0) {
      cursor = field.get(row)[i];
      pickUpColor = true;
    }
  }
}

void setFieldColor() {
  for (int i = 0; i < solution.length; i++) {
    if (mouseX > diam * i && mouseX < diam + diam * i && mouseY > diam + diam * row && mouseY < 2 * diam + diam * row && cursor != 0) {
      field.get(row)[i] = cursor;

      for (int j = 0; j < solution.length; j++) {
        if (field.get(row)[j] == cursor && i != j) {
          field.get(row)[j] = 0;
        }
      }

      if (!pickUpColor) cursor = 0;
    }
  }
}

void submit() {
  submit = true;

  for (int i = 0; i < solution.length; i++) {
    if (field.get(row)[i] == 0) {
      submit = false;
    }
  }

  if (mouseX > diam * solution.length && mouseX < screenWidth && mouseY > diam + diam * row && mouseY < 2 * diam + diam * row && submit) {
    submit = false;
    setHints();

    if (running) {
      row++;
      field.add(new int[5]);
      hints.add(new int[5]);
    }
  }

  if (row >= 12)
  {
    running = false;
  }
}

void setHints() {
  int white = 0;
  int black = 0;

  for (int i = 0; i < solution.length; i++) {
    for (int j = 0; j < solution.length; j++) {
      if (field.get(row)[i] == solution[j])
        if (i == j) black++;
        else white++;
    }
  }

  if (black == solution.length) {
    running = false;
  }

  for (int i = 0; i < white; i++) {
    hints.get(row)[i] = color(255);
  }

  for (int i = 0; i < black; i++) {
    hints.get(row)[i + white] = color(0);
  }
}


