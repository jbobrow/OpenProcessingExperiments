
double[] charFreq = new double[]{8.167, 1.492, 2.782, 4.253, 12.702, 2.228, 2.015, 6.094, 6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 1.929, 0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.360, 0.150, 1.974, 0.074};
double[] inputCharFreq = new double[26];
int[] inputCharCount = new int[26];
boolean[] keys;
int SCALE_CONSTANT = 360;

void setup(){
  size(700, 700);
  PFont myFont = createFont("Arial", 14);
  textFont(myFont);
  keys = new boolean[526];
  for(int i = 0; i < 26; i++)
    inputCharCount[i] = 0;
}

void draw(){
  background(0);
  if(mousePressed){
    float s_point = 0;
    for(int c = 0; c < charFreq.length; c++){
      float s_degrees = new Float(charFreq[c]/100.0 * SCALE_CONSTANT);
      fill(c * 8, 50, 150, 200);
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(s_point + s_degrees/2.0));
      fill(c * 8, 50, 150);    
      text((char) (c+97) + "    " + new Float(charFreq[c]) + "%", 270, 0);
      popMatrix();
      stroke(0);
      arc(width/2, height/2, 500, 500, radians(s_point), radians(s_point + s_degrees));
      stroke(255, 25);
      line(width/2, height/2, width/2 + 250 * cos(radians(s_point)), height/2 + 250 * sin(radians(s_point)));
      s_point += s_degrees;
    }
  }
  else{
    float s_point = 0;
    for(int c = 0; c < charFreq.length; c++){
      float s_degrees = new Float(inputCharFreq[c] * SCALE_CONSTANT);
      fill(c * 8, 50, 150, 200);
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(s_point + s_degrees/2.0));
      fill(c * 8, 50, 150);    
      text((char) (c+97) + "    " + new Float(inputCharFreq[c]) + "%", 270, 0);
      popMatrix();
      stroke(0);
      arc(width/2, height/2, 500, 500, radians(s_point), radians(s_point + s_degrees));
      stroke(255, 25);
      line(width/2, height/2, width/2 + 250 * cos(radians(s_point)), height/2 + 250 * sin(radians(s_point)));
      s_point += s_degrees;
    }
  }    
  
}

boolean checkKey(String k)
{
  for (int i = 0; i < keys.length; i++)
    if (KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) return keys[i];  
  return false;
}

void keyPressed()
{ 
  keys[keyCode] = true;
  for(int i = 0; i < 26; i++)
    if (checkKey("" + (char) (i + 97))) 
      inputCharCount[i]++;
  if(checkKey("BACKSPACE")){
    for(int i = 0; i < 26; i++)
      inputCharCount[i] = 0;
  }
  inputCharFreq = getPercents(inputCharCount);
}

double[] getPercents(int[] charCount){
  int sum = 0;
  double[] freq = new double[charCount.length];
  for(int i = 0; i < charCount.length; i++)
    sum += charCount[i];
  for(int i = 0; i < charCount.length; i++)
    freq[i] = charCount[i]/(sum+0.0);
  return freq;
}

void keyReleased()
{ 
  keys[keyCode] = false;
}

