
// settings
int leftmargin = 10;
int rightmargin = 20;
int textSize = 40;

String buff = ""; //store text in this in reverse order

float lineHeight;

void setup()
{
  size(650, 130);

  textSize(textSize);
  // get line height be measuring letters
  lineHeight = textDescent() + textAscent();
}

void draw()
{
  background(255);

  if ((millis() % 500) < 250) {  // Only fill cursor half the time
    noFill();
  }
  else {
    fill(0);
  }

  float rPos;
  // Store the cursor rectangle's position
  rPos = textWidth(buff)+leftmargin;

  // draw cursor
  rect(rPos+1, 0 + textDescent(), textWidth(" ")/4, lineHeight);


  fill(0);
  pushMatrix();
  translate(rPos, lineHeight);
  char k;
  // since letters are put in buffer backwards
  // draw one letter at a time moving back with
  // translate at each letter
  for (int i=0;i<buff.length();i++) {
    k = buff.charAt(i);
    translate(-textWidth(k), 0);
    text(k, 0, 0);
  }
  popMatrix();
}

void keyPressed()
{
  char k;
  k = (char)key;
  switch(k) {
  case 8:
    if (buff.length()>0) {
      // 8 is the code of the delete key
      // remove last letter by getting substring
      // that starts at 1 (not 0, the 1st one)
      buff = buff.substring(1);
    }
    break;
  case 13:  // Avoid special keys
  case 10:
  case 65535:
  case 127:
  case 27:
    break;
  default:
    // tests to see if text is beyond margins
    if (textWidth(buff+k)+leftmargin < width-rightmargin) {
      // letters are backwards becasue of order of addition
      // if you wanted to use this in a different way, just reverse:
      // buff + k
      buff=k+buff;
    }
    break;
  }
}

